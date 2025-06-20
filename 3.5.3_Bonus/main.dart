main() {
  print('\n' + 'Bonusaufgabe 1 - Zahlenvergleich:');
  print(countChars(2, 10));
  print(countChars(89, 3));
  print(countChars(11, 99));
  print('\n');
}

int countChars(int number1, int number2) {
  int result = number1 > number2 ? number1 : number2;
  return result;
}
