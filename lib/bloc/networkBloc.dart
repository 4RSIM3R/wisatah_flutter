import 'dart:async';
import 'dart:io';
import 'package:connectivity/connectivity.dart';
import 'package:rxdart/rxdart.dart';

class NetworkBloc {

     //This creates the single instance by calling the `_internal` constructor specified below
    static final NetworkBloc _singleton = new NetworkBloc._internal();
    NetworkBloc._internal();

    //This is what's used to retrieve the instance through the app
    static NetworkBloc getInstance() => _singleton;

  //Streamcontroller + broadcast = BehaviorSubject
  bool hasConnection = false;
  BehaviorSubject connectionChangeController = BehaviorSubject.seeded(false);
  final Connectivity connectivity = Connectivity();

  void initialize() {
    connectivity.onConnectivityChanged.listen(_connectionChange);
    checkConnection();
  }

  Stream get connectionChange => connectionChangeController.stream;

  void dispose() {
    connectionChangeController.close();
  }

  void _connectionChange(ConnectivityResult connectivityResult) {
    checkConnection();
  }

  Future<bool> checkConnection() async {
    bool previousConnection = hasConnection;

    try {
      final result = await InternetAddress.lookup("google.com");
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        hasConnection = true;
        connectionChangeController.add(true);
        print("Ada Koneksi");
      } else {
        hasConnection = false;
        connectionChangeController.add(false);
        print("Tidak Ada Koneksi");
      }
    } on SocketException catch (_) {
      hasConnection = false;
      connectionChangeController.add(false);
      print("Tidak Ada Koneksi");
    }
    //The connection status changed send out an update to all listeners
    // if (previousConnection != hasConnection) {
    //   connectionChangeController.add(hasConnection);
    // }
    return hasConnection;
  }
}
