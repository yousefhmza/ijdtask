import 'package:connectivity_plus/connectivity_plus.dart';

class NetworkInfo {
  final Connectivity _connectivity;

  NetworkInfo(this._connectivity);

  Future<bool> get hasConnection async {
    final List<ConnectivityResult> result = await _connectivity.checkConnectivity();
    return result.contains(ConnectivityResult.mobile) || result.contains(ConnectivityResult.wifi);
  }
}
