import 'package:flutter/material.dart';
import 'package:weatherapp_starter_project/theme/colors.dart';
import 'package:weatherapp_starter_project/theme/styles.dart';

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
      height: 160,
      width: 100,
      decoration: BoxDecoration(
        color: isNow ? lightBlue : null,
        borderRadius: isNow ? BorderRadius.circular(15) : null,
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
            width: 40,
            height: 40,
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
