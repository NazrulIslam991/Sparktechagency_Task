import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../constant/color_manager.dart';

class Utils {
  /// ***************** Toast Message *****************
  static void showToast({
    required String message,
    required Color backgroundColor,
    required Color textColor,
  }) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: backgroundColor,
      textColor: textColor,
      fontSize: 16.0,
    );
  }

  /// ************* format 01:00 pm *********************
  static String formatToLocalAmPm(String utcString) {
    final utcDateTime = DateTime.parse(utcString);
    final localDateTime = utcDateTime.toLocal();

    int hour = localDateTime.hour;
    final minute = localDateTime.minute;

    final period = hour >= 12 ? 'PM' : 'AM';

    hour = hour % 12;
    if (hour == 0) hour = 12;

    final formattedMinute = minute.toString().padLeft(2, '0');

    return "$hour:$formattedMinute $period";
  }

  /// *******************  format 1/20/2025 ********************* •
  static String formatToLocalDateTime(String? utcString) {
    if (utcString == null || utcString.isEmpty) return "N/A";

    try {
      final utcDateTime = DateTime.parse(utcString);
      final localDateTime = utcDateTime.toLocal();

      final day = localDateTime.day;
      final month = localDateTime.month;
      final year = localDateTime.year;

      return "$month/$day/$year ";
    } catch (e) {
      return "Invalid Date";
    }
  }

  ///,*****************   24, Sep, 2025 ,*****************
  static String formatLocalDateReadable(String? utcString) {
    if (utcString == null || utcString.isEmpty) return "--";

    try {
      final dt = DateTime.parse(utcString).toLocal();

      const months = [
        "Jan",
        "Feb",
        "Mar",
        "Apr",
        "May",
        "Jun",
        "Jul",
        "Aug",
        "Sep",
        "Oct",
        "Nov",
        "Dec",
      ];

      return "${dt.day}, ${months[dt.month - 1]}, ${dt.year}";
    } catch (e) {
      return utcString;
    }
  }

  // calculateTimeAgo
  // static String calculateTimeAgo(String dateString) {
  //   try {
  //     final notificationTime = DateTime.parse(dateString);
  //     final difference = DateTime.now().difference(notificationTime);
  //
  //     if (difference.inDays >= 3) {
  //       return formatDateTime(notificationTime);
  //     } else if (difference.inDays >= 1) {
  //       return '${difference.inDays} ${difference.inDays == 1 ? "day" : "days"} ago';
  //     } else if (difference.inHours >= 1) {
  //       return '${difference.inHours} ${difference.inHours == 1 ? "hr" : "hrs"} ago';
  //     } else if (difference.inMinutes >= 1) {
  //       return '${difference.inMinutes} ${difference.inMinutes == 1 ? "min" : "mins"} ago';
  //     } else {
  //       return 'Just now';
  //     }
  //   } catch (e) {
  //     return dateString;
  //   }
  // }

///,*****************   alertOfflineActivity ,*****************
  static void alertOfflineActivity() {
    Fluttertoast.showToast(
      msg: "Please connect to internet",
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: Colors.red,
      textColor: Colors.white,
    );
  }


  ///,*****************   showErrorToast  ,*****************
  static Future<bool?> showErrorToast({required String message}) {
    return Fluttertoast.showToast(
      msg: message,
      backgroundColor: Colors.red,
      textColor: Colors.white,
    );
  }

  /// ,*****************   isTablet, ,*****************
  bool isTablet(BuildContext context) {
    if (MediaQuery.of(context).size.width > 600) {
      return true;
    } else {
      return false;
    }
  }
  /// ,*****************   fullWidth ,*****************
  static double fullWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  /// ,*****************   fullHeight ,*****************
  static double fullHeight(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }
  ///,*****************  selectDate  ************************
  static Future<void> selectDate(
      BuildContext context,
      TextEditingController controller,
      ) async {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2200),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: isDark
                ? const ColorScheme.dark(
              primary: ColorManager.purpleShade,
              onPrimary: Colors.white,
              surface: ColorManager.deepPurpleBg,
              onSurface: Colors.white,
            )
                : const ColorScheme.light(
              primary: ColorManager.purpleShade,
              onPrimary: Colors.white,
              surface: Colors.white,
              onSurface: Colors.black,
            ),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                foregroundColor: ColorManager.purpleShade,
                textStyle: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ),
          child: child!,
        );
      },
    );

    if (pickedDate != null) {
      String day = pickedDate.day.toString().padLeft(2, '0');
      String month = pickedDate.month.toString().padLeft(2, '0');
      controller.text = "$day-$month-${pickedDate.year}";
    }
  }

}


