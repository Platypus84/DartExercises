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
  double? operand02 = 0;
  late double result;
  late int? continueCalc;
  late int? saveResult;
  late double? chosenNumber;

  Map<int, String> calcTypes = {
    1: 'Addition',
    2: 'Subtraktion',
    3: 'Multiplikation',
    4: 'Division',
    5: 'Modulo', // to Do: unzulässig für Fließkommazahlen? / nur in C? -> checken)
    6: 'Quadratwurzel',
    7: 'Potenz',
  };

  print('\n' + ' TASCHENRECHNER');

  calculatorMenu(calcTypes);

  // Eingabe der Rechenart mit Prüfung, ob Eingabe null
  // Note to self: .tryParse() ist prüfbar und hat 'null' als Rückgabewert, wenn Parsing fehlschlägt, .parse wirft als Rückgabewert lediglich "Unhandled exception: FormatException: Invalid radix-10 number", wenn Parsing fehlschlägt.
  int? calculus = int.tryParse(stdin.readLineSync() ?? '0');

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
    print(
      '\u001b[30m' + ' Gib eine korrekte Ziffer (aus obigem Menü) ein:' + '\n',
    );
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

  operand01 = inputOperand(1, calculus);

  if (calculus != 6) {
    operand02 = inputOperand(2, calculus);
  }

  // Verarbeitung der Operanden je nach Rechenart:
  result = calculate(operand01!, operand02!, calculus);

  // Ausgabe des Rechenergebnisses:
  print('\n' + ' - - - Das Ergebnis - - -');
  print('\n' + '\u001b[32m' + ' $result' + '\u001b[30m');
  print('\n' + ' - - - - - - - - - - - - ' + '\n');

  // Eingabe zum Weiterrechnen:
  print(' Möchtest du weiterrechnen? (Ja = 1 / Nein = 0)' + '\n');
  continueCalc = int.tryParse(stdin.readLineSync() ?? '0');
  continueCalc = checkInput(continueCalc, int);

  if (continueCalc == 1) {
    print(
      '\n' +
          ' Möchtest du mit dem vorigen Ergebnis (' +
          '\u001b[34m' +
          '$result' +
          '\u001b[30m' +
          ') weiterrechnen? (Ja = 1 / Nein = 0)' +
          '\n',
    );

    saveResult = int.tryParse(stdin.readLineSync() ?? '0');
    saveResult = checkInput(saveResult, int);

    if (saveResult == 1) {
      print(
        '\n' +
            ' Möchtest du mit ' +
            '\u001b[34m' +
            '$result' +
            '\u001b[30m' +
            ' als 1.Operand oder 2.Operand weiterrechnen? (1.Operand = 1 / 2.Operand = 2)' +
            '\n',
      );

      chosenNumber = double.tryParse(stdin.readLineSync() ?? '0');
      chosenNumber = checkInput(chosenNumber, double);

      if (chosenNumber == 1) {
        operand01 = result;
        operand02 = 0;
      } else {
        operand01 = 0;
        operand02 = result;
      }
    } else {} // To Do: Hauptmenü aufrufen
  } else {
    print('\n' + ' Bis bald!' + '\n');
  }

  calculatorMenu(calcTypes);
}

calculatorMenu(calcTypes) {
  // Ausgabe Taschenrechner Funktionsmenü:
  print('\n' + ' Wähle eine Rechenart aus der Liste anhand ihrer Ziffer:');
  print(' - - - - - - - - - -');
  calcTypes.forEach((key, value) {
    print(' $value = $key');
  });
  print(' - - - - - - - - - -' + '\n');
}

double? inputOperand(int operandNumber, int calculus) {
  Map<int, List<String>> calcOperands = {
    1: ['Summand 1', 'Summand 2'],
    2: ['Minuend', 'Subtrahend'],
    3: ['Multiplikator', 'Multiplikand'],
    4: ['Dividend', 'Divisor'],
    5: ['Dividend', 'Divisor'],
    6: ['Radikand', ''],
    7: ['Basis', 'Exponent'],
  };
  String? operandName = operandNumber == 1
      ? calcOperands[calculus]?.first
      : calcOperands[calculus]?.last;
  print(
    '\n' +
        ' Gib die ' +
        '${(operandNumber == 1)
            ? calculus != 6
                  ? 'erste '
                  : ''
            : (operandNumber == 2 ? 'zweite ' : '')}' +
        'Zahl ($operandName) ein!' +
        '\n',
  );
  double? operand = double.tryParse(stdin.readLineSync() ?? '0');
  operand = checkInput(operand, double);
  return operand;
}

double calculate(double operand01, double operand02, int calcType) {
  late double result;
  switch (calcType) {
    case 1:
      result = operand01 + operand02;
    case 2:
      result = operand01 - operand02;
    case 3:
      result = operand01 * operand02;
    case 4:
      result = operand01 / operand02;
    case 5:
      result = operand01 % operand02;
    case 6:
      result = sqrt(operand01);
    case 7:
      result = pow(operand01, operand02).toDouble();
  }
  return result;
}

checkInput(var operand, var inputType) {
  // print("Runtime Typ ist ${operand.runtimeType}");
  while (operand == null) {
    print('\n');
    print(
      '\u001B[31m' +
          ' FEHLER: Die Eingabe' +
          '\u001B[34m' +
          ' $operand ' +
          '\u001B[31m' +
          'ist keine Zahl!',
    );
    print('\u001b[30m' + ' Gib eine Zahl ein:');
    if (inputType == double) {
      operand = double.tryParse(stdin.readLineSync() ?? '0');
    } else if (inputType == int) {
      operand = int.tryParse(stdin.readLineSync() ?? '0');
    }
  }
  return operand;
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
