import 'dart:io';
import 'dart:math';

void main() {
  calculator();
}

void calculator() {
  late double operand01;
  late double operand02;
  late double result;

  Map<int, String> calcTypes = {
    1: 'Addition',
    2: 'Subtraktion',
    3: 'Multiplikation',
    4: 'Division',
  };

  Map<int, List<String>> calcOperands = {
    1: ['Summand 1', 'Summand 2'],
    2: ['Minuend', 'Subtrahend'],
    3: ['Multiplikator', 'Multiplikand'],
    4: ['Dividend', 'Divisor'],
  };

  print(
    '\n' + 'Dein Taschenrechner - Wähle eine Rechenart mit einer Ziffer aus:',
  );
  print('- - - - - - - - - -');
  print('Addition = 1');
  print('Subtraktion = 2');
  print('Multiplikation = 3');
  print('Division = 4');
  print('Modulo = 5');
  print('Quadratwurzel = 6');
  print('- - - - - - - - - -' + '\n');
  int calculus = int.parse(stdin.readLineSync() ?? '0');

  // Ausgabe der gewählten Rechenart
  print('\n' + 'Du hast ${calcTypes[calculus]} als Rechenart gewählt.');

  // Eingabe der Zahlen
  print('\n' + 'Gib die erste Zahl (${calcOperands[calculus]?.first}) ein:');
  operand01 = double.parse(stdin.readLineSync() ?? '0');

  if (calculus != 6) {
    print('\n' + 'Gib die zweite Zahl (${calcOperands[calculus]?.last}) ein:');
    operand02 = double.parse(stdin.readLineSync() ?? '0');
  }

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
      print('Fehler: Keine Rechenart gewählt');
  }
  print('\n' + '- - - Das Ergebnis - - -');
  print('\n' + '$result');
  print('\n' + '- - - - - -');
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
