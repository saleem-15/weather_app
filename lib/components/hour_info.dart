import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../theme/colors.dart';
import '../theme/styles.dart';

class HourInfo extends StatelessWidget {
  const HourInfo({
    Key? key,
    required this.hour,
    required this.weatherIcon,
    required this.tempreture,
    required this.isNow,
  }) : super(key: key);

  final String hour;
  final String weatherIcon;
  final String tempreture;
  final bool isNow;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 160.h,
      width: 97.w,
      decoration: BoxDecoration(
        color: isNow ? lightBlue : null,
        borderRadius: isNow ? BorderRadius.circular(15.r) : null,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            hour,
            style: infoTextStyle.copyWith(
              color: isNow ? Colors.white : null,
            ),
          ),
          Image.asset(
            weatherIcon,
            width: 40.w,
            height: 40.h,
          ),
          Text(
            tempreture,
            style: tempretureTextStyle.copyWith(
              color: isNow ? Colors.white : null,
            ),
          ),
        ],
      ),
    );
  }
}
