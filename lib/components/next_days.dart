import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../controllers/controller.dart';
import '../theme/styles.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../theme/colors.dart';

class NextDaysInfo extends GetView<Controller> {
  const NextDaysInfo({super.key});

  @override
  Widget build(BuildContext context) {
    final daysList = controller.weather.value.daily;
    return Container(
      padding: EdgeInsets.all(13.sp),
      decoration: BoxDecoration(
        color: hourlyInfoContainerColor,
        borderRadius: BorderRadius.circular(15.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Next Days',
            style: todayTextStyle,
          ),
          SizedBox(
            height: 20.h,
          ),
          ListView.separated(
            itemCount: daysList.length,
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              final day =
                  DateFormat('EEE').format(DateTime.fromMillisecondsSinceEpoch(daysList[index].dt * 1000));
              final temp = '${daysList[index].minTemp.round()}°/${daysList[index].maxTemp.round()}°';
              final icon = daysList[index].icon;
              return DayInfoListTile(
                day: day,
                tempreture: temp,
                weatherIcon: 'assets/weather/$icon.png',
              );
            },
            separatorBuilder: (context, index) => Divider(
              thickness: .8.h,
              indent: 10.w,
            ),
          ),
        ],
      ),
    );
  }
}

class DayInfoListTile extends StatelessWidget {
  const DayInfoListTile({
    Key? key,
    required this.day,
    required this.tempreture,
    required this.weatherIcon,
  }) : super(key: key);

  final String day;
  final String tempreture;
  final String weatherIcon;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 5.h),
      child: Row(
        children: [
          SizedBox(
            width: 50.w,
            child: Text(
              day,
              style: TextStyle(
                fontSize: 14.sp,
              ),
            ),
          ),
          const Spacer(
            flex: 2,
          ),
          Image.asset(
            weatherIcon,
            width: 28.w,
            height: 28.w,
          ),
          const Spacer(
            flex: 1,
          ),
          SizedBox(
            width: 20.w,
          ),
          Text(
            tempreture,
            style: tempretureTextStyle.copyWith(
              color: Colors.grey.shade700,
            ),
          ),
        ],
      ),
    );
  }
}
