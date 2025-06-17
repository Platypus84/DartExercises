void main() {
  print('\n');
  for (int i = 1; i <= 100; i++) {
    if (i < 10) {
      print('Kleine Zahl:');
    } else if (i < 60) {
      print('Mittlere Zahl:');
    } else {
      print('Große Zahl:');
    }
    print('$i' + '\n');
  }
}
