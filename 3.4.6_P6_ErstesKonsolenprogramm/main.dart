import 'dart:io';
import 'dart:math';

void main() {
  calculator();
}

void calculator() {
  late double number01;
  late double number02;
  late double result;
  Map<int,String> calcTypes = {1:'Addition', 2:'Subtraktion', 3:'Multiplikation', 4:'Division'};

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
  print('\n' + 'Du hast <Platzhalter> als Rechenart gewählt.');

  // Eingabe der Zahlen
  print('\n' + 'Gib die erste Zahl ein:');
  number01 = double.parse(stdin.readLineSync() ?? '0');

  if (calculus != 6) {
    print('\n' + 'Gib die zweite Zahl ein:');
    number02 = double.parse(stdin.readLineSync() ?? '0');
  }

  switch (calculus) {
    case 1:
      result = addition(number01, number02);
    case 2:
      result = subtraction(number01, number02);
    case 3:
      result = multiplication(number01, number02);
    case 4:
      result = division(number01, number02);
    case 5:
      result = modulo(number01, number02);
    case 6:
      result = root(number01);
    default:
      print('Fehler: Keine Rechenart gewählt');
  }
  print('\n' + '- - - Das Ergebnis - - -');
  print('\n' + '$result');
  print('\n' + '- - - - - -');
}

double addition(num01, num02) {
  double result = num01 + num02;
  return result;
}

double subtraction(num01, num02) {
  double result = num01 - num02;
  return result;
}

double multiplication(num01, num02) {
  double result = num01 * num02;
  return result;
}

double division(num01, num02) {
  double result = num01 / num02;
  return result;
}

double modulo(num01, num02) {
  double result = num01 % num02;
  return result;
}

double root(num01) {
  double result = sqrt(num01);
  return result;
}
