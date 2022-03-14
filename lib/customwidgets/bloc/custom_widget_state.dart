part of 'custom_widget_bloc.dart';

class CustomWidgetState extends Equatable {
  final Device device;
  final Map<String, dynamic> settings;

  const CustomWidgetState({required this.device, required this.settings});

  @override
  List<Object> get props => [];
}
