main() {
  print('\n' + 'Bonusaufgabe 1 - Zahlenvergleich:');
  print(compareNumbers(2, 10));
  print(compareNumbers(89, 3));
  print(compareNumbers(11, 99));
  print('\n');
}

int compareNumbers(int number1, int number2) {
  int result = number1 > number2 ? number1 : number2;
  return result;
}
