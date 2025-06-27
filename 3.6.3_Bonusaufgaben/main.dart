main() {
  Hammer hammer1 = Hammer('Jup');
  Saw saege1 = Saw('Ritschratsch!', name: 'Säge', marke: 'Obi', gewicht: 0.7);

  saege1.sawMessage();

  Milk milch = Milk('Milli Vanilli', 'Milbona', 1000, 1.19);
  milch.groceryMessage();
  print('Ich werde bei ${milch.getHersteller} hergestellt!' + '\n');

  Butter butter = Butter('Butter', 'Kerry Gold', 250, 3.99);
  butter.groceryMessage();
}

class Tool {
  String name;
  String marke;
  double gewicht; // in kg

  Tool({required this.name, required this.marke, required this.gewicht});
}

class Hammer extends Tool {
  String dubidu;

  Hammer(this.dubidu)
    : super(
        name: 'Blub',
        marke: 'dub',
        gewicht: 1,
      ); // zur eigenen Übung mal die Parent-Parameter anders gesetzt und mit Werten vorbelegt.

  void haemmern() {}
}

class Saw extends Tool {
  String keineAhnung;

  Saw(
    this.keineAhnung, {
    required super.name,
    required super.marke,
    required super.gewicht,
  });

  void sawMessage() {
    print('\n' + 'Hallo... ich möchte ein Spiel spielen!' + '\n');
  }

  void saegen() {}
}

class Grocery {
  String name;
  String hersteller;
  int gewicht; // in Gramm
  double preis;

  Grocery(this.name, this.hersteller, this.gewicht, this.preis);

  get getHersteller {
    return this.hersteller;
  }

  groceryMessage() {
    print('Ich bin ein Lebensmittel' + '\n');
  }
}

class Milk extends Grocery {
  Milk(super.name, super.hersteller, super.gewicht, super.preis);

  @override
  groceryMessage() {
    print('Ich bin eine Milch! Frisch und leggaaaa!' + '\n');
  }
}

class Butter extends Grocery {
  Butter(super.name, super.hersteller, super.gewicht, super.preis);

  @override
  groceryMessage() {
    print('Ich bin eine ${this.name}! Mild und streichfest!' + '\n');
  }
}
