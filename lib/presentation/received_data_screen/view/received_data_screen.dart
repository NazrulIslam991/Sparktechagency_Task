import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/resources/constant/color_manager.dart';
import '../../../core/resources/constant/style_manager.dart';
import '../viewmodel/received_data_viewmodel.dart';

class ReceivedDataScreen extends ConsumerStatefulWidget {
  const ReceivedDataScreen({super.key});

  @override
  ConsumerState<ReceivedDataScreen> createState() => _ReceivedDataScreenState();
}

class _ReceivedDataScreenState extends ConsumerState<ReceivedDataScreen> {
  /// ************* initial data load *********************
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      ref.read(receivedDataProvider.notifier).loadData();
    });
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(receivedDataProvider);
    final vm = ref.read(receivedDataProvider.notifier);

    return Scaffold(
      backgroundColor: ColorManager.black6,

      /// ************ APP BAR ************
      appBar: AppBar(
        title: Text(
          "Received Data",
          style: getSemiBoldStyle18_600(color: Colors.white),
        ),
        backgroundColor: ColorManager.black6,
        actions: [
          IconButton(
            icon: Icon(Icons.refresh, color: Colors.white),
            onPressed: vm.loadData,
          ),
        ],
      ),

      /// ************  BODY ************
      body: state.isLoading
          ? const Center(child: CircularProgressIndicator())
          : state.history.isEmpty
          ? emptyStateView()
          : ListView.builder(
              padding: EdgeInsets.all(16.w),
              itemCount: state.history.length,
              itemBuilder: (context, index) {
                final item = state.history[index];
                final data = jsonDecode(item["data"]);
                return receivedDataCard(item, data);
              },
            ),
    );
  }

  /// ************  EMPTY VIEW ************
  Widget emptyStateView() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.inbox, size: 80.sp, color: Colors.white24),
          SizedBox(height: 10.h),
          Text(
            "No received data yet",
            style: getMediumStyle14_500(color: Colors.white54),
          ),
        ],
      ),
    );
  }

  /// ************  CARD UI ************
  Widget receivedDataCard(
    Map<String, dynamic> item,
    Map<String, dynamic> data,
  ) {
    return Container(
      margin: EdgeInsets.only(bottom: 16.h),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            ColorManager.surfaceDark,
            ColorManager.surfaceDark.withAlpha(204),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(20.r),
        border: Border.all(color: Colors.white.withAlpha(13)),
      ),
      child: Padding(
        padding: EdgeInsets.all(16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  padding: EdgeInsets.all(10.w),
                  decoration: BoxDecoration(
                    color: Colors.blueAccent.withAlpha(26),
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                  child: const Icon(
                    Icons.developer_board,
                    color: Colors.blueAccent,
                  ),
                ),
                SizedBox(width: 12.w),

                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        item["device"] ?? "Unknown Device",
                        style: getSemiBoldStyle16_600(color: Colors.white),
                      ),
                      Text(
                        item["ip"] ?? "0.0.0.0",
                        style: getRegularStyle12_400(color: Colors.white38),
                      ),
                    ],
                  ),
                ),

                Text(
                  item["time"].toString().substring(11, 16),
                  style: getMediumStyle12_500(color: Colors.blueAccent),
                ),
              ],
            ),

            Divider(color: Colors.white.withAlpha(13), height: 24.h),

            Wrap(
              spacing: 8.w,
              runSpacing: 8.h,
              children: [
                infoCardWidget(
                  Icons.battery_charging_full,
                  "Battery",
                  "${data["batteryLevel"]}",
                ),
                infoCardWidget(
                  Icons.thermostat,
                  "Temp",
                  "${data["temperature"]}",
                ),
                infoCardWidget(
                  Icons.directions_walk,
                  "Steps",
                  "${data["steps"]}",
                ),
                infoCardWidget(
                  Icons.auto_awesome_motion,
                  "Status",
                  "${data["activity"]}",
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  /// ************  Info Card ************
  Widget infoCardWidget(IconData icon, String title, String value) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 8.h),
      decoration: BoxDecoration(
        color: Colors.white.withAlpha(8),
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 14.sp, color: Colors.white54),
          SizedBox(width: 6.w),
          Text("$title: ", style: getRegularStyle12_400(color: Colors.white38)),
          Text(value, style: getMediumStyle12_500(color: Colors.white)),
        ],
      ),
    );
  }
}
