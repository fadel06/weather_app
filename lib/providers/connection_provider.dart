import 'dart:io';

import 'package:flutter/material.dart';
import 'package:weather_app/common/constant.dart';

class ConnectionProvider extends ChangeNotifier {
  String _message = "";
  String get message => _message;

  late ConnectionStatus _connectionStatus;
  ConnectionStatus get connectionStatus => _connectionStatus;

  Future<void> checkUserConnection() async {
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        _connectionStatus = ConnectionStatus.connected;
        notifyListeners();
      }
    } on SocketException catch (_) {
      _connectionStatus = ConnectionStatus.notConnected;
      _message = "Mohon periksa kembali koneksi anda";
      notifyListeners();
    }
  }
}
