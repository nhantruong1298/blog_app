import 'package:flutter/foundation.dart';
import 'package:logger/logger.dart';
import 'package:pet_domain/repository/log_service.dart';

class LogServiceImpl implements LogService {
  late final Logger logger;

  LogServiceImpl() {
    logger = Logger(printer: PrefixPrinter(PrettyPrinter(colors: false)));
  }
  @override
  void error(message, [data, stackTrace]) {
    logger.e(message, data, stackTrace);
    if (!kDebugMode) {}
  }

  @override
  void log(data) {
    logger.v(data);
  }

  @override
  void warn(data) {
    logger.w(data);
  }
}
