import "dart:io";

void main() {
  final int agePerson;
  bool hasParentalConsent = false;
  int movieAgeRating = 16;
  String movie = "The Dark Knight";

  // Alterseingabe
  print(
    "\n" + "Du möchtest den Film '$movie' (FSK $movieAgeRating) ausleihen.",
  );
  print("Altersprüfung: Bitte gib dein Alter ein:");
  String? inputAge = stdin.readLineSync();
  agePerson = int.parse(inputAge ?? '0');

  if (agePerson < movieAgeRating) {
    print(
      "\n" +
          "Du bist zu jung, um diesen Film anzusehen! Hast du eine Erlaubnis deiner Eltern?",
    );
    // Erlaubnisabfrage
    print("Bitte gib 'Ja' oder 'Nein' ein:");
    String? inputConsent = stdin.readLineSync();
    if (inputConsent == "Ja") {
      hasParentalConsent = true;
      int minAge = movieAgeRating - 2;
      bool isMinAge = agePerson > minAge;

      // print(
      //   "Das Mindestalter ist: $minAge, das Alter der Person ist $agePerson, hasParentalConsent ist $hasParentalConsent und isMinAge ist $isMinAge",
      // );

      if (isMinAge && hasParentalConsent) {
        print("\n" + "Der Film '$movie' liegt für dich bereit!" + "\n");
      } else {
        print(
          "\n" +
              "Dein Alter liegt zu weit unter der Altersfreigabe. Du kannst den Film '$movie' trotz elterlicher Erlaubnis nicht ausleihen." +
              "\n",
        );
      }
    } else {
      print(
        "\n" +
            "Ohne elterliche Erlaubnis kannst du den Film nicht ausleihen!" +
            "\n",
      );
    }
  } else {
    print("\n" + "Dein Film liegt für dich bereit!" + "\n");
  }
}
