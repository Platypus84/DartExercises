void main() {
  List<int> numbers = [1, 17, 23, 702, 87, 33];
  List<String> words = [
    'Schubidu',
    'Rambazamba',
    'Alrighty then',
    'Ich wiederhole mich.',
  ];
  Map<String, String> names = {
    'Bugs': 'Bunny',
    'Pu': 'Muckl',
    'Bud': 'Spencer',
    'Com': 'Truise',
  };

  print('\n' + 'AUFGABE 1 - Print Numbers:' + '\n');
  for (int number in numbers) {
    print('$number' + '\n');
  }

  print('\n' + 'AUFGABE 2 - Triple Print:' + '\n');
  for (String word in words) {
    triplePrint(word);
  }

  print('\n' + 'AUFGABE 3 - Reverse Initials:' + '\n');
  names.forEach((firstName, lastName) {
    reverseInitials(firstName, lastName);
  });
}

// AUFGABE 1 - Print Numbers:
void printNumber(int x) {
  print(x);
}

// AUFGABE 2 - Triple Print:
void triplePrint(String text) {
  for (int i = 1; i < 4; i++) {
    print(text);
  }
  print('\n');
}

// AUFGABE 3 - Reverse Initials:
void reverseInitials(String firstName, String lastName) {
  String revInitialFirstName = firstName[firstName.length - 1].toUpperCase();
  String revInitialLastName = lastName[lastName.length - 1].toUpperCase();
  print('$revInitialLastName. $revInitialFirstName.' + '\n');
}
