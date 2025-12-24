enum ConnectionStatus {
  disconnected,
  connected,
  loggedIn,
  emptyAES,
  waiting,
  loggingIn,
  connecting,
  tryAgain,
  error,
  loginDeclined,
  newAesKey,
  wrongAesKey,
  wrongAdapterVersion,
}

extension ConnectionStatusExtension on ConnectionStatus {
  bool get isConnected {
    return this == ConnectionStatus.connected ||
        this == ConnectionStatus.loggedIn;
  }
}

interface class ConnectionServiceInterface {
  void connect() {
    throw UnimplementedError();
  }

  T getGrpcService<T>() {
    throw UnimplementedError();
  }

  void reconnect({bool delayed = true}) {
    throw UnimplementedError();
  }

  void disconnect() {
    throw UnimplementedError();
  }

  ConnectionStatus getConnectionStatus() {
    throw UnimplementedError();
  }

  void changeConnectionStatus(ConnectionStatus status, {String? message}) {
    throw UnimplementedError();
  }

  Future<Uri> getUrl() async {
    throw UnimplementedError();
  }

  Stream<ConnectionStatus> get connectionStatusStream {
    throw UnimplementedError();
  }
}
