import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class StatusInfoWidget extends StatelessWidget {
  const StatusInfoWidget(
      {super.key,
      required this.image,
      required this.textUpper,
      required this.textLower});

  final String image;
  final String textUpper;
  final String textLower;

  @override
  Widget build(BuildContext context) {
    final screenUtil = ScreenUtil();
    return Row(
      children: [
        Image.asset(
          image,
          height: screenUtil.setHeight(70),
          width: screenUtil.setWidth(70),
        ),
        SizedBox(width: screenUtil.setHeight(8)),
        Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(
            textUpper.tr(),
            style: TextStyle(
                fontSize: screenUtil.setSp(18),
                fontWeight: FontWeight.bold,
                color: Colors.brown),
          ),
          Text(
            textLower.tr(),
            style: TextStyle(
                fontSize: screenUtil.setSp(14),
                fontWeight: FontWeight.w400,
                color: Colors.brown),
          )
        ])
      ],
    );
  }
}
