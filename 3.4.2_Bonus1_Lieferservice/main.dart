import "dart:io";

void main() {
  double oderValue = 0;
  int distance = 36; // in km
  bool rushHour = false;
  bool isRaining = false;
  bool inputCorrect = false;
  int orderSize = 0;
  double deliveryFee = 0;
  double distanceSurcharge = 0;
  double weatherSurcharge = 0;
  double rushHourSurcharge = 0;
  int amountItems = 0;
  double orderValue = 0;
  double amountDiscount = 0;
  double totalPrice = 0;

  // Grundliefergebühr:
  deliveryFee = distance <= 5 ? 2.5 : 0;
  deliveryFee = (distance > 5 ?? distance <= 10) ? 3.5 : 0;
  deliveryFee = distance > 10 ? 5 : 0;

  // Distanzzuschlag:
  distanceSurcharge = distance >= 5 ? (0.3 * (distance - 5).ceil()) : 0;

  // Wetterzuschlag:
  weatherSurcharge = isRaining ? 1.5 : 0;

  // Hauptverkehrszeitzuschlag:
  rushHourSurcharge = rushHour ? 2 : 0;

  // Mengenrabatt:
  if (amountItems > 3 && amountItems < 5) {
    amountDiscount = 0.5;
  } else if (amountItems >= 5 && amountItems <= 8) {
    amountDiscount = 1;
  } else if (amountItems > 8) {
    amountDiscount = 2;
  }

  // Mindestbestellwert:
  totalPrice < 15 ? totalPrice + 5 : totalPrice;

  // Maximalkostenregel:

  // Bestellwerteingabe:

  print("\n" + "Bitte gib einen Bestellwert ein:");
  String? inputOrderValue = stdin.readLineSync();
  orderValue = double.parse(inputOrderValue ?? "0");
  // print("Order Value ist '$orderValue' Euro");
  if (oderValue > 0) {
    print("\n" + "Falsche Eingabe! Starte das Programm neu!" + "\n");
  } else {
    inputCorrect = true;
  }

  if (inputCorrect) {
    print("\n" + "Regnet es gerade? (Ja/Nein):");
    String? inputRain = stdin.readLineSync();
    isRaining = inputRain == "Ja" ? true : false;

    print("\n" + "Ist gerade Rush Hour (Ja/Nein):");
    String? inputRushHour = stdin.readLineSync();
    rushHour = inputRushHour == "Ja" ? true : false;
  }
}
