import 'dart:io';
import 'dart:math';

void main() {
  calculator();
}

void calculator() {
  // Variablen:
  Map calcBaseColors = terminalColors('black', 'white');
  print(calcBaseColors['letterColor'] + calcBaseColors['backgroundColor']);
  late double? operand01;
  late double? operand02;
  late double result;

  Map<int, String> calcTypes = {
    1: 'Addition',
    2: 'Subtraktion',
    3: 'Multiplikation',
    4: 'Division',
    5: 'Modulo', // to Do: unzulässig für Fließkommazahlen? / nur in C? -> checken)
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

  // Eingabe der Rechenart mit Prüfung, ob Eingabe null  Info: .tryParse() ist prüfbar und hat 'null' als Rückgabewert, wenn Parsing fehlschlägt, .parse wirft als Rückgabewert lediglich "Unhandled exception: FormatException: Invalid radix-10 number", wenn Parsing fehlschlägt.
  int? calculus = int.tryParse(stdin.readLineSync() ?? '0');
  // var calculus = checkInput();

  // Prüfung Eingabewert für Rechenart:
  while (!calcTypes.keys.contains(calculus) || calculus == null) {
    print('\n');
    print(
      '\u001B[31m' +
          ' FEHLER: Für die Ziffer/Eingabe' +
          '\u001B[34m' +
          ' $calculus ' +
          '\u001B[31m' +
          'existiert keine Rechenart!',
    );
    print('\u001b[30m' + ' Gib eine korrekte Ziffer (aus obigem Menü) ein:');
    calculus = int.tryParse(stdin.readLineSync() ?? '0');
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

  // Eingabe von Operand 1:
  print(
    '\n' +
        ' Gib die ' +
        '${calculus != 6 ? 'erste ' : ''}' +
        'Zahl (${calcOperands[calculus]?.first}) ein:',
  );
  operand01 = double.tryParse(stdin.readLineSync() ?? '0');
  while (operand01 == null) {
    print('\n');
    print(
      '\u001B[31m' +
          ' FEHLER: Die Eingabe' +
          '\u001B[34m' +
          ' $operand01 ' +
          '\u001B[31m' +
          'ist keine Zahl!',
    );
    print('\u001b[30m' + ' Gib eine Zahl ein:');
    operand01 = double.tryParse(stdin.readLineSync() ?? '0');
  }

  // Eingabe von Operand 2 für Berechnungen, die 2.Operanden benötigen
  if (calculus != 6) {
    print('\n' + ' Gib die zweite Zahl (${calcOperands[calculus]?.last}) ein:');
    operand02 = double.tryParse(stdin.readLineSync() ?? '0');
    while (operand02 == null) {
      print('\n');
      print(
        '\u001B[31m' +
            ' FEHLER: Die Eingabe' +
            '\u001B[34m' +
            ' $operand02 ' +
            '\u001B[31m' +
            'ist keine Zahl!',
      );
      print('\u001b[30m' + ' Gib eine Zahl ein:');
      operand02 = double.tryParse(stdin.readLineSync() ?? '0');
    }
  }

  // Verarbeitung der Operanden je nach Rechenart:
  switch (calculus) {
    case 1:
      result = addition(operand01!, operand02!);
    case 2:
      result = subtraction(operand01!, operand02!);
    case 3:
      result = multiplication(operand01!, operand02!);
    case 4:
      result = division(operand01!, operand02!);
    case 5:
      result = modulo(operand01!, operand02!);
    case 6:
      result = root(operand01!);
    case 7:
      result = power(operand01!, operand02!);
    default:
      print(' Fehler: Keine Rechenart gewählt');
  }

  // Ausgabe des Rechenergebnisses:
  print('\n' + '- - - Das Ergebnis - - -');
  print('\n' + '\u001b[32m' + ' $result' + '\u001b[30m');
  print('\n' + '- - - - - - - - - - - - ' + '\n');

  // Eingabe zum Weiterrechnen:
  print(' Möchtest du weiterrechnen? (Ja = 1 / Nein = 0)');
  int continueCalc = int.parse(
    stdin.readLineSync() ?? '0',
  ); // To Do: Auf falsche Eingabewerte prüfen

  if (continueCalc == 1) {
    print(
      '\n' +
          ' Möchtest du mit dem vorigen Ergebnis (' +
          '\u001b[34m' +
          '$result' +
          '\u001b[30m' +
          ') weiterrechnen? (Ja = 1 / Nein = 0)',
    );

    int saveNumber = int.parse(
      stdin.readLineSync() ?? '0',
    ); // To Do: Auf falsche Eingabewerte prüfen

    if (saveNumber == 1) {
      print(
        '\n' +
            ' Möchtest du mit ' +
            '\u001b[34m' +
            '$result' +
            '\u001b[30m' +
            ' als 1.Operand oder 2.Operand weiterrechnen? (1.Operand = 1 / 2.Operand = 2)',
      );

      int chosenNumber = int.parse(
        stdin.readLineSync() ?? '0',
      ); // To Do: Auf falsche Eingabewerte prüfen

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

checkInput() {
  int? number = int.tryParse(stdin.readLineSync() ?? '0');
  var result = number != null ? number : false;
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
