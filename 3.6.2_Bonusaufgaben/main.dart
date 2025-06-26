void main() {
  // Bonusaufgabe 1:
  Person('Thomas', 33);
  print('\n' + 'Bonusaufgabe 1:');
  print(Person('Thomas', 33).name);
  print(Person('Thomas', 33).age);
  // alternativ:
  print('\n' + 'Bonusaufgabe 1 Alternative:');
  Person person = Person('Thomas', 33);
  print(person.name);
  print(person.age);

  // Bonusaufgabe 2:
  Button b = Button(
    'In den Warenkorb',
    width: 96,
    height: 32,
    radius: 4,
    fontSize: 14,
    padding: 8,
  );

  // Bonusaufgabe 3 + 4:
  Rechteck Rectangle1 = Rechteck(x: 20, y: 80);
  Rechteck Rectangle2 = Rechteck(x: 70.5, y: 80);
  print('\n' + 'Bonusaufgabe 3 + 4:');
  print('Beispiel 1:');
  print(Rectangle1.calculatePerimeter());
  print(Rectangle1.calculateSurface());
  print('Beispiel 2:');
  print(Rectangle2.calculatePerimeter());
  print(Rectangle2.calculateSurface());

  // Bonusaufgabe 5:
  print('\n' + 'Bonusaufgabe 5:');
  Map<String, num> scaledMeasures = Rectangle1.scale(2);
  print(scaledMeasures);

  // Bonusaufgabe 6:
  print('\n' + 'Bonusaufgabe 6:');

  Author author1 = new Author(
    name: 'Michael Ende',
    birthday: DateTime.utc(1923, 11, 12),
  );

  Book book1 = new Book(
    author: author1,
    bookTitle: 'Die unendliche Geschichte',
    pageCount: 428,
  );

  print(
    'Buchtitel: ${book1.bookTitle}' +
        '\n' +
        'Seitenanzahl: ${book1.pageCount}' +
        '\n' +
        'Autor: ${book1.author.name}' +
        '\n',
  );
}

// Bonusaufgabe 1
class Person {
  final String name;
  final int age;

  Person(this.name, this.age);
}

// Bonusaufgabe 2
class Button {
  String buttonTitle;
  int width;
  int height;
  int radius;
  int fontSize;
  int padding;

  Button(
    this.buttonTitle, {
    required this.width,
    required this.height,
    required this.radius,
    required this.fontSize,
    required this.padding,
  });
}

// Bonusaufgabe 3 + 4 + 5
class Rechteck {
  late num x;
  late num y;

  Rechteck({required this.x, required this.y});

  num calculatePerimeter() {
    num perimeter = (2 * this.y) + (2 * this.x);
    return perimeter;
  }

  num calculateSurface() {
    num surface = this.y * this.x;
    return surface;
  }

  Map<String, num> scale(double scaleFactor) {
    num newX = this.x * scaleFactor;
    num newY = this.y * scaleFactor;
    return <String, num>{'x': newX, 'y': newY};
  }
}

// Bonusaufgabe 6
class Author {
  late String name;
  late DateTime birthday;

  Author({required this.name, required this.birthday});
}

class Book {
  late String bookTitle;
  late int pageCount;
  late Author author;

  Book({
    required this.bookTitle,
    required this.pageCount,
    required this.author,
  });
}
