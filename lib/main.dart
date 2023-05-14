import 'dart:async';

import 'package:flutter/services.dart';
import 'package:flutter_flavor/flutter_flavor.dart';

import 'application/application.dart';
import 'presentation/presentation.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Environment.load();

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  FlavorConfig(
    name: Environment.getVar(EnvVar.bannerText),
    location: BannerLocation.bottomStart,
    color: Colors.red,
    variables: {
      // AppConstant.flavorVariableBannerTextKey:
      // Environment.getVar(EnvVar.bannerText),
    },
  );

  await runZonedGuarded(() async {
    runApp(AppMain());
  }, (error, stackTrace) {
    logger.e(error);
    logger.e(stackTrace);
    // FirebaseCrashlytics.instance.recordError(
    //   error,
    //   stackTrace,
    //   fatal: true,
    // );
  });
}
