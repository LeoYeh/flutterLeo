import 'package:bmi_caculator/components/reusable_card.dart';
import 'package:flutter/material.dart';
import 'package:bmi_caculator/components/bottom_button.dart';
import 'package:bmi_caculator/constants.dart';

class ResultsPage extends StatelessWidget {
  String resultText;
  String bmiResult;
  String interpretation;

  ResultsPage({
    required this.resultText,
    required this.bmiResult,
    required this.interpretation,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'BMI CALCULATOR',
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: EdgeInsets.all(15),
            alignment: Alignment.bottomLeft,
            child: Text(
              'Your Result',
              style: kTitleTextStyle,
            ),
          ),
          ReusableCard(
            onTap: () {},
            colour: kActiveCardColor,
            cardChild: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  resultText.toUpperCase(),
                  style: kResultTextStyle,
                ),
                Text(
                  bmiResult,
                  style: kBMITextStyle,
                ),
                Text(
                  interpretation,
                  textAlign: TextAlign.center,
                  style: kBodyTextStyle,
                ),
              ],
            ),
          ),
          BottomButton(
            btnText: 'RE-CACULATE',
            onTap: () {
              Navigator.pushNamed(context, '/');
            },
          )
        ],
      ),
    );
  }
}
