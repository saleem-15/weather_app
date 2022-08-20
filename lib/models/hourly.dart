// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Hourly {
  int dt;
  double temp;
  double feelsLike;
  String icon;

  Hourly({
    required this.dt,
    required this.temp,
    required this.feelsLike,
    required this.icon,
  });

  factory Hourly.fromMap(Map<String, dynamic> data) => Hourly(

        dt: data['dt'] as int,
        temp: (data['temp'] as num).toDouble(),
        icon:data['weather'][0]['icon'] ,
        feelsLike: (data['feels_like'] as num).toDouble(),
      );

  /// Parses the string and returns the resulting Json object as [Hourly].
  factory Hourly.fromJson(String data) {
    return Hourly.fromMap(json.decode(data) as Map<String, dynamic>);
  }
}
