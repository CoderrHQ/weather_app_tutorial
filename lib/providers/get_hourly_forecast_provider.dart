import 'package:flutter_riverpod/flutter_riverpod.dart';

import '/models/hourly_weather.dart';
import '/services/api_helper.dart';

final hourlyForecastProvider = FutureProvider.autoDispose<HourlyWeather>(
  (ref) => ApiHelper.getHourlyForecast(),
);
