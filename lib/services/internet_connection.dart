import 'dart:io';

class InternetConnection {
  static Future<bool> internetConnectionChecker() async {
    bool activeConnection = false;
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        activeConnection = true;
      }
    } on SocketException catch (error) {
      activeConnection = false;
    }
    return activeConnection;
  }
}
