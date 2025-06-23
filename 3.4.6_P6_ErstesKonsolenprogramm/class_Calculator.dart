import 'dart:io';
import 'dart:math';

class Calculator {
  late double? _operand01;
  double? _operand02;
  double? _result;
  late int? _continueCalc;
  late int? _saveResult;
  double? _chosenNumber;

  Map<int, String> _calcTypes = {
    1: 'Addition',
    2: 'Subtraktion',
    3: 'Multiplikation',
    4: 'Division',
    5: 'Modulo', // to Do: unzulässig für Fließkommazahlen? / nur in C? -> checken)
    6: 'Quadratwurzel',
    7: 'Potenz',
  };

  Calculator() {
    print('\n' + ' TASCHENRECHNER 🤓');
  }

  void runCalculator() {
    // Ausgabe Taschenrechner Funktionsmenü:
    print('\n' + ' Wähle eine Rechenart aus der Liste anhand ihrer Ziffer:');
    print(' - - - - - - - - - -');
    this._calcTypes.forEach((key, value) {
      print(' $value = $key');
    });
    print(' - - - - - - - - - -' + '\n');

    // Eingabe der Rechenart mit Prüfung, ob Eingabe null
    // Note to self: .tryParse() ist prüfbar und hat 'null' als Rückgabewert, wenn Parsing fehlschlägt, .parse wirft als Rückgabewert lediglich "Unhandled exception: FormatException: Invalid radix-10 number", wenn Parsing fehlschlägt.
    int? calculus = int.tryParse(stdin.readLineSync() ?? '0');

    // Prüfung Eingabewert für Rechenart:
    while (!this._calcTypes.keys.contains(calculus) || calculus == null) {
      print('\n');
      print(
        '\u001B[31m' +
            ' ❌ FEHLER: Für die Ziffer/Eingabe' +
            '\u001B[34m' +
            ' $calculus ' +
            '\u001B[31m' +
            'existiert keine Rechenart!',
      );
      print(
        '\u001b[30m' +
            ' Gib eine korrekte Ziffer (aus obigem Menü) ein:' +
            '\n',
      );
      calculus = int.tryParse(stdin.readLineSync() ?? '0');
    }

    // Ausgabe der gewählten Rechenart:
    print(
      '\n' +
          ' Du hast ' +
          '\u001b[34m' +
          '${this._calcTypes[calculus]}' +
          '\u001b[30m' +
          ' als Rechenart gewählt.',
    );

    if (this._result != null && this._chosenNumber == 1) {
      this._operand01 = this._result;
      print('\n' + ' Deine gespeicherte 1.Zahl ist ${this._operand01}');
    } else {
      this._operand01 = this._inputOperand(1, calculus);
    }

    if (calculus != 6) {
      if (this._result != null && this._chosenNumber == 2) {
        this._operand02 = this._result;
        print('\n' + ' Deine gespeicherte 2.Zahl ist ${this._operand02}');
      } else {
        this._operand02 = this._inputOperand(2, calculus);
      }
    }

    // Verarbeitung der Operanden je nach Rechenart:
    this._result = this._calculate(
      this._operand01!,
      this._operand02 ?? 0,
      calculus,
    );

    // Ausgabe des Rechenergebnisses:
    print('\n' + ' - - - Das Ergebnis - - -');
    print('\n' + ' 🟢 ' + '\u001b[32m' + ' ${this._result}' + '\u001b[30m');
    print('\n' + ' - - - - - - - - - - - - ' + '\n');

    // Eingabe zum Weiterrechnen:
    print(' Möchtest du weiterrechnen? (Ja = 1 / Nein = 0)' + '\n');
    this._continueCalc = int.tryParse(stdin.readLineSync() ?? '0');
    this._continueCalc = this._validateInput(this._continueCalc, int);

    if (this._continueCalc == 1) {
      print(
        '\n' +
            ' Möchtest du mit dem vorigen Ergebnis (' +
            '\u001b[34m' +
            '${this._result}' +
            '\u001b[30m' +
            ') weiterrechnen? (Ja = 1 / Nein = 0)' +
            '\n',
      );

      this._saveResult = int.tryParse(stdin.readLineSync() ?? '0');
      this._saveResult = this._validateInput(this._saveResult, int);

      if (this._saveResult == 1) {
        print(
          '\n' +
              ' Möchtest du mit ' +
              '\u001b[34m' +
              '${this._result}‚' +
              '\u001b[30m' +
              ' als 1.Operand oder 2.Operand weiterrechnen? (1.Operand = 1 / 2.Operand = 2)' +
              '\n',
        );

        this._chosenNumber = double.tryParse(stdin.readLineSync() ?? '0');
        this._chosenNumber = this._validateInput(this._chosenNumber, double);

        if (this._chosenNumber == 1) {
          this._operand02 = null;
        } else {
          this._chosenNumber = 2;
          this._operand01 = null;
        }
      } else {
        this._operand01 = null;
        this._operand02 = null;
        this._chosenNumber = null;
        this._result = null;
      }

      runCalculator();
    } else {
      print('\n' + ' Bis bald!' + '\n');
    }
  }

  double? _inputOperand(int operandNumber, int calculus) {
    Map<int, List<String>> _calcOperands = {
      1: ['Summand 1', 'Summand 2'],
      2: ['Minuend', 'Subtrahend'],
      3: ['Multiplikator', 'Multiplikand'],
      4: ['Dividend', 'Divisor'],
      5: ['Dividend', 'Divisor'],
      6: ['Radikand', ''],
      7: ['Basis', 'Exponent'],
    };
    String? operandName = operandNumber == 1
        ? _calcOperands[calculus]?.first
        : _calcOperands[calculus]?.last;
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
    operand = this._validateInput(operand, double);
    return operand;
  }

  dynamic _validateInput(var operand, var inputType) {
    // print("Runtime Typ ist ${operand.runtimeType}");
    while (operand == null) {
      print('\n');
      print(
        '\u001B[31m' +
            ' ❌ FEHLER: Die Eingabe' +
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

  double _calculate(double operand01, double operand02, int calcType) {
    late double _result;
    switch (calcType) {
      case 1:
        _result = operand01 + operand02;
      case 2:
        _result = operand01 - operand02;
      case 3:
        _result = operand01 * operand02;
      case 4:
        _result = operand01 / operand02;
      case 5:
        _result = operand01 % operand02;
      case 6:
        _result = sqrt(operand01);
      case 7:
        _result = pow(operand01, operand02).toDouble();
    }
    return _result;
  }
}
