import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/resources/constant/style_manager.dart';
import 'dashboard_info_card.dart';

class DashboardSectionCard extends StatelessWidget {
  final String title;
  final List<DashboardInfoCard> items;

  const DashboardSectionCard({
    super.key,
    required this.title,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 4.w, bottom: 12.h),
          child: Text(
            title,
            style: getMediumStyle14_500(color: Colors.white54),
          ),
        ),
        GridView.count(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          crossAxisCount: 2,
          childAspectRatio: 2.6,
          mainAxisSpacing: 14.h,
          crossAxisSpacing: 14.w,
          children: items,
        ),
      ],
    );
  }
}
