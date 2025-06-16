import 'dart:io';
import 'dart:math';

void main() {
  terminalColors();
  calculator();
}

void calculator() {
  // Variablen:
  late double operand01;
  late double operand02;
  late double result;
  List<int> allowedNumbers = [1, 2, 3, 4, 5, 6];

  Map<int, String> calcTypes = {
    1: 'Addition',
    2: 'Subtraktion',
    3: 'Multiplikation',
    4: 'Division',
    5: 'Modulo', // to Do: unzulässig für Fließkommazahlen (nur in C? -> checken)
    6: 'Quadratwurzel',
  };

  Map<int, List<String>> calcOperands = {
    1: ['Summand 1', 'Summand 2'],
    2: ['Minuend', 'Subtrahend'],
    3: ['Multiplikator', 'Multiplikand'],
    4: ['Dividend', 'Divisor'],
    5: ['Dividend', 'Divisor'],
    6: ['Radikand', ''],
  };

  // Ausgabe Taschenrechner Funktionsmenü:
  print(
    '\n' +
        ' Dein Taschenrechner - Wähle eine Rechenart aus der Liste anhand ihrer Ziffer:',
  );
  print(' - - - - - - - - - -');
  calcTypes.forEach((key, value) {
    print(' $value = $key');
  });
  print(' - - - - - - - - - -' + '\n');
  int calculus = int.parse(stdin.readLineSync() ?? '0');

  // Prüfung Eingabewert:
  while (!allowedNumbers.contains(calculus)) {
    print(
      '\u001B[31m' +
          'FEHLER: Für die Ziffer $calculus existiert keine Rechenart!' +
          '\n',
    );
    print(
      '\n' +
          '\u001b[30m' +
          ' Gib eine korrekte Ziffer aus dem obigen Menü ein:',
    );
    calculus = int.parse(stdin.readLineSync() ?? '0');
  }

  // Ausgabe der gewählten Rechenart:
  print(
    '\n' +
        ' Du hast ' +
        '\u001b[34m' +
        '${calcTypes[calculus]}' +
        '\u001b[30m' +
        ' als Rechenart gewählt.',
  );

  // Eingabe der Operanden:
  print(
    '\n' +
        ' Gib die ' +
        '${calculus != 6 ? 'erste ' : ''}' +
        'Zahl (${calcOperands[calculus]?.first}) ein:',
  );
  operand01 = double.parse(stdin.readLineSync() ?? '0');

  if (calculus != 6) {
    print(
      '\n' +
          ' Gib die zweite Zahl (${calcOperands[calculus]?.last}) ein:', // To Do: Regex zur Prüfung, dass nur Zahlen für Operande 1 und 2 eingegeben werden!
    );
    operand02 = double.parse(stdin.readLineSync() ?? '0');
  }

  // Verarbeitung der Operanden je nach Rechenart:
  switch (calculus) {
    case 1:
      result = addition(operand01, operand02);
    case 2:
      result = subtraction(operand01, operand02);
    case 3:
      result = multiplication(operand01, operand02);
    case 4:
      result = division(operand01, operand02);
    case 5:
      result = modulo(operand01, operand02);
    case 6:
      result = root(operand01);
    default:
      print(' Fehler: Keine Rechenart gewählt');
  }

  // Ausgabe des Rechenergebnisses:
  print('\n' + '- - - Das Ergebnis - - -');
  print('\n' + '\u001b[32m' + ' $result' + '\u001b[30m');
  print('\n' + '- - - - - - - - - - - - ' + '\n');
}

double addition(operand01, operand02) {
  double result = operand01 + operand02;
  return result;
}

double subtraction(operand01, operand02) {
  double result = operand01 - operand02;
  return result;
}

double multiplication(operand01, operand02) {
  double result = operand01 * operand02;
  return result;
}

double division(operand01, operand02) {
  double result = operand01 / operand02;
  return result;
}

double modulo(operand01, operand02) {
  double result = operand01 % operand02;
  return result;
}

double root(operand01) {
  double result = sqrt(operand01);
  return result;
}

void terminalColors() {
  String Color = "\u001B[";
  String LETTERS_BLACK = Color + "30m";
  //String LETTERS_ERROR = Color + "31m"; // Color Red
  //String BACKGROUND_YELLOW = Color + "33m";
  String BACKGROUND_WHITE = Color + "47m";
  print(BACKGROUND_WHITE + LETTERS_BLACK);
}
