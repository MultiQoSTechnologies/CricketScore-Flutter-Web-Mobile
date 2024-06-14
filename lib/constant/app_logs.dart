import 'package:flutter/foundation.dart';

class AppLogs {
  static void debugPrint(String message) {
    if (kDebugMode) {
      print(message);
    }
  }
}