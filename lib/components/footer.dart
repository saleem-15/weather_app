// ignore: unused_import
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../controllers/controller.dart';
import '../theme/colors.dart';
import '../theme/styles.dart';

class Footer extends GetView<Controller> {
  const Footer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final int humidity = controller.weather.value.current.humidity.toInt();
    final String feelsLike = controller.weather.value.current.feelsLike.round().toString();
    final String uvIndex = controller.weather.value.current.uvIndex.toString();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          'Comfort Level',
          style: todayTextStyle.copyWith(fontSize: 20.sp),
        ),
        const SizedBox(
          height: 20,
        ),
        Transform.rotate(
          angle: math.pi,
          child: CircularPercentIndicator(
            // maskFilter: MaskFilter.blur(BlurStyle.solid, 20),
            progressColor: lightBlue,
            arcBackgroundColor: lightGrey,
            radius: 80.0,
            lineWidth: 12,
            percent: humidity / 100,
            arcType: ArcType.FULL_REVERSED,
            circularStrokeCap: CircularStrokeCap.round,
            animation: true,
            animationDuration: 1000,
            center: Transform.rotate(
              angle: math.pi,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '$humidity%',
                    style: percentageTextStyle,
                  ),
                  Text(
                    'Humidity',
                    style: TextStyle(fontSize: 19.sp),
                  ),
                ],
              ),
            ),
          ),
        ),
        SizedBox(
          height: 30.h,
        ),
        SizedBox(
          height: 30.h,
          width: 300.w,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                'Feels Like $feelsLike',
                style: footerTextStyle,
              ),
              const VerticalDivider(
                thickness: 2,
                color: lightGrey,
              ),
              Text(
                'UV Index $uvIndex',
                style: footerTextStyle,
              ),
            ],
          ),
        )
      ],
    );
  }
}
