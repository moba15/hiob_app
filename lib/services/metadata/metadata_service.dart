import 'package:package_info_plus/package_info_plus.dart';

class AppMetadata {
  final String appName;
  final String version;
  final String buildNumber;

  const AppMetadata({
    required this.appName,
    required this.version,
    required this.buildNumber,
  });

  @override
  String toString() =>
      'AppMetadata(appName: $appName, version: $version, buildNumber: $buildNumber)';
}

class MetadataService {
  final AppMetadata _metadata;

  MetadataService._(this._metadata);

  /// Async factory to load metadata during construction.
  static Future<MetadataService> create() async {
    try {
      final info = await PackageInfo.fromPlatform();
      final meta = AppMetadata(
        appName: info.appName.isNotEmpty ? info.appName : 'unknown',
        version: info.version.isNotEmpty ? info.version : '0.0.0',
        buildNumber: info.buildNumber.isNotEmpty ? info.buildNumber : '0',
      );
      return MetadataService._(meta);
    } catch (_) {
      return MetadataService._(
        const AppMetadata(
          appName: 'unknown',
          version: '0.0.0',
          buildNumber: '0',
        ),
      );
    }
  }

  AppMetadata get metadata => _metadata;
  String get appName => _metadata.appName;
  String get version => _metadata.version;
  String get buildNumber => _metadata.buildNumber;
}
