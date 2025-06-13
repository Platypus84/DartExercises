import "dart:io";

void main() {
  double oderValue = 0;
  late int? distance; // in km
  bool rushHour = false;
  bool isRaining = false;
  bool inputCorrect = false;
  int orderSize = 3;
  double distanceFee = 0;
  double distanceSurcharge = 0;
  double weatherSurcharge = 0;
  double rushHourSurcharge = 0;
  double orderValue = 0;
  double amountDiscount = 0;
  double totalPrice = 0;

  // Distanzeingabe:
  print("\n" + "Gib eine Distanz in km ein:");
  String? inputDistance = stdin.readLineSync();
  distance = int.parse(inputDistance ?? "0");

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

  // Mindestbestellwert:
  if (orderValue < 15) {
    print(
      'Der Mindestbestellwert von 15 Euro wird unterschritten. Daher werden deinem Bestellwert zusätzlich 5 Euro Mindermengenzuschlag hinzugerechnet. Dein aktueller Gesamtbetrag ist ${orderValue = orderValue < 15 ? orderValue + 5 : orderValue}.',
    );
  }

  // Grundliefergebühr:
  distanceFee = distance <= 5 ? 2.5 : 0;
  distanceFee = (distance > 5 && distance <= 10) ? 3.5 : 0;
  distanceFee = distance > 10 ? 5 : 0;

  // Distanzzuschlag:
  distanceSurcharge = distance >= 5 ? (0.3 * (distance - 5).ceil()) : 0;

  // Wetterzuschlag:
  weatherSurcharge = isRaining ? 1.5 : 0;

  // Hauptverkehrszeitzuschlag:
  rushHourSurcharge = rushHour ? 2 : 0;

  // Mengenrabatt:
  if (orderSize > 3 && orderSize < 5) {
    amountDiscount = 0.5;
  } else if (orderSize >= 5 && orderSize <= 8) {
    amountDiscount = 1;
  } else if (orderSize > 8) {
    amountDiscount = 2;
  }
  print(
    "\n" +
        "Du hast $orderSize Artikel bestellt. ${orderSize > 3 ? "Du erhälst einen Mengenrabatt von $amountDiscount Euro!" : ""}" +
        "\n",
  );

  // Maximalkostenregel:

  double sumFee =
      distanceFee + distanceSurcharge + weatherSurcharge + rushHourSurcharge;

  String deliveryFee = sumFee.toStringAsFixed(2);

  print('Die Fee ist $deliveryFee');

  if (sumFee > totalPrice * 0.4) {
    print('Fehler: Lieferkosten betragen mehr als 40% des Bestellwerts');
  }
}
