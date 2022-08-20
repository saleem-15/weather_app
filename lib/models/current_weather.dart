// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Current {
  int dt;
  double temp;
  double windSpeed;
  int humidity;

  //clouds percentage
  int clouds;
  double uvIndex;

  // what tempreture the weather feels like
  double feelsLike;

  String description;
  String icon;

  Current({
    required this.dt,
    required this.temp,
    required this.windSpeed,
    required this.humidity,
    required this.clouds,
    required this.uvIndex,
    required this.feelsLike,
    required this.description,
    required this.icon,
  });

  factory Current.fromMap(Map<String, dynamic> data) => Current(
        dt: data['dt'] as int,
        uvIndex: (data['uvi'] as num).toDouble(),
        feelsLike: (data['feels_like'] as num).toDouble(),
        description: data['weather'][0]['description'],
        icon: data['weather'][0]['icon'],
        temp: (data['temp'] as num).toDouble(),
        windSpeed: (data['wind_speed'] as num).toDouble(),
        clouds: data['clouds'] as int,
        humidity: data['humidity'] as int,
      );

  Map<String, dynamic> toMap() => {
        'temp': temp,
        'wind_speed': windSpeed,
        'clouds': clouds,
        'humidity': humidity,
      };

  /// Parses the string and returns the resulting Json object as [Current].
  factory Current.fromJson(String data) {
    return Current.fromMap((json.decode(data) as Map<String, dynamic>)['current']);
  }

  /// Converts [Current] to a JSON string.
  String toJson() => json.encode(toMap());
}
