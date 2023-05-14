abstract class AppConstant {
  // Storage
  static const String storageKeyAuthToken = 'appAuthToken';

  // Flavor config
  static const String flavorVariableBannerTextKey = 'flavorVariableBannerText';

  // Logging
  static const bool doLoggingInReleaseMode = true;

  // Validation
  static const passwordPattern = r'^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$';
  static const emailPattern =
      r'^[a-zA-Z0-9.!#$%&’*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$';
}
