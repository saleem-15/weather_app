import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../components/hour_info.dart';
import '../controllers/controller.dart';

import '../theme/colors.dart';
import '../theme/styles.dart';
import '../utils.dart';

class TodayTemretureInfo extends GetView<Controller> {
  const TodayTemretureInfo({super.key});

  @override
  Widget build(BuildContext context) {
    // for (var element in controller.weather.value.hourly) {
    //   var x = DateTime.fromMillisecondsSinceEpoch(element.dt * 1000);
    //   log('${DateFormat.yMd().add_jm().format(x)}  ===> ${element.temp.round()}');
    // }
    final hourlyInfoList = controller.weather.value.hourly;

    return Column(
      children: [
        Text(
          'Today',
          style: todayTextStyle,
        ),
        SizedBox(
          height: 20.h,
        ),
        Container(
          width: MediaQuery.of(context).size.width,
          height: 160.h,
          decoration: BoxDecoration(
            color: hourlyInfoContainerColor,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Obx(
            () => ListView(
              controller: controller.hourlyListController,
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              children: List.generate(24, (index) {
                final hourDt = DateTime.fromMillisecondsSinceEpoch(hourlyInfoList[index].dt * 1000);
                //24 ==> (24 hours a day)
                final dayHour = formatDayHour(hourDt.hour);
                final isNow = hourDt.hour == controller.currentHour.value.hour;
                final temp = hourlyInfoList[index].temp.toInt().toString();
                final icon = hourlyInfoList[index].icon;

                return HourInfo(
                  hour: dayHour,
                  weatherIcon: 'assets/weather/$icon.png',
                  tempreture: '$temp°',
                  isNow: isNow,
                );
              }),
            ),
          ),
        ),
      ],
    );
  }
}
