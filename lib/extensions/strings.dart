extension Capitalize on String {
  String get capitalize {
    return length > 0 ? '${this[0].toUpperCase()}${substring(1)}' : '';
  }
}
