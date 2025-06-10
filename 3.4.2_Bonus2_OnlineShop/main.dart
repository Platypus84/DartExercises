import "dart:io";

void main() {
  double totalAmount = 0;
  double discount = 0;
  bool isStudent = false;
  bool hasVoucher = false;
  bool isLoyalCustomer = false;
  bool inputCorrect = false;
  String discountMessage = "Standardpreis";

  print("\n" + "Bitte gib eine Gesamtsumme ein (150 oder 250):");
  String? inputTotalAmount = stdin.readLineSync();
  totalAmount = double.parse(inputTotalAmount ?? "0");
  if (totalAmount == 250 || totalAmount == 150) {
    inputCorrect = true;
  } else {
    print("\n" + "Falsche Eingabe! Starte das Programm neu!" + "\n");
  }

  if (inputCorrect) {
    print("\n" + "Ich bin ein Student (Ja/Nein):");
    String? inputStudent = stdin.readLineSync();
    isStudent = inputStudent == "Ja" ? true : false;

    print("\n" + "Ich bin Stammkunde (Ja/Nein):");
    String? inputLoyalCustomer = stdin.readLineSync();
    isLoyalCustomer = inputLoyalCustomer == "Ja" ? true : false;

    print("\n" + "Ich habe einen Gutschein (Ja/Nein):");
    String? inputVoucher = stdin.readLineSync();
    hasVoucher = inputVoucher == "Ja" ? true : false;

    double studentDiscount = isStudent ? 0.05 : 0;
    double loyalDiscount = isLoyalCustomer ? 0.1 : 0;
    double voucherDiscount = hasVoucher ? 0.15 : 0;
    double priceDiscount = totalAmount > 200 ? 0.05 : 0;

    if (studentDiscount > 0) {
      discount = studentDiscount;
    }
    if (loyalDiscount > 0) {
      discount = loyalDiscount;
    }
    if (voucherDiscount > 0) {
      discount = voucherDiscount;
    }

    if (discount > 0 && priceDiscount > 0) {
      if (discount > 0.15) {
        discountMessage = "Super Spar-Deal!";
      }
      totalAmount = totalAmount - (totalAmount * (discount + priceDiscount));
    } else if (discount > 0) {
      discountMessage = "Normaler Rabatt";
      totalAmount = totalAmount - (totalAmount * discount + priceDiscount);
    }

    print(
      "\n" +
          "$discountMessage - Der Gesamtpreis beträgt $totalAmount Euro." +
          "\n",
    );
  }
}
