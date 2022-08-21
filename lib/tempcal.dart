import 'dart:math';

enum Result {
  tooHigh,
  tooLow,
  correct
}
class Temp_cal{
  static const defaultMaxRandom = 100;
  int? _answer;
  int _guessCount = 0;
  static final List<int> guessCountList = [];

  Temp_cal({int maxRandom = defaultMaxRandom}) {
    var r = Random();
    _answer = r.nextInt(maxRandom) + 1;
    print('The answer is $_answer');
  }

  int get guessCount {
    return _guessCount;
  }

  void addCountList() {
    guessCountList.add(_guessCount);
  }

  Result doGuess(double num) {
    _guessCount++;
    if (num > _answer!) {
      return Result.tooHigh;
    } else if (num < _answer!) {
      return Result.tooLow;
    } else {
      return Result.correct;
    }
  }
  double Celesius_to_Fahrenheit(double num) {
    return (9/5)*(num)+320;
}
  double Celesius_to_Kelvin(double num) {
    return (num)+273;
  }
  double Fahrenheit_to_Celesius(double num) {
    return (5/9)*(num-32);
  }
  double Fahrenheit_to_Kelvin(double num) {
    return (5/9)*(num - 32) + 273.15;
  }
  double Kelvin_to_Celesius(double num) {
    return (num)-273;
  }
  double Kelvin_to_Fahrenheit(double num) {
    return (9/5)*(num - 273) + 32;
  }
}