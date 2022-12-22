import 'package:get/get.dart';

class CalculationController extends GetxController {
  String _currentSign = "+";

  String get currentSign => _currentSign;

  //First operand
  int _numOne = 0;

  int get numOne => _numOne;

  //Second operand
  int _numTwo = 0;

  int get numTwo => _numTwo;

  //Result of the operation
  int _result = 0;

  int get result => _result;

  void increaseNumOne() {
    _numOne++;
    update();
  }

  void increaseNumTwo() {
    _numTwo++;
    update();
  }

  void decreaseNumOne() {
    _numOne--;
    update();
  }

  void decreaseNumTwo() {
    _numTwo--;
    update();
  }

  void add() {
    _currentSign = "+";
    _result = _numOne + _numTwo;
    update();
  }

  void subtract() {
    _currentSign = "-";
    _result = _numOne - _numTwo;
    update();
  }

  void multiply() {
    _currentSign = "x";
    _result = _numOne * _numTwo;
    update();
  }

  void divide() {
    _currentSign = "/";
    _result = _numOne ~/ _numTwo;
    update();
  }

  void reset() {
    _numOne = 0;
    _numTwo = 0;
    _result = 0;
    update();
  }
}
