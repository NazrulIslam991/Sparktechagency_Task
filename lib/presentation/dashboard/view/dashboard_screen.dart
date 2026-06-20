import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sparktechagency_task/core/resources/constant/color_manager.dart';
import 'package:sparktechagency_task/core/routes/route_name.dart';

import '../../../core/resources/constant/style_manager.dart';
import '../../widgets/dashboard_info_card.dart';
import '../../widgets/dashboard_section_card.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

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
              onTap: () {
                /// share my pulse
              },
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
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
        child: Column(
          children: [
            /// ********************  BATTERY & HEALTH ********************
            DashboardSectionCard(
              title: "Battery & Health",
              items: [
                DashboardInfoCard(
                  label: "Battery Level",
                  value: "85%",
                  icon: Icons.battery_charging_full_rounded,
                  color: Colors.greenAccent,
                ),
                DashboardInfoCard(
                  label: "Temperature",
                  value: "32°C",
                  icon: Icons.thermostat_rounded,
                  color: Colors.orangeAccent,
                ),
                DashboardInfoCard(
                  label: "Health Status",
                  value: "Good",
                  icon: Icons.favorite_rounded,
                  color: Colors.redAccent,
                ),
              ],
            ),

            SizedBox(height: 25.h),

            /// ********************  PHYSICAL ACTIVITY ********************
            DashboardSectionCard(
              title: "Physical Activity",
              items: [
                DashboardInfoCard(
                  label: "Step Count",
                  value: "1,240",
                  icon: Icons.directions_walk_rounded,
                  color: Colors.purpleAccent,
                ),
                DashboardInfoCard(
                  label: "Activity Status",
                  value: "Walking",
                  icon: Icons.accessibility_new_rounded,
                  color: Colors.tealAccent,
                ),
              ],
            ),

            SizedBox(height: 25.h),

            /// ******************** WIFI INFO ********************
            DashboardSectionCard(
              title: "Wi-Fi Network",
              items: [
                DashboardInfoCard(
                  label: "SSID",
                  value: "Home_WiFi",
                  icon: Icons.wifi_rounded,
                  color: Colors.blueAccent,
                ),
                DashboardInfoCard(
                  label: "Signal Strength",
                  value: "-65 dBm",
                  icon: Icons.signal_cellular_alt_rounded,
                  color: Colors.indigoAccent,
                ),
                DashboardInfoCard(
                  label: "Local IP",
                  value: "192.168.1.5",
                  icon: Icons.lan_rounded,
                  color: Colors.brown,
                ),
              ],
            ),

            SizedBox(height: 25.h),

            /// ******************** CARRIER & SIM ********************
            DashboardSectionCard(
              title: "Mobile Network",
              items: [
                DashboardInfoCard(
                  label: "Carrier Name",
                  value: "GP",
                  icon: Icons.sim_card_rounded,
                  color: Colors.deepPurpleAccent,
                ),
                DashboardInfoCard(
                  label: "Signal Strength",
                  value: "-70 dBm",
                  icon: Icons.network_cell_rounded,
                  color: Colors.blueGrey,
                ),
                DashboardInfoCard(
                  label: "SIM State",
                  value: "Ready",
                  icon: Icons.check_circle_rounded,
                  color: Colors.green,
                ),
              ],
            ),

            SizedBox(height: 25.h),

            /// ********************  DEVICE INFO  ***********************
            DashboardSectionCard(
              title: "Device Information",
              items: [
                DashboardInfoCard(
                  label: "Device Model",
                  value: "Samsung A54",
                  icon: Icons.phone_android_rounded,
                  color: Colors.lightBlueAccent,
                ),
                DashboardInfoCard(
                  label: "Android Version",
                  value: "Android 14",
                  icon: Icons.android_rounded,
                  color: Colors.greenAccent,
                ),
                DashboardInfoCard(
                  label: "Device Name",
                  value: "Nayon's Phone",
                  icon: Icons.smartphone_rounded,
                  color: Colors.amber,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
