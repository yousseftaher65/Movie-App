import 'package:flutter/foundation.dart';

class AppLogger {
  final String message;
  AppLogger(this.message) {
    if (kDebugMode) {
      debugPrint(message);
    }
  }
}
