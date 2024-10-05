import 'dart:developer';

import 'package:logging/logging.dart';

abstract class AppLogging {
  static Logger init({bool debug = false}) {
    final logger = Logger.root;

    if (debug) {
      logger.level = Level.INFO;
    } else {
      logger.level = Level.FINE;
    }

    logger.onRecord.listen(
      (record) => log(
        record.message,
        error: record.error,
        stackTrace: record.stackTrace,
      ),
    );

    return logger;
  }
}
