import 'class_Calculator.dart';
import 'class_TerminalColors.dart';

void main() {
  Terminalcolors terminalColors = new Terminalcolors('black', 'white');
  terminalColors.activateColors();

  Calculator calculator = new Calculator();
  calculator.runCalculator();
}
