enum Characters { warrior, mage, archer }

enum DayTime { morning, noon, evening, night }

enum Weather { sunny, rainy, stormy }

void main() {
  String currentCharacter = Characters.mage.name;
  String currentDayTime = DayTime.night.name;
  String currentWeather = Weather.sunny.name;
  String characterTypeGerman = '';
  String? weatherTypeGerman;
  String? dayTimeGerman;
  int characterStrength = 0;

  //print(Characters.values);

  switch (currentCharacter) {
    case 'warrior':
      characterTypeGerman = 'Kämpfer';
      switch (currentDayTime) {
        case 'morning' || 'noon' || 'evening':
          characterStrength = 95;
          dayTimeGerman = 'Tag';

        case 'night':
          characterStrength = 65;
          dayTimeGerman = 'Nacht';
      }
    case 'mage':
      characterTypeGerman = 'Magier';
      switch (currentWeather) {
        case 'stormy':
          characterStrength = 80;
          weatherTypeGerman = 'Sturm';
        case 'sunny':
          characterStrength = 40;
          weatherTypeGerman = 'Sonnenschein';
      }
    case 'archer':
      characterTypeGerman = 'Bogenschütze';
      switch (currentWeather) {
        case 'sunny':
          characterStrength = 85;
          weatherTypeGerman = 'Sonnenschein';
        case 'rainy':
          characterStrength = 55;
          weatherTypeGerman = 'Regen';
      }
  }

  print(
    '\n- Character Strength -\n\n' +
        'Dein $characterTypeGerman hat ' +
        '${dayTimeGerman != null ? 'bei $dayTimeGerman ' + '${weatherTypeGerman != null ? 'und' : ''}' : ''}' +
        '${weatherTypeGerman != null ? 'bei $weatherTypeGerman ' : ''}' +
        'eine Angriffsstärke von ' +
        '$characterStrength. ${characterStrength >= 90
            ? 'Sehr gefährlich!'
            : characterStrength <= 50
            ? 'Nicht optimal!'
            : ''}' +
        '\n\n- -\n',
  );
}
