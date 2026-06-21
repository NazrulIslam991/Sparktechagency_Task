import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../../core/resources/constant/color_manager.dart';
import '../../../core/resources/constant/style_manager.dart';
import '../../../core/routes/route_name.dart';
import '../../widgets/dashboard_info_card.dart';
import '../../widgets/dashboard_section_card.dart';
import '../viewmodel/dashboard_viewmodel.dart';

class DashboardScreen extends ConsumerStatefulWidget {
  const DashboardScreen({super.key});

  @override
  ConsumerState<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends ConsumerState<DashboardScreen> {
  @override
  void initState() {
    super.initState();
    init();
  }

  /// ************* INIT function ******************
  Future<void> init() async {
    await requestPermissions();
    await ref.read(dashboardProvider.notifier).init();
    ref
        .read(dashboardProvider.notifier)
        .lanService
        .onRequestReceived = (ip, data) {
      showPermissionDialog(ip, data);
    };
  }

  /// ************* PERMISSION ****************
  Future<void> requestPermissions() async {
    await [
      Permission.location,
      Permission.phone,
      Permission.activityRecognition,
    ].request();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(dashboardProvider);
    final vm = ref.read(dashboardProvider.notifier);

    return Scaffold(
      backgroundColor: ColorManager.black6,

      /// ************* APPBAR ***************
      appBar: AppBar(
        title: Text(
          "Device Pulse",
          style: getSemiBoldStyle18_600(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: ColorManager.black6,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.white),
      ),

      /// ************** DRAWER ****************
      drawer: Drawer(
        backgroundColor: ColorManager.green700,
        child: Column(
          children: [
            DrawerHeader(
              decoration: BoxDecoration(color: ColorManager.surfaceDark),
              child: Center(
                child: Text(
                  "Menu",
                  style: getSemiBoldStyle18_600(color: Colors.white),
                ),
              ),
            ),

            ListTile(
              leading: Icon(Icons.share, color: Colors.blueAccent),
              title: Text(
                "Share My Pulse",
                style: getMediumStyle14_500(color: Colors.white),
              ),
              onTap: () {
                Navigator.pop(context);
                showDeviceBottomSheet();
              },
            ),

            ListTile(
              leading: Icon(Icons.history, color: Colors.tealAccent),
              title: Text(
                "Received Data",
                style: getMediumStyle14_500(color: Colors.white),
              ),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, RouteName.receivedDataScreen);
              },
            ),
          ],
        ),
      ),

      /// ************** BODY *****************
      body: state.isLoading
          ? const Center(child: CircularProgressIndicator())
          : RefreshIndicator(
              onRefresh: vm.loadDeviceData,
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
                physics: const AlwaysScrollableScrollPhysics(),
                child: Column(
                  children: [
                    /// ************* BATTERY *************
                    DashboardSectionCard(
                      title: "Battery & Health",
                      items: [
                        DashboardInfoCard(
                          label: "Battery Level",
                          value: vm.getValue("batteryLevel"),
                          icon: Icons.battery_charging_full_rounded,
                          color: Colors.greenAccent,
                        ),
                        DashboardInfoCard(
                          label: "Temperature",
                          value: vm.getValue("temperature"),
                          icon: Icons.thermostat_rounded,
                          color: Colors.orangeAccent,
                        ),
                        DashboardInfoCard(
                          label: "Health Status",
                          value: vm.getValue("health"),
                          icon: Icons.favorite_rounded,
                          color: Colors.redAccent,
                        ),
                      ],
                    ),

                    SizedBox(height: 25.h),

                    /// ************* ACTIVITY *************
                    DashboardSectionCard(
                      title: "Physical Activity",
                      items: [
                        DashboardInfoCard(
                          label: "Step Count",
                          value: vm.getValue("steps"),
                          icon: Icons.directions_walk_rounded,
                          color: Colors.purpleAccent,
                        ),
                        DashboardInfoCard(
                          label: "Activity Status",
                          value: vm.getValue("activity"),
                          icon: Icons.accessibility_new_rounded,
                          color: Colors.tealAccent,
                        ),
                      ],
                    ),

                    SizedBox(height: 25.h),

                    /// ************* WIFI *************
                    DashboardSectionCard(
                      title: "Wi-Fi Network",
                      items: [
                        DashboardInfoCard(
                          label: "SSID",
                          value: vm.getValue("ssid"),
                          icon: Icons.wifi_rounded,
                          color: Colors.blueAccent,
                        ),
                        DashboardInfoCard(
                          label: "Signal Strength",
                          value: vm.getValue("rssi"),
                          icon: Icons.signal_cellular_alt_rounded,
                          color: Colors.indigoAccent,
                        ),
                        DashboardInfoCard(
                          label: "Local IP",
                          value: vm.getValue("ip"),
                          icon: Icons.lan_rounded,
                          color: Colors.brown,
                        ),
                      ],
                    ),

                    SizedBox(height: 25.h),

                    /// ************* MOBILE NETWORK *************
                    DashboardSectionCard(
                      title: "Mobile Network",
                      items: [
                        DashboardInfoCard(
                          label: "Carrier Name",
                          value: vm.getValue("carrier"),
                          icon: Icons.sim_card_rounded,
                          color: Colors.deepPurpleAccent,
                        ),
                        DashboardInfoCard(
                          label: "Signal Strength",
                          value: vm.getValue("signal"),
                          icon: Icons.network_cell_rounded,
                          color: Colors.blueGrey,
                        ),
                        DashboardInfoCard(
                          label: "SIM State",
                          value: vm.getValue("simState"),
                          icon: Icons.check_circle_rounded,
                          color: Colors.green,
                        ),
                      ],
                    ),

                    SizedBox(height: 25.h),

                    /// ************* DEVICE INFO *************
                    DashboardSectionCard(
                      title: "Device Information",
                      items: [
                        DashboardInfoCard(
                          label: "Device Model",
                          value: vm.getValue("model"),
                          icon: Icons.phone_android_rounded,
                          color: Colors.lightBlueAccent,
                        ),
                        DashboardInfoCard(
                          label: "Android Version",
                          value: vm.getValue("android"),
                          icon: Icons.android_rounded,
                          color: Colors.greenAccent,
                        ),
                        DashboardInfoCard(
                          label: "Device Name",
                          value: vm.getValue("deviceName"),
                          icon: Icons.smartphone_rounded,
                          color: Colors.amber,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
    );
  }

  /// *************  DEVICE LIST BOTTOM SHEET *************
  void showDeviceBottomSheet() {
    showModalBottomSheet(
      context: context,
      backgroundColor: ColorManager.black500,
      isScrollControlled: true,
      builder: (context) {
        return Consumer(
          builder: (context, ref, _) {
            final state = ref.watch(dashboardProvider);
            final vm = ref.read(dashboardProvider.notifier);

            return Container(
              height: 400.h,
              decoration: BoxDecoration(
                color: ColorManager.black6,
                borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),
              ),
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
              child: Column(
                children: [
                  Container(
                    width: 40.w,
                    height: 4.h,
                    margin: EdgeInsets.only(bottom: 20.h),
                    decoration: BoxDecoration(
                      color: Colors.white24,
                      borderRadius: BorderRadius.circular(2.r),
                    ),
                  ),

                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Nearby Devices",
                      style: getSemiBoldStyle18_600(color: Colors.white),
                    ),
                  ),
                  SizedBox(height: 15.h),

                  Expanded(
                    child: state.devices.isEmpty
                        ? Center(
                            child: Text(
                              "No devices found",
                              style: getRegularStyle16_400(color: Colors.white),
                            ),
                          )
                        : ListView.separated(
                            itemCount: state.devices.length,
                            separatorBuilder: (_, __) =>
                                Divider(color: ColorManager.black300),
                            itemBuilder: (context, index) {
                              final device = state.devices[index];
                              return ListTile(
                                contentPadding: EdgeInsets.zero,
                                leading: CircleAvatar(
                                  backgroundColor: Colors.white10,
                                  child: Icon(
                                    Icons.devices,
                                    color: Colors.cyanAccent,
                                    size: 20.sp,
                                  ),
                                ),
                                title: Text(
                                  device.data["deviceName"] ?? "Unknown",
                                  style: getSemiBoldStyle16_600(
                                    color: Colors.white,
                                  ),
                                ),
                                subtitle: Text(
                                  device.ip,
                                  style: getRegularStyle14_400(
                                    color: ColorManager.grey300,
                                  ),
                                ),
                                trailing: Icon(
                                  Icons.chevron_right,
                                  color: Colors.white30,
                                ),
                                onTap: () {
                                  Navigator.pop(context);
                                  vm.sendRequest(device.ip);
                                },
                              );
                            },
                          ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }

  /// *************  PERMISSION DIALOG *************
  void showPermissionDialog(String ip, Map<String, dynamic> data) {
    final vm = ref.read(dashboardProvider.notifier);

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.grey[900],
          title: Text(
            "Data Share Request",
            style: getSemiBoldStyle16_600(color: Colors.white70),
          ),
          content: Text(
            "Device $ip wants to share data with you.",
            style: getRegularStyle16_400(color: Colors.white70),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text(
                "Reject",
                style: getSemiBoldStyle16_600(color: Colors.redAccent),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
                vm.sendResponse(ip);
              },
              child: Text("Allow"),
            ),
          ],
        );
      },
    );
  }
}
