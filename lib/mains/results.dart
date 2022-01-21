import 'package:bmi_calculator/ib/bottombutton.dart';
import 'constants.dart';
import 'package:flutter/material.dart';
import '../ib/reusablecard.dart';

class ResultsPage extends StatelessWidget {
  final String bmiResult;
  final String resultText;
  final String desc;
  ResultsPage(
      {@required this.bmiResult,
        @required this.resultText,
        @required this.desc,});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Calculator'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
              child: Container(
                  padding: EdgeInsets.all(15.0),
                  alignment: Alignment.bottomLeft,
                  child: Text(
                    'Your Result',
                    style: kTitleTextStyle,
                  ))),
          Expanded(
            flex: 5,
            child: ReusableCard(
              cardChild: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    child: Text(
                      resultText.toUpperCase(),
                      style: kResultTextStyle,
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Text(
                    bmiResult,
                    style: kBMITextStyle,
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Text(
                      desc,
                      textAlign: TextAlign.center,
                      style: kBodyTextStyle,
                    ),
                  ),
                ],
              ),
              color: activeCardColor,
            ),
          ),
          BottomButton(
            buttonTitle: 'RE-CALCULATE YOUR BMI ',
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}