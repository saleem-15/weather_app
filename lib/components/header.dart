import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart' as intl;
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../controllers/controller.dart';
import '../theme/colors.dart';
import '../theme/styles.dart';

class Header extends GetView<Controller> {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    final Rx<String> city = controller.cityName;
    final String currentDate = intl.DateFormat('MMM d, yyyy')
        .format(DateTime.fromMillisecondsSinceEpoch(controller.weather.value.current.dt * 1000));
    final current = controller.weather.value.current;
    final degree = current.temp.round();
    final icon = current.icon.toString();

    final String windSpeed = current.windSpeed.toString();
    final String clouds = current.clouds.toString();
    final String humidity = current.humidity.toString();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Obx(
          () => Text(
            city.value,
            style: cityNameStyle,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 5.h),
          child: Text(
            currentDate,
            style: dateTextStyle,
          ),
        ),
        SizedBox(
          height: 30.h,
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 15.w),
          height: 80.h,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.asset(
                'assets/weather/$icon.png',
                width: 80.w,
                height: 80.h,
              ),
              const Spacer(),
              VerticalDivider(
                thickness: 1.7.w,
                color: lightGrey,
                indent: 20, // empty space to the leading edge of divider.
                endIndent: 20, // empty space to the trailing edge of the divider.
              ),
              const Spacer(),
              Text(
                '$degree°',
                style: titleTempretureTextStyle,
              ),
            ],
          ),
        ),
        SizedBox(
          height: 30.h,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InfoIcon(
                icon: 'assets/icons/windspeed.png',
                value: '${windSpeed}km/h',
              ),
              InfoIcon(
                icon: 'assets/icons/clouds.png',
                value: '$clouds%',
              ),
              InfoIcon(
                icon: 'assets/icons/humidity.png',
                value: '$humidity%',
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class InfoIcon extends StatelessWidget {
  const InfoIcon({
    Key? key,
    required this.icon,
    required this.value,
  }) : super(key: key);

  final String icon;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 57.w,
          width: 57.w,
          decoration: BoxDecoration(
            color: lightGrey,
            borderRadius: BorderRadius.circular(15.r),
          ),
          child: Center(
            child: Image.asset(
              icon,
              width: 35.w,
              height: 35.h,
            ),
          ),
        ),
        SizedBox(
          height: 8.h,
        ),
        Text(
          value,
          style: infoTextStyle,
        ),
      ],
    );
  }
}
