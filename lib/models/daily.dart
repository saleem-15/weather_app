// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Daily {
  int dt;
  // Temp temp;

  double minTemp;
  double maxTemp;
  double feelsLike;
  int humidity;
  double windSpeed;
  int clouds;
  double uvi;
  String icon;

  Daily({
    required this.dt,
    required this.minTemp,
    required this.maxTemp,
    required this.feelsLike,
    required this.humidity,
    required this.windSpeed,
    required this.clouds,
    required this.uvi,
    required this.icon,
  });

  factory Daily.fromMap(Map<String, dynamic> data) => Daily(
        minTemp: (data['temp']['min'] as num).toDouble(),
        maxTemp: (data['temp']['max'] as num).toDouble(),
        dt: data['dt'] as int,
        feelsLike: data['feels_like']['day'],
        humidity: data['humidity'] as int,
        windSpeed: (data['wind_speed'] as num).toDouble(),
        clouds: data['clouds'] as int,
        uvi: (data['uvi'] as num).toDouble(),
                icon:data['weather'][0]['icon'] ,

      );

  /// Parses the string and returns the resulting Json object as [Daily].
  factory Daily.fromJson(String data) {
    return Daily.fromMap(json.decode(data) as Map<String, dynamic>);
  }
}
