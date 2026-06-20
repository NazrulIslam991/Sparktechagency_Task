import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sparktechagency_task/core/resources/constant/color_manager.dart';
import 'package:sparktechagency_task/core/resources/constant/style_manager.dart';

class ReceivedDataScreen extends StatelessWidget {
  const ReceivedDataScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> history = [
      {
        "device": "Samsung A54",
        "time": "10:30 AM",
        "data": "Bat: 85%, Temp: 32C",
      },
      {"device": "Pixel 7", "time": "09:15 AM", "data": "Bat: 70%, Temp: 28C"},
    ];

    return Scaffold(
      backgroundColor: ColorManager.black6,
      appBar: AppBar(
        title: Text(
          "Received Data",
          style: getSemiBoldStyle18_600(color: Colors.white),
        ),
        backgroundColor: ColorManager.black6,
        elevation: 0,
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(16.w),
        itemCount: history.length,
        itemBuilder: (context, index) {
          return Card(
            color: ColorManager.surfaceDark,
            margin: EdgeInsets.only(bottom: 12.h),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16.r),
            ),
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.blueAccent.withAlpha(50),
                child: const Icon(
                  Icons.phone_android,
                  color: Colors.blueAccent,
                ),
              ),
              title: Text(
                history[index]["device"]!,
                style: getMediumStyle14_500(color: Colors.white),
              ),
              subtitle: Text(
                history[index]["data"]!,
                style: getRegularStyle12_400(color: Colors.white54),
              ),
              trailing: Text(
                history[index]["time"]!,
                style: getRegularStyle12_400(color: Colors.white54),
              ),
            ),
          );
        },
      ),
    );
  }
}
