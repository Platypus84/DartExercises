class Terminalcolors {
  String _letterColor = '';
  String _backgroundColor = '';
  //void activateColors;

  Terminalcolors(String letterColor, String backgroundColor) {
    this._letterColor = letterColor;
    this._backgroundColor = backgroundColor;
    //this.activateColors = this._getTerminalColors(letterColor, backgroundColor);
  }

  // void set setLetterColor(String letterColor) {
  //   this._letterColor = letterColor;
  // }

  void activateColors() {
    _getTerminalColors(this._letterColor, this._backgroundColor);
  }

  void _getTerminalColors(String letterColor, String backgroundColor) {
    String colorPrefix = '\u001B[';

    switch (letterColor) {
      case 'black':
        letterColor = '30m';
      case 'white':
        letterColor = '37m';
      case 'red':
        letterColor = '31m';
      case 'blue':
        letterColor = '34m';
      case 'green':
        letterColor = '32m';
      default:
        letterColor = '30m';
    }

    switch (backgroundColor) {
      case 'black':
        backgroundColor = '40m';
      case 'white':
        backgroundColor = '47m';
      case 'red':
        backgroundColor = '41m';
      case 'blue':
        backgroundColor = '44m';
      case 'green':
        backgroundColor = '42m';
      default:
        backgroundColor = '40m';
    }

    letterColor = colorPrefix + letterColor;
    backgroundColor = colorPrefix + backgroundColor;
    print(letterColor + backgroundColor);
  }
}
