import 'dart:math';

void main() {
  List<int> grades = [1, 4, 3, 4, 2, 2, 6, 1, 5];
  List<int> numbers = [34, 57, 1, 100, -42, 2, 2, 12, 73, -17];

  print('\n' + 'BONUSAUFGABE 1 - Minuten in Stunden umrechnen:' + '\n');
  convertMinutesToTime(587);

  print(
    '\n' + 'BONUSAUFGABE 2 - Hauptfunktion ruft Unterfunktionen auf #1:' + '\n',
  );
  analyzeGrades(grades);

  print(
    '\n' + 'BONUSAUFGABE 3 - Hauptfunktion ruft Unterfunktionen auf #2:' + '\n',
  );
  analyzeNumbers(numbers);
}

// BONUSAUFGABE 1 - Convert Minutes To Time:
void convertMinutesToTime(int inputMinutes) {
  int hours = (inputMinutes / 60).toInt();
  int minutes = inputMinutes % 60;
  print(
    '$inputMinutes Minuten sind umgerechnet $hours Stunde' +
        '${hours > 1 ? 'n' : ''}' +
        ' und $minutes Minute' +
        '${minutes > 1 ? 'n' : ''}' +
        '.' +
        '\n',
  );
}

// BONUSAUFGABE 2 - Hauptfunktion ruft Unterfunktionen auf #1:

// Erstelle zwei Funktionen:
void printGrades(List<int> grades) {
  // Gibt alle Noten nacheinander aus
  // z.B.: Note 1: 2, Note 2: 1, Note 3: 3
  for (int i = 0; i < grades.length; i++) {
    print('Note ${i + 1}: ${grades[i]}');
  }
}

void calculateAndPrintAverage(List<int> grades) {
  // Berechnet den Durchschnitt und gibt aus: "Der Durchschnitt ist: 2.0"
  int amountGrades = grades.length;
  int sumGrades = 0;
  for (int i = 0; i < grades.length; i++) {
    sumGrades += grades[i];
  }
  double avgGrades = sumGrades / amountGrades;
  // print('Die Anzahl ist: ${amountGrades}');
  // print('Die Summe ist: ${sumGrades}');
  print(
    '\n' + 'Der Notendurchschnitt ist: ${avgGrades.toStringAsFixed(0)}' + '\n',
  );
}

// Hauptfunktion:
void analyzeGrades(List<int> grades) {
  printGrades(grades);
  calculateAndPrintAverage(grades);
}

// BONUSAUFGABE 3 - Hauptfunktion ruft Unterfunktionen auf #2:

void findAndPrintExtreme(List<int> numbers) {
  // Findet und gibt kleinste und größte Zahl aus und zeigt auch deren Position in der Liste
  int smallestListNumber = numbers.reduce(min);
  int highestListNumber = numbers.reduce(max);
  int smallestListNumberPos = numbers.indexOf(smallestListNumber);
  int highestListNumberPos = numbers.indexOf(highestListNumber);

  print(
    'Kleinste Listenzahl:' +
        '\n' +
        '$smallestListNumber an Index $smallestListNumberPos' +
        '\n\n' +
        'Größte Listenzahl:' +
        '\n' +
        '$highestListNumber an Index $highestListNumberPos' +
        '\n',
  );
}

void printNumberTypes(List<int> numbers) {
  // Zählt und gibt aus:
  // - Wie viele gerade/ungerade Zahlen
  // - Wie viele positive/negative Zahlen

  List<int> evenNumbers = [];
  List<int> oddNumbers = [];
  List<int> positiveNumbers = [];
  List<int> negativeNumbers = [];

  for (int i = 0; i < numbers.length; i++) {
    numbers[i] % 2 == 0
        ? evenNumbers.add(numbers[i])
        : oddNumbers.add(numbers[i]);
  }

  for (int i = 0; i < numbers.length; i++) {
    numbers[i].isNegative
        ? negativeNumbers.add(numbers[i])
        : positiveNumbers.add(numbers[i]);
  }

  print(
    'Listeninhalt sortiert nach geraden/ungeraden und positiven/negativen Zahlen:' +
        '\n' +
        '${oddNumbers.length} ungerade Zahlen ${oddNumbers} und ${evenNumbers.length} gerade Zahlen ${evenNumbers}' +
        '\n' +
        '${positiveNumbers.length} positive Zahlen ${positiveNumbers} und ${negativeNumbers.length} negative Zahlen ${negativeNumbers} ' +
        '\n',
  );
}

void printDistribution(List<int> numbers) {
  // Gibt eine einfache Häufigkeitsverteilung aus
  // z.B. wie oft kommt jede Zahl vor
  List<String> countedNumbers = [];

  for (int number in numbers) {
    int countNumber = numbers.where((element) => element == number).length;
    countedNumbers.add('Die Zahl $number kommt $countNumber Mal vor');
  }
  countedNumbers = countedNumbers.toSet().toList();

  print('Häufigkeitsverteilung:');
  countedNumbers.forEach(print);
  print('\n');
}

// Hauptfunktion:
void analyzeNumbers(List<int> numbers) {
  // Ruft alle Funktionen der Reihe nach auf
  // Gibt eine übersichtliche Gesamtanalyse
  print(
    'Gegeben ist die Liste "numbers" mit folgenden Zahlen:' +
        '\n' +
        '${numbers}' +
        '\n',
  );
  findAndPrintExtreme(numbers);
  printNumberTypes(numbers);
  printDistribution(numbers);
}
