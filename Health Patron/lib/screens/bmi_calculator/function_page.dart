import 'package:flash_chat/constants.dart';
import 'package:flash_chat/widgets/bottom_button.dart';
import 'package:flash_chat/widgets/icon_content.dart';
import 'package:flash_chat/widgets/reusable_container.dart';
import 'package:flash_chat/widgets/round_icon.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'calculator_brain.dart';
import 'results_page.dart';

enum Gender {
  male,
  female,
  others,
}

class FunctionPage extends StatefulWidget {
  static String id = "function_page";
  @override
  _FunctionPageState createState() => _FunctionPageState();
}

class _FunctionPageState extends State<FunctionPage> {
  int height = 120;
  int age = 18;
  int weight = 60;
  Gender selectedGender;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kInactiveColor,
      appBar: AppBar(
        backgroundColor: kInactiveColor,
        title: Text(
          'BMI Calculator',
        ),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedGender = Gender.female;
                      });
                    },
                    child: ReusableContainer(
                      chooseColor: selectedGender == Gender.female
                          ? kActiveColor
                          : kInactiveColor,
                      childWidget: IconContent(
                        icon: FontAwesomeIcons.venus,
                        labelText: 'FEMALE',
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedGender = Gender.male;
                      });
                    },
                    child: ReusableContainer(
                      chooseColor: selectedGender == Gender.male
                          ? kActiveColor
                          : kInactiveColor,
                      childWidget: IconContent(
                        icon: FontAwesomeIcons.mars,
                        labelText: 'MALE',
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedGender = Gender.others;
                      });
                    },
                    child: ReusableContainer(
                      chooseColor: selectedGender == Gender.others
                          ? kActiveColor
                          : kInactiveColor,
                      childWidget: IconContent(
                        icon: FontAwesomeIcons.genderless,
                        labelText: 'OTHERS',
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: ReusableContainer(
              childWidget: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    height: 10.0,
                  ),
                  Text(
                    'HEIGHT',
                    style: kLabelTextStyle,
                  ),
                  SizedBox(
                    height: 5.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: <Widget>[
                      Text(
                        height.toString(),
                        style: kFontStyleBody,
                      ),
                      Text(
                        'cm',
                        style: TextStyle(color: Colors.white70),
                      )
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      activeTrackColor: kBottomContainerColor,
                      inactiveTrackColor: Colors.grey,
                      thumbColor: kBottomContainerColor,
                      overlayColor: Color(0x29EB1555),
                      thumbShape:
                          RoundSliderThumbShape(enabledThumbRadius: 15.0),
                      overlayShape: RoundSliderOverlayShape(overlayRadius: 35),
                    ),
                    child: Slider(
                      value: height.toDouble(),
                      min: 0,
                      max: 250,
                      onChanged: (double newValue) {
                        setState(() {
                          height = newValue.round();
                        });
                      },
                    ),
                  )
                ],
              ),
              chooseColor: kActiveColor,
            ),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableContainer(
                    chooseColor: kActiveColor,
                    childWidget: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'WEIGHT',
                          style: kLabelTextStyle,
                        ),
                        Text(
                          weight.toString(),
                          style: kFontStyleBody,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RoundIconButton(
                              chooseIcon: FontAwesomeIcons.minus,
                              pressMe: () {
                                setState(
                                  () {
                                    weight--;
                                  },
                                );
                              },
                            ),
                            RoundIconButton(
                              chooseIcon: FontAwesomeIcons.plus,
                              pressMe: () {
                                setState(
                                  () {
                                    weight++;
                                  },
                                );
                              },
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableContainer(
                    chooseColor: kActiveColor,
                    childWidget: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'AGE',
                          style: kLabelTextStyle,
                        ),
                        Text(
                          age.toString(),
                          style: kFontStyleBody,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RoundIconButton(
                              chooseIcon: FontAwesomeIcons.minus,
                              pressMe: () {
                                setState(() {
                                  age--;
                                });
                              },
                            ),
                            RoundIconButton(
                              chooseIcon: FontAwesomeIcons.plus,
                              pressMe: () {
                                setState(
                                  () {
                                    setState(() {
                                      age++;
                                    });
                                  },
                                );
                              },
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          BottomButton(
            onTap: () {
              CalculatorBrian calc =
                  CalculatorBrian(height: height, weight: weight);

              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ResultsPage(
                    bmiResult: calc.calculateBMI(),
                    resultText: calc.getResult(),
                    interpretation: calc.getInterpretation(),
                  ),
                ),
              );
            },
            buttonText: 'Calculate',
          ),
        ],
      ),
    );
  }
}
