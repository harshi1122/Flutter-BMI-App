import 'dart:math';

class Calculation{

  Calculation({this.height,this.weight});
  final int height;
  final int weight;
  double _bmi;
  String calculateBMI(){
    _bmi = weight / pow(height / 100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String getResult(){
    if (_bmi >= 25)
      return 'Overweight';
    else if (_bmi > 18.5 )
      return 'Normal';
    else
      return 'UnderWeight';
  }

  String getInterpretation(){
    if (_bmi >= 25)
      return 'Well. This is not good. Hit the gym.';
    else if (_bmi > 18.5 )
      return 'You have a normal body weight. Good job!';
    else
      return 'Uh-oh! Looks like someone should try adding a few calories.';
  }

}