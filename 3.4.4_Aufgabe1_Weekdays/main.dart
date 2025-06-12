enum Weekday { monday, tuesday, wednesday, thursday, friday, saturday, sunday }

void main() {
  Weekday? weekday;

  switch (weekday) {
    case (Weekday.monday || Weekday.tuesday):
      print('Montag und Dienstag sind anstrengend');
      break;
    // Heute gelernt, dass nur in Dart breaks in switch nicht nötig sind,
    //sobald die erste Kondition true ist, auch wenn andere danach noch true sind.
    //Da break; in Dart aber auch nicht als falsch markiert wird,
    //lasse ich sie drin, da ich es aus Sicherheitsgründen
    //aus anderen Sprachen so gewohnt bin und diese Konvention wichtig finde.
    case (Weekday.wednesday || Weekday.thursday):
      print('Mittwoch und Donnerstag sind anstrengend');
      break;
    case (Weekday.friday):
      print('Freitag ist super');
      break;
    case (Weekday.saturday || Weekday.sunday):
      print('Wochenende ist genial');
      break;
    default:
      print('Kein Tag ausgewählt');
  }
}
