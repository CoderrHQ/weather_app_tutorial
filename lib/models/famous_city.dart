class FamousCity {
  final String name;
  final double lat;
  final double lon;

  const FamousCity({
    required this.name,
    required this.lat,
    required this.lon,
  });
}

// List of famous cities as a constant
List<FamousCity> famousCities = const [
  FamousCity(name: 'Tokyo', lat: 35.6833, lon: 139.7667),
  FamousCity(name: 'New Delhi', lat: 28.5833, lon: 77.2),
  FamousCity(name: 'Paris', lat: 48.85, lon: 2.3333),
  FamousCity(name: 'London', lat: 51.4833, lon: -0.0833),
  FamousCity(name: 'New York', lat: 40.7167, lon: -74.0167),
  FamousCity(name: 'Tehran', lat: 35.6833, lon: 51.4167),
];
