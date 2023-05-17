import 'dart:convert';
import 'dart:typed_data';

import 'package:bloc_sample/data/data.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../application/application.dart';

class StorageService {
  Uint8List? _encryptionKey;
  final List<StorageType> _boxes = [
    StorageType.preferences,
    StorageType.loginCredentials,
  ];
  final List<Box> _openBoxes = [];

  Stream<BoxEvent> boxStream(StorageType box) =>
      _openBoxes[StorageType.preferences.index].watch();

  Future<void> init() async {
    await initializeAdapters();
    await initializeSecureStorage();
    await initializeBoxes();
  }

  Future<void> initializeSecureStorage() async {
    const keyName = 'key';
    const secureStorage = FlutterSecureStorage();
    final encryptionKeyString = await secureStorage.read(key: keyName);
    if (encryptionKeyString == null) {
      final key = Hive.generateSecureKey();
      await secureStorage.write(
        key: keyName,
        value: base64UrlEncode(key),
      );
    }
    final key = await secureStorage.read(key: keyName);
    _encryptionKey = base64Url.decode(key!);
    logger.d('Encryption key Uint8List: $_encryptionKey');
  }

  Future<void> initializeBoxes() async {
    final key = _encryptionKey;

    if (key != null) {
      for (final box in _boxes) {
        final openBox = await Hive.openBox(box.name,
            encryptionCipher: box.secured ? HiveAesCipher(key) : null);
        _openBoxes.add(openBox);
      }
    } else {
      logger.e('Encryption key is null');
    }
  }

  HivePreferences? readPreferences(String key) {
    return _read<HivePreferences>(key, StorageType.preferences.name);
  }

  Future<HivePreferences?> writePreferences(HivePreferences item) async {
    return await _write<HivePreferences>(item, StorageType.preferences.name);
  }

  Future<bool> deletePreferences(HivePreferences item) async {
    return await _delete(item, StorageType.preferences.name);
  }

  E? _read<E extends HiveBaseObj>(String key, String boxName) {
    try {
      final box = _boxByName(boxName);
      return box.get(key) as E?;
    } catch (e) {
      logger.e(e);
    }
    return null;
  }

  Future<E?> _write<E extends HiveBaseObj>(E item, String boxName) async {
    try {
      final box = _boxByName(boxName);

      await box.put(item.keyName, item);
      return box.get(item.keyName) as E?;
    } catch (e) {
      logger.e(e);
    }
    return null;
  }

  Future<bool> _delete<E extends HiveBaseObj>(E item, String boxName) async {
    try {
      final box = _boxByName(boxName);
      await box.delete(item.keyName);
      return true;
    } catch (e) {
      logger.e(e);
    }
    return false;
  }

  Box _boxByName(String name) =>
      _openBoxes.where((box) => box.name == name).first;

  Future<void> initializeAdapters() async {
    await Hive.initFlutter();
    if (!Hive.isAdapterRegistered(0)) {
      Hive.registerAdapter(HiveBaseObjAdapter());
    }
    if (!Hive.isAdapterRegistered(1)) {
      Hive.registerAdapter(HivePreferencesAdapter());
    }
    if (!Hive.isAdapterRegistered(2)) {
      Hive.registerAdapter(PreferencesTypeAdapter());
    }
  }
}

enum StorageType {
  preferences('preferences', true),
  loginCredentials('loginCredentials', true);

  final String name;
  final bool secured;

  const StorageType(this.name, this.secured);
}
