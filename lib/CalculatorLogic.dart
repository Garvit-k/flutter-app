/*
* @author : Garvit Kothari
*/
import 'dart:math';

class CalculatorLogic {

  double add(double num1,double num2) {
    return num1+num2;
  }
  double sub(double num1, double num2) {
    return num1-num2;
  }
  double mul(double num1, double num2) {
    return num1*num2;
  }
  double div(double num1, double num2) {
    return (num1/num2);
  }
  double power(double num1, double num2) {
    return pow(num1,num2);
  }
  double logrit(double num1) {
    return log(num1);
  }
  double sina(double num1) {
    return sin(num1);
  }
  double cosa(double num1) {
    return cos(num1);
  }
  double tana(double num1) {
    return tan(num1);
  }
}