import 'dart:math';

import 'package:bmi_calculator/screens/Result.dart';
import 'package:bmi_calculator/widgets/constants.dart';
import 'package:bmi_calculator/widgets/custom_btn.dart';
import 'package:bmi_calculator/widgets/widgets.dart';
import 'package:flutter/material.dart';

enum Gender { male, female }

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  double height = 180;
  int weight = 60;
  int age = 20;
  Gender selectedGender = Gender.male;
   void goToResult() {
     double _reuslt = weight / (pow(height/100, 2));
     Navigator.push(context, MaterialPageRoute(builder: (context) => Result(result: _reuslt,)));
   }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: CustomCard(
                    selected: selectedGender == Gender.male ? true : false,
                    onPressed: () {
                      setState(() {
                        selectedGender = Gender.male;
                      });
                    },
                    child: IconTitle(
                      iconData: Icons.male,
                      title: 'MALE',
                    ),
                  ),
                ),
                Expanded(
                  child: CustomCard(
                    selected: selectedGender == Gender.female ? true : false,
                    onPressed: () {
                      setState(() {
                        selectedGender = Gender.female;
                      });
                    },
                    child: IconTitle(
                      iconData: Icons.female,
                      title: 'FEMALE',
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: CustomCard(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      Text(
                        'HEIGHT',
                        style: TextStyle(fontSize: 20, color: Colors.grey),
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            height.round().toString(),
                            style: TextStyle(
                                fontSize: 50, fontWeight: FontWeight.w500),
                          ),
                          Text('cm', style: TextStyle(color: Colors.grey)),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      SliderTheme(
                        data: SliderThemeData(
                          activeTrackColor: Colors.white,
                          inactiveTrackColor: Colors.grey,
                          thumbColor: kBottomContainerColour,
                          thumbShape: RoundSliderThumbShape(
                            enabledThumbRadius: 16,
                          ),
                        ),
                        child: Slider(
                          value: height,
                          min: 10,
                          max: 300,
                          onChanged: (newVal) {
                            setState(() {
                              height = newVal;
                            });
                          },
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: CustomCard(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          children: [
                            Text(
                              'WIEGHT',
                              style:
                                  TextStyle(fontSize: 20, color: Colors.grey),
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.baseline,
                              textBaseline: TextBaseline.alphabetic,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  weight.toString(),
                                  style: TextStyle(
                                      fontSize: 50,
                                      fontWeight: FontWeight.w500),
                                ),
                                Text('kg',
                                    style: TextStyle(color: Colors.grey)),
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                RoundButton(
                                  iconData: Icons.remove,
                                  onPressed: () {
                                    setState(() {
                                      if (weight > 0) {
                                        weight--;
                                      }
                                    });
                                  },
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                RoundButton(
                                  iconData: Icons.add,
                                  onPressed: () {
                                    setState(() {
                                      if (weight < 300) weight++;
                                    });
                                  },
                                ),
                              ],
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: CustomCard(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          children: [
                            Text(
                              'AGE',
                              style:
                                  TextStyle(fontSize: 20, color: Colors.grey),
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.baseline,
                              textBaseline: TextBaseline.alphabetic,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  age.toString(),
                                  style: TextStyle(
                                      fontSize: 50,
                                      fontWeight: FontWeight.w500),
                                ),
                                Text('yrs',
                                    style: TextStyle(color: Colors.grey)),
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                RoundButton(
                                  iconData: Icons.remove,
                                  onPressed: () {
                                    setState(() {
                                      if (age > 0) age--;
                                    });
                                  },
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                RoundButton(
                                  iconData: Icons.add,
                                  onPressed: () {
                                    setState(() {
                                      if (age <= 120) age++;
                                    });
                                  },
                                ),
                              ],
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          CustomButton(
              onPressed: () => goToResult(),
              title: 'CALCULATE')
        ],
      ),
    );
  }
}
