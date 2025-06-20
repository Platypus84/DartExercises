main() {
  List<int> numList1 = [34, 57, 1, 100, -42, 2, 2, 12, 73, -17];
  List<int> numList2 = [5, 82, 19, 17];
  List<int> numList3 = [100, -42, 17, 231];

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
sumListItems(List list) {
  num sumItems = 0;
  list.forEach((element) {
    sumItems += element;
  });
  return sumItems;
}
