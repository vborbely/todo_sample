import 'package:logger/logger.dart';

import '../application.dart';

final logger = Logger(
    filter: MyLogFilter(),
    printer: PrettyPrinter(),
    level: Level.values.asNameMap()[Environment.getVar(EnvVar.logLevel)] ??
        Level.warning);

class MyLogFilter extends LogFilter {
  @override
  bool shouldLog(LogEvent event) {
    return AppConstant.doLoggingInReleaseMode;
  }
}
