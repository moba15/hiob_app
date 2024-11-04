import 'package:grpc/src/server/call.dart';
import 'package:smart_home/generated/login/login.pbgrpc.dart';

class LoginService extends LoginServiceBase {
  @override
  Future<CompatibilityResponse> checkCompatibility(
      ServiceCall call, CompatibilityRequest request) {
    // TODO: implement checkCompatibility
    throw UnimplementedError();
  }

  @override
  Future<LoginResponse> login(ServiceCall call, LoginRequest request) {
    // TODO: implement login
    throw UnimplementedError();
  }
}
