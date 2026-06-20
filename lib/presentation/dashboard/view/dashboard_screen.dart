import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:sparktechagency_task/core/resources/constant/color_manager.dart';
import 'package:sparktechagency_task/core/routes/route_name.dart';

import '../../../core/resources/constant/style_manager.dart';
import '../../../core/services/device_service.dart';
import '../../widgets/dashboard_info_card.dart';
import '../../widgets/dashboard_section_card.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  Map<String, dynamic>? deviceData;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    init();
  }

  Future<void> init() async {
    await requestPermissions();
    await loadDeviceData();
  }

  ///  PERMISSION REQUEST
  Future<void> requestPermissions() async {
    await [
      Permission.location, // WiFi SSID
      Permission.phone, // SIM info
      Permission.activityRecognition, // future step counter
    ].request();
  }

  ///  LOAD DATA
  Future<void> loadDeviceData() async {
    try {
      final data = await DeviceService.getDeviceData();
      setState(() {
        deviceData = data;
        isLoading = false;
      });
    } catch (e) {
      setState(() {
        isLoading = false;
      });
    }
  }

  String getValue(String key) {
    if (deviceData == null) return "Loading...";
    return deviceData![key]?.toString() ?? "N/A";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.black6,
      appBar: AppBar(
        title: Text(
          "Device Pulse",
          style: getSemiBoldStyle18_600(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: ColorManager.black6,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
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
              leading: const Icon(Icons.share, color: Colors.blueAccent),
              title: Text(
                "Share My Pulse",
                style: getMediumStyle14_500(color: Colors.white),
              ),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.history, color: Colors.tealAccent),
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

      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : RefreshIndicator(
              onRefresh: loadDeviceData,
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
                physics: const AlwaysScrollableScrollPhysics(),
                child: Column(
                  children: [
                    ///  Battery
                    DashboardSectionCard(
                      title: "Battery & Health",
                      items: [
                        DashboardInfoCard(
                          label: "Battery Level",
                          value: getValue("batteryLevel"),
                          icon: Icons.battery_charging_full_rounded,
                          color: Colors.greenAccent,
                        ),
                        DashboardInfoCard(
                          label: "Temperature",
                          value: getValue("temperature"),
                          icon: Icons.thermostat_rounded,
                          color: Colors.orangeAccent,
                        ),
                        DashboardInfoCard(
                          label: "Health Status",
                          value: getValue("health"),
                          icon: Icons.favorite_rounded,
                          color: Colors.redAccent,
                        ),
                      ],
                    ),

                    SizedBox(height: 25.h),

                    ///  Activity
                    DashboardSectionCard(
                      title: "Physical Activity",
                      items: [
                        DashboardInfoCard(
                          label: "Step Count",
                          value: getValue("steps"),
                          icon: Icons.directions_walk_rounded,
                          color: Colors.purpleAccent,
                        ),
                        DashboardInfoCard(
                          label: "Activity Status",
                          value: getValue("activity"),
                          icon: Icons.accessibility_new_rounded,
                          color: Colors.tealAccent,
                        ),
                      ],
                    ),

                    SizedBox(height: 25.h),

                    ///  WiFi
                    DashboardSectionCard(
                      title: "Wi-Fi Network",
                      items: [
                        DashboardInfoCard(
                          label: "SSID",
                          value: getValue("ssid"),
                          icon: Icons.wifi_rounded,
                          color: Colors.blueAccent,
                        ),
                        DashboardInfoCard(
                          label: "Signal Strength",
                          value: getValue("rssi"),
                          icon: Icons.signal_cellular_alt_rounded,
                          color: Colors.indigoAccent,
                        ),
                        DashboardInfoCard(
                          label: "Local IP",
                          value: getValue("ip"),
                          icon: Icons.lan_rounded,
                          color: Colors.brown,
                        ),
                      ],
                    ),

                    SizedBox(height: 25.h),

                    ///  Network
                    DashboardSectionCard(
                      title: "Mobile Network",
                      items: [
                        DashboardInfoCard(
                          label: "Carrier Name",
                          value: getValue("carrier"),
                          icon: Icons.sim_card_rounded,
                          color: Colors.deepPurpleAccent,
                        ),
                        DashboardInfoCard(
                          label: "Signal Strength",
                          value: getValue("signal"),
                          icon: Icons.network_cell_rounded,
                          color: Colors.blueGrey,
                        ),
                        DashboardInfoCard(
                          label: "SIM State",
                          value: getValue("simState"),
                          icon: Icons.check_circle_rounded,
                          color: Colors.green,
                        ),
                      ],
                    ),

                    SizedBox(height: 25.h),

                    ///  Device
                    DashboardSectionCard(
                      title: "Device Information",
                      items: [
                        DashboardInfoCard(
                          label: "Device Model",
                          value: getValue("model"),
                          icon: Icons.phone_android_rounded,
                          color: Colors.lightBlueAccent,
                        ),
                        DashboardInfoCard(
                          label: "Android Version",
                          value: getValue("android"),
                          icon: Icons.android_rounded,
                          color: Colors.greenAccent,
                        ),
                        DashboardInfoCard(
                          label: "Device Name",
                          value: getValue("deviceName"),
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
}
