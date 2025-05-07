import 'dart:developer' as dev;

class AppLog {
  static void log(Object message, {String? prefix = ''}) {
    dev.log('====== app_log ====== $prefix-> $message ======');
  }
}
