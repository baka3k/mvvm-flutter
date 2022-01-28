import 'package:connectivity_plus/connectivity_plus.dart';

abstract class NetworkInfor {
  bool isNetworkConnected();
}

class NetworkInforImpl implements NetworkInfor {
  @override
  isNetworkConnected() async {
    Connectivity connectivity = Connectivity();
    var connectivityResult = await connectivity.checkConnectivity();
    return connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi;
  }
}
