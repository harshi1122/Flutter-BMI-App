import 'package:bmi_calculator/mains/calculation and display.dart';
import 'package:bmi_calculator/mains/results.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bmi_calculator/ib/reusablecard.dart';
import '../ib/icon.dart';
import 'constants.dart';
import '../ib/bottombutton.dart';
import '../ib/roundbuttonicon.dart';

enum Gender { MALE, FEMALE }

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender selectedGender;
  int height = 170;
  int weight = 65;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: ReusableCard(
                      onPress: () {
                        setState(() {
                          selectedGender = Gender.MALE;
                        });
                      },
                      cardChild: IconContent(
                        icon: Icon(
                          FontAwesomeIcons.mars,
                          size: 80.0,
                        ),
                        label: 'MALE',
                      ),
                      color: selectedGender == Gender.MALE
                          ? inactiveCardColor
                          : activeCardColor,
                    ),
                  ),
                  Expanded(
                    child: ReusableCard(
                      onPress: () {
                        setState(() {
                          selectedGender = Gender.FEMALE;
                        });
                      },
                      cardChild: IconContent(
                        icon: Icon(FontAwesomeIcons.venus, size: 80.0),
                        label: 'FEMALE',
                      ),
                      color: selectedGender == Gender.FEMALE
                          ? inactiveCardColor
                          : activeCardColor,
                    ),
                  ),
                ],
              )),
          Expanded(
            child: ReusableCard(
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('HEIGHT (cm)'),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        height.toString(),
                        style: kNumberTextStyle,
                      ),
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      thumbShape: RoundSliderThumbShape(
                        enabledThumbRadius: 15.0,
                      ),
                      overlayShape:
                      RoundSliderOverlayShape(overlayRadius: 30.0),
                      thumbColor: KBottomContainerColor,
                      activeTrackColor: Colors.white,
                      overlayColor: Color(0x15EB1555),
                    ),
                    child: Slider(
                      value: height.toDouble(),
                      max: 220.0,
                      min: 120,
                      onChanged: (double newValue) {
                        setState(() {
                          height = newValue.round();
                        });
                      },
                      inactiveColor: Color(0xFF8D8E89),
                    ),
                  ),
                ],
              ),
              color: activeCardColor,
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'WEIGHT (kg)',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          weight.toString(),
                          style: kNumberTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(
                              child: Icon(
                                FontAwesomeIcons.minus,
                              ),
                              onPressed: () {
                                setState(() {
                                  weight--;
                                  print(weight.toString());
                                });
                              },
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            RoundIconButton(
                              child: Icon(
                                FontAwesomeIcons.plus,
                              ),
                              onPressed: () {
                                setState(() {
                                  weight++;
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                    color: activeCardColor,
                  ),
                ),
              ],
            ),
          ),
          BottomButton(
            buttonTitle: 'CALCULATE',
            onTap: () {
              Calculation calc =
              Calculation(height: height, weight: weight);

              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ResultsPage(
                      bmiResult: calc.calculateBMI(),
                      resultText: calc.getResult(),
                      desc: calc.getInterpretation(),),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}