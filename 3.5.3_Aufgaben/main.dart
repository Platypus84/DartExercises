main() {
  print('Aufgabe 1 - Funktion 3 Zahlen:');
  print(sumNumbers(2, 10, 12));
  print(sumNumbers(89, -1, 3));
  print(sumNumbers(11, 99, 7));
  print('\n');

  print('Aufgabe 2 - Funktion Anzahl Buchstaben in Wort:');
  print(countChars('Textbeispiel'));
  print(countChars('Sommer'));
  print(countChars('Bliblablub'));
  print('\n');

  print('Aufgabe 3 - Vokale in Wort zählen:');
  print(countVowls('Ananas'));
  print(countVowls('Simsalabim'));
  print(countVowls('Donaudampfschiffkapitänsmütze'));
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

String countVowls(String word) {
  List<String> vowls = ['a', 'ä', 'e', 'i', 'o', 'ö', 'u', 'ü'];
  int sumVowls = 0;
  String wordLC = word.toLowerCase();
  for (int i = 0; i < wordLC.length; i++) {
    if (vowls.contains(wordLC[i])) {
      sumVowls++;
    }
  }
  return 'Wort "$word" hat $sumVowls Vokale';
}
