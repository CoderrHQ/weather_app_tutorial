import 'package:flutter/material.dart';

import '/models/famous_city.dart';
import '/screens/weather_detail_screen.dart';
import '/widgets/city_weather_tile.dart';

class FamousCitiesWeather extends StatelessWidget {
  const FamousCitiesWeather({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: famousCities.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
      ),
      itemBuilder: (context, index) {
        final city = famousCities[index];

        return InkWell(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (_) => WeatherDetailScreen(
                  cityName: city.name,
                ),
              ),
            );
          },
          child: CityWeatherTile(
            index: index,
            city: city,
          ),
        );
      },
    );
  }
}
