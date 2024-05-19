import 'package:flutter_riverpod/flutter_riverpod.dart';

import '/models/weather.dart';
import '/services/api_helper.dart';

final cityForecastProvider = FutureProvider.autoDispose.family<Weather, String>(
  (ref, cityName) => ApiHelper.getWeatherByCityName(
    cityName: cityName,
  ),
);
