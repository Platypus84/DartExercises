void main() {
  List<double?> tempData = [];
  List<double?> rainData = [];
  List<double?> windData = [];
  List<String> weatherType = ['temp', 'rain', 'wind'];

  // Liste mit Wetterdaten, Anzahl der Elemente egal
  List<Map<String, double?>> weatherData = [
    {'temp': 5.3, 'rain': 0.9, 'wind': null},
    {'temp': 4.5, 'rain': null, 'wind': 16.8},
    {'temp': null, 'rain': 3.8, 'wind': null},
  ];

  // Funktion 'Summiere Werte' (return double)
  double summarizeValues(data) {
    double sum = 0;
    for (double value in data) {
      sum += value;
    }
    return sum;
  }

  // Füge die Temperaturen der Wetterdaten in die Liste ein, wenn nicht null
  // temps.add(weatherData[0]['temp'] ?? 0);
  // temps.add(weatherData[1]['temp'] ?? 0);
  // temps.add(weatherData[2]['temp'] ?? 0);

  weatherType.forEach((element) {
    for (var i = 0; i < weatherData.length; i++) {
      if (weatherData[i].containsKey('temp') &&
          weatherData[i][element] != null) {
        element == 'temp' ? tempData.add(weatherData[i]['temp']) : 'Error';
        element == 'rain' ? rainData.add(weatherData[i]['rain']) : 'Error';
        element == 'wind' ? windData.add(weatherData[i]['wind']) : 'Error';
      }
    }
  });

  int amountTempData = tempData.length;
  int amountRainData = rainData.length;
  int amountWindData = windData.length;

  double sumTemp = summarizeValues(tempData);
  double sumRain = summarizeValues(rainData);
  double sumWind = summarizeValues(windData);

  // Berechne Durchschnitt Temperatur
  double avgTemp = sumTemp / amountTempData;

  // Berechne Durchschnitt Regenmenge
  double avgRain = sumRain / amountRainData;

  // Berechne Durchschnitt Windgeschwindigkeit
  double avgWind = sumWind / amountWindData;

  print('\n' + '- - - Ergebnisse  - - - ');
  print('Durchschnitt Temperatur: $avgTemp');
  print('Durchschnitt Regenmenge: $avgRain');
  print('Durchschnitt Windgeschwindigkeit: $avgWind');
  print('- - - - - - - - - - - - ' + '\n');
}
