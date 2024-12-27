import 'package:connectivity_plus/connectivity_plus.dart';

enum BackgroundReconnectStrategy { wifiOnly, wifiAndMobileVpn, vpnOnly, always }

extension LocalBackgroundReconnectOnExt on BackgroundReconnectStrategy {
  get name {
    switch (this) {
      case BackgroundReconnectStrategy.wifiOnly:
        return "only if wifi connection active";
      case BackgroundReconnectStrategy.vpnOnly:
        return "only if vpn connection active";
      case BackgroundReconnectStrategy.always:
        return "always";
      case BackgroundReconnectStrategy.wifiAndMobileVpn:
        return "only if wifi  or moile with vpn connection active";
    }
  }

  bool checkConnection(List<ConnectivityResult> connectivityResult) {
    switch (this) {
      case BackgroundReconnectStrategy.wifiOnly:
        return connectivityResult.contains(ConnectivityResult.wifi);
      case BackgroundReconnectStrategy.vpnOnly:
        return connectivityResult.contains(ConnectivityResult.vpn);
      case BackgroundReconnectStrategy.always:
        return connectivityResult.contains(ConnectivityResult.wifi) ||
            connectivityResult.contains(ConnectivityResult.mobile);
      case BackgroundReconnectStrategy.wifiAndMobileVpn:
        return connectivityResult.contains(ConnectivityResult.wifi) ||
            (connectivityResult.contains(ConnectivityResult.mobile) &&
                connectivityResult.contains(ConnectivityResult.vpn));
    }
  }
}

enum BackgroundRunnerStrategy { disabled, local, firebaseLocal }

extension BackgroundRunnerStrategyName on BackgroundRunnerStrategy {
  get name {
    switch (this) {
      case BackgroundRunnerStrategy.disabled:
        return "Off";
      case BackgroundRunnerStrategy.local:
        return "Local";
      case BackgroundRunnerStrategy.firebaseLocal:
        return "Firebase & Local";
    }
  }
}

abstract class BackgroundRunner {
  Future<void> init();

  Future<bool> shouldStart();

  Future<void> start();

  Future<void> stop();

  Future<void> logTalker(String msg);
}
