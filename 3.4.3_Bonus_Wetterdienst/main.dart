void main() {
  // Liste hat garantiert immer 3 Elemente
  List<Map<String, double?>> weatherData = [
    {'temp': 5.3, 'rain': 0.9, 'wind': null},
    {'temp': 4.5, 'rain': null, 'wind': 16.8},
    {'temp': null, 'rain': 3.8, 'wind': null},
  ];

  // Hier deine Lösung
  //double? x = (weatherData[2]['temp']) ?? weatherData[0]['wind'] ?? (4.5 >= weatherData[1]['temp']) ?? 0 ? weatherData[1]['temp'] : weatherData[1]['wind'];
  //print(x);
  double y =
      weatherData[2]['temp'] ??
      weatherData[0]['wind'] ??
      ((4.5 >= weatherData[1]['temp']!)
          ? (weatherData[1]['temp']!)
          : (weatherData[1]['wind']!));

  print(y);
}
