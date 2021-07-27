import 'package:flutter/material.dart';

import 'screens/HomeScreen.dart';

void main() => runApp(BmiCalcualtor());
class BmiCalcualtor extends StatelessWidget {
  const BmiCalcualtor({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        primaryColor: Color(0xff0A0E21),
        scaffoldBackgroundColor: Color(0xff0A0E21)
      ),
      home: HomeScreen(),
      );
  }
}