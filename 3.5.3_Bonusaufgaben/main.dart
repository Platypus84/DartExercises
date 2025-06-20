import 'dart:math';

main() {
  List<int> numList1 = [34, 57, 1, 100, -45, 2, 7, 12, 73, -17];
  List<int> numList2 = [5, 82, 4, 17];
  List<int> numList3 = [100, -42, 17, 231];
  List<String> whateverText = [
    'Kunibert',
    'fsajoahpha',
    'Tja da fehlt die Kreativität',
    '*schnarch*',
  ];

  print('\n' + 'Bonusaufgabe 1 - Zahlenvergleich:');
  print(compareNumbers(2, 10));
  print(compareNumbers(89, 3));
  print(compareNumbers(11, 99));
  print('\n');

  print('Bonusaufgabe 2 - Zahlanalyse (Gerade/Ungerade):');
  print(analyseNumber(2));
  print(analyseNumber(9));
  print(analyseNumber(17));
  print('\n');

  print('Bonusaufgabe 3 - Zahlensumme aus Liste:');
  print(sumListItems(numList1));
  print(sumListItems(numList2));
  print(sumListItems(numList3));
  print('\n');

  print('Bonusaufgabe 4 - Durchschnittswert aus Listenzahlen:');
  print(avgListItems(numList1));
  print(avgListItems(numList2));
  print(avgListItems(numList3));
  print('\n');

  print('Bonusaufgabe 5 - Häufigkeit eines bestimmten Buchstabens im Text:');
  print(countSpecificLetterInText('t', 'Das ist ein Testtext'));
  print(
    countSpecificLetterInText(
      'ä',
      'Ich äh... bin äh äh... Edmund äh... Stoiber!',
    ),
  );
  print(countSpecificLetterInText('u', 'UUhhuhuhuhuhuhUUUUUUuUuUHhUUhuUu'));
  print('\n');

  print('Bonusaufgabe 6 - Kommt Buchstabe in Text vor:');
  print(isSpecificLetterInText('v', 'Das ist ein Testtext'));
  print(
    isSpecificLetterInText(
      'u',
      'Ganz am Ende steht das U. Und sieh da, noch ein u!',
    ),
  );
  print(
    isSpecificLetterInText(
      'ö',
      'Ööööh, ich verstehe den Sinn nicht so ganz. Höhö',
    ),
  );
  print('\n');

  print('Bonusaufgabe 7 - Zahlchecker: Ist Zahl positiv, negativ, oder 0:');
  print(numberChecker(7));
  print(numberChecker(-225));
  print(numberChecker(0));
  print('\n');

  print('Bonusaufgabe 8 - Wortbuchstaben einzeln in Liste schreiben:');
  print(lettersToList('Hallo'));
  print(lettersToList('Krasser Text!'));
  print(lettersToList('Juhuuu'));
  print('\n');

  print('Bonusaufgabe 9 - Anzahl Buchstaben pro String aus Liste mit Strings:');
  print(letterPerStringToList(whateverText));
  print('\n');

  print(
    'Bonusaufgabe 10 - Produkt aus 2 Zahlen, das mit 3.Zahl zusätzlich multipliziert wird:',
  );
  print('Das Ergebnis ist: ${multiplyNumbers(9, 5) * 10}');
  print('\n');

  print('Bonusaufgabe 11 - Vorzeichen von Zahl ändern:');
  print(changeSign(-35));
  print('\n');

  print('Bonusaufgabe 12 - Kleinste Zahl aus Liste:');
  print(smallestNumberFromList(numList2));
  print('\n');

  print('Bonusaufgabe 12 - Kleinste Zahl aus Liste:');
  print(smallestNumberFromList(numList2));
  print('\n');

  print(
    'Bonusaufgabe 13 - Anzahl Buchstaben pro String aus Liste mit Strings:',
  );
  print(letterPerStringToListAGAIN(whateverText));
  print('\n');

  print('Bonusaufgabe 14 - Fahrenheit/Celsius Umrechner:');
  print(converterFahrenheitCelsius(12, 'fahrenheit'));
  print('\n');
}

// Bonusaufgabe 1 - Zahlenvergleich:
int compareNumbers(int number1, int number2) {
  int result = number1 > number2 ? number1 : number2;
  return result;
}

// Bonusaufgabe 2 - Zahlanalyse (Gerade/Ungerade):
String analyseNumber(int number) {
  String result = number % 2 == 0
      ? 'Die Zahl ist gerade.'
      : 'Die Zahl ist ungerade.';
  return result;
}

// Bonusaufgabe 3 - Zahlensumme aus Liste:
sumListItems(List<int> list) {
  num sumItems = 0;
  list.forEach((element) {
    sumItems += element;
  });
  return sumItems;
}

// Bonusaufgabe 4 - Durchschnittswert aus Listenzahlen:
avgListItems(List<int> list) {
  int sumItems = sumListItems(list);
  int countListItems = list.length;
  double result = sumItems / countListItems;
  return result;
}

// Bonusaufgabe 5 - Häufigkeit eines bestimmten Buchstabens im Text:
String countSpecificLetterInText(String letter, String text) {
  int counter = 0;
  text = text.toLowerCase();
  for (int i = 0; i < text.length; i++) {
    if (letter == text[i]) {
      counter++;
    }
  }
  return counter == 0
      ? 'Der Buchstabe $letter kommt nicht vor.'
      : 'Der Buchstabe $letter kommt $counter Mal vor.';
}

// Bonusaufgabe 6 - Kommt ein Buchstabe im Text vor:
String isSpecificLetterInText(String letter, String text) {
  String result = countSpecificLetterInText(letter, text);
  return result;
}

// Bonusaufgabe 7 - Zahlchecker: Ist Zahl positiv, negativ, oder 0:
String numberChecker(int number) {
  late String result;
  number == 0
      ? result = 'Die Zahl $number ist 0.'
      : number.isNegative
      ? result = 'Die Zahl $number ist negativ.'
      : result = 'Die Zahl $number ist positiv.';
  return result;
}

// Bonusaufgabe 8 - Wortbuchstaben einzeln in Liste schreiben:
List<String> lettersToList(String word) {
  List<String> charList = [];
  for (int i = 0; i < word.length; i++) {
    charList.add(word[i]);
  }
  return charList;
}

// Bonusaufgabe 9 - Wortbuchstaben einzeln in Liste schreiben:
Map<String, int> letterPerStringToList(List list) {
  Map<String, int> letterPerString = {};
  list.forEach((element) {
    int countElementChars = element.length;
    letterPerString.addEntries([new MapEntry(element, countElementChars)]);
  });
  // for (int i = 0; i < word.length; i++) {
  //   charList.add(word[i]);
  // }
  return letterPerString;
}

// Bonusaufgabe 10 - Produkt aus 2 Zahlen, die mit 3 Zahl extra berechnet werden:
int multiplyNumbers(int number1, int number2) {
  int result = number1 * number2;
  return result;
}

// Bonusaufgabe 11 - Vorzeichen von Zahl ändern:
int changeSign(int number) {
  number.isNegative ? number = number * -1 : number = -number;
  return number;
}

// Bonusaufgabe 12 - Kleinste Zahl aus Liste:
int smallestNumberFromList(List<int> numbers) {
  int smallestListNumber = numbers.reduce(min);
  return smallestListNumber;
}

// Bonusaufgabe 13 - Identisch wie Aufgabe 9:
Map<String, int> letterPerStringToListAGAIN(List list) {
  Map<String, int> SameMap = letterPerStringToList(list);
  return SameMap;
  // Hatte Aufgabe 9 schon mit einer Map gelöst, wobei man es bei Aufgabe 9 natürlich auch über einzelne Prints in der Schleife hatte ausgeben könnte.
}

// Bonusaufgabe 14 - Fahrenheit/Celsius Umrechner:
String converterFahrenheitCelsius(int number, String type) {
  double temp = 0;
  String newType = '';
  type = "${type[0].toUpperCase()}${type.substring(1).toLowerCase()}";

  if (type == 'Fahrenheit') {
    temp = (number * 1.8) + 32;
    newType = 'Celsius';
  } else if (type == 'Celsius') {
    temp = (number - 32) / 1.8;
    newType = 'Fahrenheit';
  }
  return '$number Grad $type sind $temp Grad $newType.';
}
