import 'dart:math';

import 'package:bmi_caculator/caculator_brain.dart';
import 'package:bmi_caculator/components/round_icon_button.dart';
import 'package:bmi_caculator/screens/results_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:bmi_caculator/components/bottom_button.dart';
import 'package:bmi_caculator/constants.dart';
import 'package:bmi_caculator/components/icon_content.dart';
import 'package:bmi_caculator/components/reusable_card.dart';

enum GenderType {
  MALE,
  FEMALE,
}

class InputPage extends StatefulWidget {
  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  // final Color activeCardColor = Color(0xff1d1e33);
  Color maleCardColor = kInactiveCardColor;
  Color femaleCardColor = kInactiveCardColor;
  int height = 180;
  int weight = 80;
  int age = 40;

  // gender 1: male, 2: female
  void updateCardColor(GenderType gender) {
    setState(() {
      maleCardColor =
          gender == GenderType.MALE ? kActiveCardColor : kInactiveCardColor;
      femaleCardColor =
          gender == GenderType.FEMALE ? kActiveCardColor : kInactiveCardColor;
    });
  }

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
                ReusableCard(
                  onTap: () {
                    updateCardColor(GenderType.MALE);
                  },
                  colour: maleCardColor,
                  cardChild: IconContent(
                      iconData: FontAwesomeIcons.mars, label: 'MALE'),
                ),
                ReusableCard(
                  onTap: () {
                    updateCardColor(GenderType.FEMALE);
                  },
                  colour: femaleCardColor,
                  cardChild: GestureDetector(
                    onTap: () {
                      updateCardColor(GenderType.FEMALE);
                    },
                    child: IconContent(
                        iconData: FontAwesomeIcons.venus, label: 'FEMALE'),
                  ),
                ),
              ],
            ),
          ),
          ReusableCard(
            onTap: () {},
            colour: kActiveCardColor,
            cardChild: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'HEIGHT',
                  style: kLabelTextStyle,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: [
                    Text(
                      height.toString(),
                      style: kNumberTextStyle,
                    ),
                    Text(
                      'cm',
                      style: kLabelTextStyle,
                    ),
                  ],
                ),
                SliderTheme(
                  data: SliderTheme.of(context).copyWith(
                    inactiveTrackColor: Color(0xFF8D8E98),
                    activeTrackColor: Colors.white,
                    thumbColor: Color(0xFFEB1555),
                    overlayColor: Color(0x29EB1555),
                    thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15),
                    overlayShape: RoundSliderOverlayShape(overlayRadius: 30),
                  ),
                  child: Slider(
                      value: height.toDouble(),
                      min: 120,
                      max: 220,
                      activeColor: Color(0xffEB1555),
                      inactiveColor: Color(0xFF8D8E98),
                      onChanged: (double newValue) {
                        setState(() {
                          height = newValue.round();
                        });
                      }),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ReusableCard(
                  onTap: () {},
                  colour: kActiveCardColor,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('WEIGHT', style: kLabelTextStyle),
                      Text(weight.toString(), style: kNumberTextStyle),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          RoundIconButton(
                            onPressed: () {
                              setState(() {
                                weight -= 1;
                                weight = max(0, weight);
                              });
                            },
                            iconData: FontAwesomeIcons.minus,
                          ),
                          SizedBox(width: 10),
                          RoundIconButton(
                            onPressed: () {
                              setState(() {
                                weight += 1;
                                weight = min(200, weight);
                              });
                            },
                            iconData: FontAwesomeIcons.plus,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                ReusableCard(
                  onTap: () {},
                  colour: kActiveCardColor,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('AGE', style: kLabelTextStyle),
                      Text(age.toString(), style: kNumberTextStyle),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          RoundIconButton(
                            onPressed: () {
                              setState(() {
                                age -= 1;
                                age = max(0, age);
                              });
                            },
                            iconData: FontAwesomeIcons.minus,
                          ),
                          SizedBox(width: 10),
                          RoundIconButton(
                            onPressed: () {
                              setState(() {
                                age += 1;
                                age = min(130, age);
                              });
                            },
                            iconData: FontAwesomeIcons.plus,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          BottomButton(
            btnText: 'CACULATE',
            onTap: () {
              // Navigator.pushNamed(context, '/result');
              CaculatorBrain calc = CaculatorBrain(height: height, weight: weight);

              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ResultsPage(
                  bmiResult: calc.caculateBMI(),
                  resultText: calc.getResult(),
                  interpretation: calc.getInterpretation(),
                ))
              );
            },
          )
        ],
      ),
    );
  }
}
