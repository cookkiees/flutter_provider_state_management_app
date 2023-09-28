import 'package:flutter/foundation.dart';

class MyAppLogger {
  static void logInfo(String message) {
    if (kDebugMode) {
      print('INFO: $message');
    }
  }

  static void logError(String message) {
    if (kDebugMode) {
      print('ERROR: $message');
    }
  }

  static void logDebug(String message) {
    if (kDebugMode) {
      print('DEBUG: $message');
    }
  }
}
