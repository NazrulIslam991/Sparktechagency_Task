import 'package:sparktechagency_task/data/models/received_data_model.dart';

class DashboardState {
  final Map<String, dynamic>? deviceData;
  final bool isLoading;
  final List<ReceivedDataModel> devices;

  DashboardState({
    this.deviceData,
    this.isLoading = true,
    this.devices = const [],
  });

  DashboardState copyWith({
    Map<String, dynamic>? deviceData,
    bool? isLoading,
    List<ReceivedDataModel>? devices,
  }) {
    return DashboardState(
      deviceData: deviceData ?? this.deviceData,
      isLoading: isLoading ?? this.isLoading,
      devices: devices ?? this.devices,
    );
  }
}
