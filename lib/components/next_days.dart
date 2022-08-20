import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:weatherapp_starter_project/controllers/controller.dart';
import 'package:weatherapp_starter_project/theme/styles.dart';

import '../theme/colors.dart';

class NextDaysInfo extends GetView<Controller> {
  const NextDaysInfo({super.key});

  @override
  Widget build(BuildContext context) {
    final daysList = controller.weather.value.daily;
    return Container(
      padding: const EdgeInsets.all(13),
      decoration: BoxDecoration(
        color: hourlyInfoContainerColor,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Next Days',
            style: todayTextStyle,
          ),
          const SizedBox(
            height: 20,
          ),
          ListView.separated(
            itemCount: daysList.length,
            shrinkWrap: true,
            // physics: const NeverScrollableScrollPhysics(), // <-- this will disable scroll
            physics: const BouncingScrollPhysics(),

            itemBuilder: (context, index) {
              final day =
                  DateFormat('EEE').format(DateTime.fromMillisecondsSinceEpoch(daysList[index].dt * 1000));
              final temp = '${daysList[index].maxTemp.round()}°/${daysList[index].maxTemp.round()}°';
              final icon = daysList[index].icon;
              return DayInfoListTile(
                day: day,
                // 'sat',
                tempreture: temp,
                weatherIcon: 'assets/weather/$icon.png',
              );
            },
            separatorBuilder: (context, index) => const Divider(
              thickness: .8,
              indent: 10,
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
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      child: Row(
        children: [
          SizedBox(
            width: 30,
            child: Text(day),
          ),
          const Spacer(
            flex: 2,
          ),
          Image.asset(
            weatherIcon,
            width: 30,
            height: 30,
          ),
          const Spacer(
            flex: 1,
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
