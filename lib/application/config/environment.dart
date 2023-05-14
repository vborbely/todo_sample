import 'package:bloc_sample/application/application.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

abstract class Environment {
  static const String dotEnvFilePath = String.fromEnvironment('dotenvFileName');

  static Future<void> load() async {
    try {
      await dotenv.load(fileName: dotEnvFilePath);
      logger.i('$dotEnvFilePath file loaded');
    } catch (e) {
      logger.e(e);
    }
  }

  static String? getVar(EnvVar varName) {
    return dotenv.env[varName.name];
  }
}

enum EnvVar {
  bannerText,
  logLevel,
  baseUrl,
}
