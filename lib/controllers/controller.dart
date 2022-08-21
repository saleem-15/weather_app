import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../components/today_info.dart';
import '../models/weather_data.dart';
import '../services/get_location.dart';
import '../services/fetch_weather_data.dart';

class Controller extends GetxController {
  final RxBool _isLoadingWeatherData = true.obs;
  RxBool get isLoadingWeatherData => _isLoadingWeatherData;

  final RxBool isGettingLocationInfo = true.obs;

  final RxBool isUseGazaLocation = false.obs;

  Rx<String> cityName = 'Gaza'.obs;

  final gazaLongitude = 31.5000;
  final gazaLattitude = 34.453593;

  // location coordinates
  late final double latitude;
  late final double longitude;

  //

  /// variables related to [TodayTemretureInfo] widget (initilized in onInit())
  late ScrollController hourlyListController;
  late int currentHourPostionInList;
  Rx<DateTime> currentHour = DateTime.now().obs;
  //

  late Rx<WeatherData> weather;

  @override
  void onInit() {
    log('-------------- onInit --------------');

    getLocation().then((coordinates) {
      // 1
      latitude = coordinates[0];
      longitude = coordinates[1];
      log('$latitude');
      log('$longitude');
      isGettingLocationInfo.value = false;
      getWeatherData();
    });

    // 2

    Timer.periodic(const Duration(hours: 1), (timer) => currentHour.value = DateTime.now());

    super.onInit();
  }

  Future<void> getWeatherData() async {
    final weatherJson = await fetchWeathertData(latitude, longitude);
    weather = WeatherData.fromJson(weatherJson).obs;
    initHourlyListScrollController();
    _isLoadingWeatherData.value = false;
  }

  void initHourlyListScrollController() {
    DateTime firstHourInList = DateTime.fromMillisecondsSinceEpoch(weather.value.hourly.first.dt * 1000);
    int difference = currentHour.value.difference(firstHourInList).inHours;
    log('first: ${firstHourInList.hour}');
    log('now: ${currentHour.value.hour}');
    log('difference: $difference ');
    currentHourPostionInList = 97.w.round() * difference;

    hourlyListController = ScrollController(
      initialScrollOffset: currentHourPostionInList.toDouble(),
    );
  }

  Future<void> useGazaLocation() async {
    latitude = gazaLattitude;
    longitude = gazaLongitude;
    isUseGazaLocation.value = true;
    await getWeatherData();
    isGettingLocationInfo.value = false;
  }
}




/*
  GeoCode()
          .reverseGeocoding(latitude: _latitude, longitude: longitude)
          .then((addrees) => cityName = addrees.city!);
*/


  // late Current currnet;
  // late List<Hourly> hourlyList;
  // late List<Daily> dailyList;
// currnet = Current.fromJson(data);
        // final Map<String, dynamic> jsonData = json.decode(data);

        // hourlyList = (jsonData['hourly'] as List<dynamic>)
        //     .map((e) => Hourly.fromMap(e as Map<String, dynamic>))
        //     .toList();

        // dailyList = (jsonData['daily'] as List<dynamic>)
        //     .map((e) => Daily.fromMap(e as Map<String, dynamic>))
        //     .toList();

        // weather = (WeatherData(
        //   current: currnet,
        //   daily: dailyList,
        //   hourly: hourlyList,
        // )).obs;