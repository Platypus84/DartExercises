import 'dart:io';
import 'dart:math';

void main() {
  calculator();
}

void calculator() {
  // Variablen:
  late double operand01;
  late double operand02;
  late double result;
  List<int> allowedNumbers = [1, 2, 3, 4, 5, 6, 7];
  Map calcBaseColors = terminalColors('black', 'white');
  print(calcBaseColors['letterColor'] + calcBaseColors['backgroundColor']);

  Map<int, String> calcTypes = {
    1: 'Addition',
    2: 'Subtraktion',
    3: 'Multiplikation',
    4: 'Division',
    5: 'Modulo', // to Do: unzulässig für Fließkommazahlen (nur in C? -> checken)
    6: 'Quadratwurzel',
    7: 'Potenz',
  };

  Map<int, List<String>> calcOperands = {
    1: ['Summand 1', 'Summand 2'],
    2: ['Minuend', 'Subtrahend'],
    3: ['Multiplikator', 'Multiplikand'],
    4: ['Dividend', 'Divisor'],
    5: ['Dividend', 'Divisor'],
    6: ['Radikand', ''],
    7: ['Basis', 'Exponent'],
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
    case 7:
      result = power(operand01, operand02);
    default:
      print(' Fehler: Keine Rechenart gewählt');
  }

  // Ausgabe des Rechenergebnisses:
  print('\n' + '- - - Das Ergebnis - - -');
  print('\n' + '\u001b[32m' + ' $result' + '\u001b[30m');
  print('\n' + '- - - - - - - - - - - - ' + '\n');

  print(' Möchtest du weiterrechnen? (Ja = 1 / Nein = 0)');
  int continueCalc = int.parse(stdin.readLineSync() ?? '0');

  if (continueCalc == 1) {
    print(
      '\n' +
          ' Möchtest du mit dem vorigen Ergebnis (' +
          '\u001b[34m' +
          '$result' +
          '\u001b[30m' +
          ') weiterrechnen? (Ja = 1 / Nein = 0)',
    );
    int saveNumber = int.parse(stdin.readLineSync() ?? '0');
    if (saveNumber == 1) {
      print(
        '\n' +
            ' Möchtest du mit ' +
            '\u001b[34m' +
            '$result' +
            '\u001b[30m' +
            ' als 1.Operand oder 2.Operand weiterrechnen? (1.Operand = 1 / 2.Operand = 2)',
      );
      int chosenNumber = int.parse(stdin.readLineSync() ?? '0');
      if (chosenNumber == 1) {
        operand01 = result;
        operand02 = 0;
      } else {
        operand01 = 0;
        operand02 = result;
      }
    } else {} // To Do: Hauptmenü aufrufen
  } else {
    print('Bis bald!');
  }
}

double addition(double operand01, double operand02) {
  double result = operand01 + operand02;
  return result;
}

double subtraction(double operand01, double operand02) {
  double result = operand01 - operand02;
  return result;
}

double multiplication(double operand01, double operand02) {
  double result = operand01 * operand02;
  return result;
}

double division(double operand01, double operand02) {
  double result = operand01 / operand02;
  return result;
}

double modulo(double operand01, double operand02) {
  double result = operand01 % operand02;
  return result;
}

double root(double operand01) {
  double result = sqrt(operand01);
  return result;
}

double power(double operand01, double operand02) {
  double result = pow(operand01, operand02).toDouble();
  return result;
}

Map<String, String> terminalColors(String letterColor, String backgroundColor) {
  String colorPrefix = '\u001B[';

  switch (letterColor) {
    case 'black':
      letterColor = '30m';
    case 'white':
      letterColor = '37m';
    case 'red':
      letterColor = '31m';
    case 'blue':
      letterColor = '34m';
    case 'green':
      letterColor = '32m';
    default:
      letterColor = '30m';
  }

  switch (backgroundColor) {
    case 'black':
      backgroundColor = '40m';
    case 'white':
      backgroundColor = '47m';
    case 'red':
      backgroundColor = '41m';
    case 'blue':
      backgroundColor = '44m';
    case 'green':
      backgroundColor = '42m';
    default:
      backgroundColor = '40m';
  }

  letterColor = colorPrefix + letterColor;
  backgroundColor = colorPrefix + backgroundColor;

  return {'letterColor': letterColor, 'backgroundColor': backgroundColor};
}
