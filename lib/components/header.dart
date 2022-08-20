import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart' as intl;
import 'package:weatherapp_starter_project/controllers/controller.dart';

import '../theme/colors.dart';
import '../theme/styles.dart';

class Header extends GetView<Controller> {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    final Rx<String> city = controller.cityName;
    final String currentDate = intl.DateFormat('MMM d, yyyy')
        .format(DateTime.fromMillisecondsSinceEpoch(controller.weather.value.current.dt * 1000));
    final degree = controller.weather.value.current.temp.round();
    final icon = controller.weather.value.current.icon.toString();

    final String windSpeed = controller.weather.value.current.windSpeed.toString();
    final String clouds = controller.weather.value.current.clouds.toString();
    final String humidity = controller.weather.value.current.humidity.toString();

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
          padding: const EdgeInsets.only(top: 5),
          child: Text(
            currentDate,
            style: dateTextStyle,
          ),
        ),
        const SizedBox(
          height: 30,
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          height: 80,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.asset(
                'assets/weather/$icon.png',
                width: 80,
                height: 80,
              ),
              const Spacer(),
              const VerticalDivider(
                thickness: 2,
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
        const SizedBox(
          height: 30,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
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
          height: 60,
          width: 60,
          decoration: BoxDecoration(
            color: lightGrey,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Center(
            child: Image.asset(
              icon,
              width: 35,
              height: 35,
            ),
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        Text(
          value,
          style: infoTextStyle,
        ),
      ],
    );
  }
}
