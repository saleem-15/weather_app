// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'current_weather.dart';
import 'daily.dart';
import 'hourly.dart';

class WeatherData {
  Current current;
  List<Hourly> hourly;
  List<Daily> daily;

  WeatherData({
    required this.current,
    required this.hourly,
    required this.daily,
  });

  factory WeatherData.fromMap(Map<String, dynamic> data) {

    return WeatherData(
      current: Current.fromMap(data['current'] as Map<String, dynamic>),
      hourly:
          (data['hourly'] as List<dynamic>).map((e) => Hourly.fromMap(e as Map<String, dynamic>)).toList(),
      daily: (data['daily'] as List<dynamic>).map((e) => Daily.fromMap(e as Map<String, dynamic>)).toList(),
    );
  }

  /// Parses the string and returns the resulting Json object as [WeatherData].
  factory WeatherData.fromJson(String data) {
    return WeatherData.fromMap(json.decode(data) as Map<String, dynamic>);
  }
}
