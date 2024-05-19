import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '/constants/text_styles.dart';
import '/extensions/datetime.dart';
import '/extensions/strings.dart';
import '/providers/get_city_forecast_provider.dart';
import '/screens/weather_screen/weather_info.dart';
import '/views/gradient_container.dart';

class WeatherDetailScreen extends ConsumerWidget {
  const WeatherDetailScreen({
    super.key,
    required this.cityName,
  });

  final String cityName;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final weatherData = ref.watch((cityForecastProvider(cityName)));

    return Scaffold(
      body: weatherData.when(
        data: (weather) {
          return GradientContainer(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 30,
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

                  const SizedBox(height: 50),

                  // Weather icon big
                  SizedBox(
                    height: 300,
                    child: Image.asset(
                      'assets/icons/${weather.weather[0].icon.replaceAll('n', 'd')}.png',
                      fit: BoxFit.contain,
                    ),
                  ),

                  const SizedBox(height: 50),

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

              const SizedBox(height: 15),
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
      ),
    );
  }
}
