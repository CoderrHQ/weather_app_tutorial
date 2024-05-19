import 'package:flutter_riverpod/flutter_riverpod.dart';

import '/services/api_helper.dart';

final currentWeatherProvider = FutureProvider.autoDispose(
  (ref) => ApiHelper.getCurrentWeather(),
);
