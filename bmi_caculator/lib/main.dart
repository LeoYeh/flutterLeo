import 'screens/results_page.dart';
import 'package:flutter/material.dart';
import 'screens/input_page.dart';

void main() {
  runApp(const BMICaculator());
}

class BMICaculator extends StatelessWidget {
  const BMICaculator({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BMI CACULATOR',
      theme: ThemeData.dark().copyWith(
        appBarTheme: AppBarTheme(backgroundColor: Color(0xff0a0e21)),
        scaffoldBackgroundColor: Color(0xff0a0e21),
        iconTheme: IconThemeData(color: Color(0xff0a0e21)),
      ),
      // theme: ThemeData(
      //   primarySwatch: Colors.red,
      //   scaffoldBackgroundColor: Colors.white38,
      //   textTheme: TextTheme(
      //     bodyText1: TextStyle(color: Color(0xFF000000)),
      //   )
      // ),
      home: InputPage(),
      // routes: {
      //   '/': (context) => InputPage(),
      //   '/result': (context) => ResultPage(),
      // }
    );
  }
}
