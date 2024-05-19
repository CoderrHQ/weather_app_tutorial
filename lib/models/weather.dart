import 'package:flutter/foundation.dart' show immutable;

@immutable
class Weather {
  final Coord coord;
  final List<WeatherData> weather;
  final String base;
  final Main main;
  final int? visibility;
  final Wind wind;
  final Rain? rain;
  final Clouds clouds;
  final int dt;
  final Sys sys;
  final int timezone;
  final int id;
  final String name;
  final int cod;

  const Weather({
    required this.coord,
    required this.weather,
    required this.base,
    required this.main,
    this.visibility,
    required this.wind,
    this.rain,
    required this.clouds,
    required this.dt,
    required this.sys,
    required this.timezone,
    required this.id,
    required this.name,
    required this.cod,
  });

  factory Weather.fromJson(Map<String, dynamic> json) => Weather(
        coord: Coord.fromJson(json['coord'] as Map<String, dynamic>),
        weather: (json['weather'] as List<dynamic>)
            .map((e) => WeatherData.fromJson(e as Map<String, dynamic>))
            .toList(),
        base: json['base'] as String,
        main: Main.fromJson(json['main'] as Map<String, dynamic>),
        visibility: json['visibility'] ?? 0,
        wind: Wind.fromJson(json['wind'] as Map<String, dynamic>),
        rain: json['rain'] != null
            ? Rain.fromJson(json['rain'] as Map<String, dynamic>)
            : null,
        clouds: Clouds.fromJson(json['clouds'] as Map<String, dynamic>),
        dt: json['dt'] as int,
        sys: Sys.fromJson(json['sys'] as Map<String, dynamic>),
        timezone: json['timezone'] as int,
        id: json['id'] as int,
        name: json['name'] as String,
        cod: json['cod'] as int,
      );
}

@immutable
class Coord {
  final double lon;
  final double lat;

  const Coord({
    required this.lon,
    required this.lat,
  });

  factory Coord.fromJson(Map<String, dynamic> json) => Coord(
        lon: json['lon'] as double,
        lat: json['lat'] as double,
      );
}

@immutable
class WeatherData {
  final int id;
  final String main;
  final String description;
  final String icon;

  const WeatherData({
    required this.id,
    required this.main,
    required this.description,
    required this.icon,
  });

  factory WeatherData.fromJson(Map<String, dynamic> json) => WeatherData(
        id: json['id'] as int,
        main: json['main'] as String,
        description: json['description'] as String,
        icon: json['icon'] as String,
      );
}

@immutable
class Main {
  final double temp;
  final double feelsLike;
  final double tempMin;
  final double tempMax;
  final int? pressure;
  final int? humidity;
  final int? seaLevel;
  final int? grndLevel;
  final int? visibility;

  const Main({
    required this.temp,
    required this.feelsLike,
    required this.tempMin,
    required this.tempMax,
    this.pressure,
    this.humidity,
    this.seaLevel,
    this.grndLevel,
    this.visibility,
  });

  factory Main.fromJson(Map<String, dynamic> json) => Main(
        temp: json['temp'] as double,
        feelsLike: json['feels_like'] as double,
        tempMin: json['temp_min'] as double,
        tempMax: json['temp_max'] as double,
        pressure: json['pressure'],
        humidity: json['humidity'],
        seaLevel: json['sea_level'],
        grndLevel: json['grnd_level'],
        visibility: json['visibility'],
      );
}

@immutable
class Wind {
  final double speed;
  final int deg;
  final double? gust;

  const Wind({
    required this.speed,
    required this.deg,
    this.gust,
  });

  factory Wind.fromJson(Map<String, dynamic> json) => Wind(
        speed: json['speed'] ?? 0.0,
        deg: json['deg'] ?? 0,
        gust: json['gust'],
      );
}

@immutable
class Rain {
  final double? oneHour;

  const Rain({this.oneHour});

  factory Rain.fromJson(Map<String, dynamic> json) {
    return Rain(oneHour: json['oneHour'] ?? 0.0);
  }
}

@immutable
class Clouds {
  final int all;

  const Clouds({
    required this.all,
  });

  factory Clouds.fromJson(Map<String, dynamic> json) {
    return Clouds(all: json['all'] ?? 0);
  }
}

@immutable
class Sys {
  final int type;
  final int id;
  final String country;
  final int sunrise;
  final int sunset;

  const Sys({
    required this.type,
    required this.id,
    required this.country,
    required this.sunrise,
    required this.sunset,
  });

  factory Sys.fromJson(Map<String, dynamic> json) => Sys(
        type: json['type'] ?? 0,
        id: json['id'] ?? 0,
        country: json['country'] ?? '',
        sunrise: json['sunrise'] ?? 0,
        sunset: json['sunset'] ?? 0,
      );
}
