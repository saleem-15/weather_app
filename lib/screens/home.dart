import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../components/footer.dart';
import '../components/header.dart';
import '../components/next_days.dart';
import '../controllers/controller.dart';
import '../components/today_info.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<Controller>(
      builder: (controller) => Scaffold(
        body: Obx(() {
          log(' isLoading => ${controller.isLoadingWeatherData.value}');

          if (controller.isGettingLocationInfo.isTrue) {
            return Center(
              child: SizedBox(
                height: 200,
                child: Column(
                  children: [
                    const Text('Getting location Info'),
                    const CircularProgressIndicator(),
                    const Spacer(),
                    ElevatedButton(
                      child: const Text('Use gaza location'),
                      onPressed: () {
                        controller.useGazaLocation();
                      },
                    )
                  ],
                ),
              ),
            );
          }

          return controller.isLoadingWeatherData.value
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : SafeArea(
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: EdgeInsets.only(
                        top: 40.h,
                        left: 15.w,
                        right: 15.w,
                      ),
                      child: Column(
                        children: [
                          const Header(),
                          SizedBox(
                            height: 30.h,
                          ),
                          const TodayTemretureInfo(),
                          SizedBox(
                            height: 30.h,
                          ),
                          const NextDaysInfo(),
                          Divider(
                            height: 50.h,
                            thickness: 1.5.h,
                          ),
                          const Footer(),
                          SizedBox(
                            height: 50.h,
                          ),
                        ],
                      ),
                    ),
                  ),
                );
        }),
      ),
    );
  }
}

/*

 return CustomScrollView(
          slivers: [
            SliverAppBar(
              elevation: 0,
              backgroundColor: Theme.of(context).scaffoldBackgroundColor,
              actions: const [
                Icon(Icons.search),
                // Shohel Rana Shanto
              ],
              pinned: true,
              expandedHeight: 200,
              floating: true,
              flexibleSpace: FlexibleSpaceBar(
                title: Text(
                  cityName,
                  style: cityNameStyle.copyWith(
                    color: ThemeData.light().textTheme.titleMedium!.color,
                  ),
                ),
                // centerTitle: true,
              ),
            ),

            SliverToBoxAdapter(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: 15,
                    right: 15,
                  ),
                  child: Column(
                    children: [
                      Header(),
                      const SizedBox(
                        height: 30,
                      ),
                      TodayTemretureInfo(),
                      const SizedBox(
                        height: 30,
                      ),
                      const NextDaysInfo(),
                      const Divider(
                        height: 50,
                        thickness: 1,
                      ),
                      const Footer(
                        humidityPercentage: 94,
                        feelsLike: 31.13,
                        uvIndex: '0.0',
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        );
*/
