enum Weekday { monday, tuesday, wednesday, thursday, friday, saturday, sunday }

void main() {
  Weekday? weekday;

  switch (weekday) {
    case (Weekday.monday || Weekday.tuesday):
      print('Montag und Dienstag sind anstrengend');
      break;
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
