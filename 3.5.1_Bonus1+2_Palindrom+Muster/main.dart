void main() {
  // BONUSAUFGABE 1 - Palindrom:
  List<String> names = ['otto', 'anna', 'rentner'];
  String word = names[2];
  bool isPalindrome = palindromeChecker(word);
  print('\n' + 'BONUSAUFGABE 1 - Palindrom:');
  print(
    'Das Wort $word ist ${!isPalindrome ? 'k' : ''}' + 'ein Palindrom!' + '\n',
  );

  // BONUSAUFGABE 2 - Nummer zu Muster:
  int number = 5;
  List<int> numberPattern = numberToPattern(number);
  print('\n' + 'BONUSAUFGABE 2 - Nummer zu Muster:');
  print('$numberPattern' + '\n');
}

bool palindromeChecker(String word) {
  String wordReversed = '';
  bool isPalindrom = false;
  for (int i = word.length - 1; i >= 0; i--) {
    wordReversed += word[i];
  }
  if (wordReversed == word) {
    isPalindrom = true;
  }
  return isPalindrom;
}

List<int> numberToPattern(int number) {
  List<int> numberPattern = [];
  int length = (number * 2) - 1;
  // print(length);
  for (int i = 1; i <= length; i++) {
    if (i <= number) {
      numberPattern.add(i);
    } else {
      numberPattern.add(number - 1);
      number--;
    }
  }
  return numberPattern;
}
