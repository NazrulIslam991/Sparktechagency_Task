import 'package:flutter_riverpod/legacy.dart';

import '../../../core/services/device_info_service.dart';
import '../../../core/services/lan_service.dart';
import '../../../data/models/dashboard_state.dart';
import '../../../data/models/received_data_model.dart';
import '../../../data/sources/shares_preference/shared_preference.dart';

/// ********************** PROVIDER **********************
final dashboardProvider =
    StateNotifierProvider<DashboardViewModel, DashboardState>((ref) {
      return DashboardViewModel();
    });

/// ********************** VIEWMODEL class **********************
class DashboardViewModel extends StateNotifier<DashboardState> {
  DashboardViewModel() : super(DashboardState());

  final LanService lanService = LanService();

  /// ******* INIT FUNCTION ********
  Future<void> init() async {
    await loadDeviceData();
    startLan();
  }

  /// ********* LOAD DEVICE DATA ********
  Future<void> loadDeviceData() async {
    try {
      final data = await DeviceInfoService.getDeviceData();

      state = state.copyWith(deviceData: data, isLoading: false);
    } catch (e) {
      state = state.copyWith(isLoading: false);
    }
  }

  /// ******* START LAN SYSTEM ***********
  Future<void> startLan() async {
    await lanService.startListening();
    await lanService.startServer();

    lanService.onDeviceFound = (data, ip) {
      final devices = [...state.devices];

      final index = devices.indexWhere((d) => d.ip == ip);

      if (index >= 0) {
        devices[index].lastSeen = DateTime.now();
      } else {
        devices.add(
          ReceivedDataModel(ip: ip, data: data, lastSeen: DateTime.now()),
        );
      }

      state = state.copyWith(devices: devices);
    };

    lanService.onRequestReceived = (ip, data) async {
      await ReceivedStorageService.saveReceivedData(data, ip);
    };

    lanService.startBroadcast(state.deviceData ?? {});
  }

  /// ************** SEND REQUEST *************
  void sendRequest(String ip) {
    lanService.sendRequest(ip, state.deviceData ?? {});
  }

  /// *********** SEND RESPONSE *************
  void sendResponse(String ip) {
    lanService.sendResponse(ip, state.deviceData ?? {});
  }

  /// ********** GET DEVICE VALUE  **********
  String getValue(String key) {
    if (state.deviceData == null) return "Loading...";
    return state.deviceData![key]?.toString() ?? "N/A";
  }
}
