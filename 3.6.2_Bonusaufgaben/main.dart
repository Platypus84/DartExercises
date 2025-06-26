void main() {
  Button b = Button('In den Warenkorb', 96, 32, 4, 14, 8);
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
    this.buttonTitle,
    this.width,
    this.height,
    this.radius,
    this.fontSize,
    this.padding,
  );
}
