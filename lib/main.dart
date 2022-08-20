import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

// ignore: unused_import
import 'controllers/controller.dart';
import 'screens/home.dart';

void main() => runApp(const WeatherApp());

class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(Controller(), permanent: true);

    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
      ),
    );
    return const GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Weather App',
      home: HomeScreen(),
    );
  }
}
