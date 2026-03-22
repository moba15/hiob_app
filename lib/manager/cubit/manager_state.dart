part of 'manager_cubit.dart';

enum ManagerStatus { finished, loading, changeLog }

enum ServiceLoadStatus { pending, loading, loaded, failed }

class ServiceLoadEntry extends Equatable {
  final String key;
  final String label;
  final ServiceLoadStatus status;
  final String? error;

  const ServiceLoadEntry({
    required this.key,
    required this.label,
    required this.status,
    this.error,
  });

  ServiceLoadEntry copyWith({
    String? key,
    String? label,
    ServiceLoadStatus? status,
    String? error,
  }) {
    return ServiceLoadEntry(
      key: key ?? this.key,
      label: label ?? this.label,
      status: status ?? this.status,
      error: error,
    );
  }

  @override
  List<Object?> get props => [key, label, status, error];
}

class ManagerState extends Equatable {
  final ManagerStatus status;
  final List<ServiceLoadEntry> services;
  final String? startupError;

  const ManagerState({
    required this.status,
    this.services = const [],
    this.startupError,
  });

  ManagerState copyWith({
    ManagerStatus? status,
    List<ServiceLoadEntry>? services,
    String? startupError,
  }) {
    return ManagerState(
      status: status ?? this.status,
      services: services ?? this.services,
      startupError: startupError,
    );
  }

  @override
  List<Object?> get props {
    return [status, services, startupError];
  }
}
