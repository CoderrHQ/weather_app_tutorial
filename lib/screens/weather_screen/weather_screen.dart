import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '/constants/app_colors.dart';
import '/constants/text_styles.dart';
import '/extensions/datetime.dart';
import '/extensions/strings.dart';
import '/providers/get_current_weather_provider.dart';
import '/views/gradient_container.dart';
import '/views/hourly_forecast_view.dart';
import 'weather_info.dart';

class WeatherScreen extends ConsumerWidget {
  const WeatherScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final weatherData = ref.watch(currentWeatherProvider);

    return weatherData.when(
      data: (weather) {
        return GradientContainer(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  width: double.infinity,
                ),
                // Country name text
                Text(
                  weather.name,
                  style: TextStyles.h1,
                ),

                const SizedBox(height: 20),

                // Today's date
                Text(
                  DateTime.now().dateTime,
                  style: TextStyles.subtitleText,
                ),

                const SizedBox(height: 30),

                // Weather icon big
                SizedBox(
                  height: 260,
                  child: Image.asset(
                    'assets/icons/${weather.weather[0].icon.replaceAll('n', 'd')}.png',
                    fit: BoxFit.contain,
                  ),
                ),

                const SizedBox(height: 30),

                // Weather description
                Text(
                  weather.weather[0].description.capitalize,
                  style: TextStyles.h2,
                ),
              ],
            ),

            const SizedBox(height: 40),

            // Weather info in a row
            WeatherInfo(weather: weather),

            const SizedBox(height: 40),

            // Today Daily Forecast
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Today',
                  style: TextStyle(
                    fontSize: 20,
                    color: AppColors.white,
                  ),
                ),
                InkWell(
                  child: Text(
                    'View full report',
                    style: TextStyle(
                      color: AppColors.lightBlue,
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 15),

            // hourly forcast
            const HourlyForecastView(),
          ],
        );
      },
      error: (error, stackTrace) {
        return const Center(
          child: Text(
            'An error has occurred',
          ),
        );
      },
      loading: () {
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
