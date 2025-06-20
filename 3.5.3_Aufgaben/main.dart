main() {
  print('Aufgabe 1 - Funktion 3 Zahlen:');
  print(sumNumbers(2, 10, 12));
  print(sumNumbers(89, -1, 3));
  print(sumNumbers(11, 99, 7));
  print('\n');

  print('Aufgabe 1 - Funktion Anzahl Buchstaben in Wort:');
  print(countChars('Textbeispiel'));
  print(countChars('Sommer'));
  print(countChars('Bliblablub'));
  print('\n');
}

int sumNumbers(int num1, int num2, int num3) {
  int sum = num1 + num2 + num3;
  return sum;
}

int countChars(String word) {
  int countChar = word.length;
  return countChar;
}
