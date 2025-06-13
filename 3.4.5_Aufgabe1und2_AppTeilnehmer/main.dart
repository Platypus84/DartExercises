import 'dart:io';

void main() {
  cleanTerminal();
  List<int> points = [4, 5, 4, 2, 6, 6, 3];
  List<String> names = [
    'Julietta',
    'Benjamino',
    'Hans-Günther',
    'Evalinea',
    'Fiona',
    'Gregory',
    'Leonhart',
  ];
  int sumPoints = 0;
  int amountPoints = points.length;

  print('Aufgabe 1 - Lösung 1:');
  for (String name in names) {
    print(name);
  }
  print('\n');
  print('Aufgabe 1 - Lösung 2:');
  names.forEach(print);

  print('\n' + 'Aufgabe 2 - Lösung:');
  for (int point in points) {
    sumPoints += point;
  }

  double avgPoints = sumPoints / amountPoints;
  print('Das Ergebnis ist: $avgPoints' + '\n');
}

void cleanTerminal() {
  print(Process.runSync("clear", [], runInShell: true).stdout);
}
