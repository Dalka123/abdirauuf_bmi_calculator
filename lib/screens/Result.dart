import 'package:bmi_calculator/widgets/custom_btn.dart';
import 'package:bmi_calculator/widgets/custom_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class Result extends StatelessWidget {
  final double result;
  Result({required this.result});

  String interpretation() {
    if(result >= 0 && result <= 18)
    return 'UNDERWEIGHT';
    else if (result >= 19 && result <= 25)
    return 'NORMAL';
    else if (result >= 26 && result <= 30)
    return 'OVERWIEGHT';
    else 
    return 'NORMAL';
  }

   String recommendation() {
    if(result >= 0 && result <= 18)
    return 'You\'re in the underweight range 😔';
    else if (result >= 19 && result <= 25)
    return 'You\'re in the healthy weight range 😊';
    else if (result >= 26 && result <= 30)
    return 'You\'re in the overweight range 😔';
    else 
    return 'You\'re in the obese range 😔';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
              child: Text(
                'YOUR RESULT',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.w500),
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
                        interpretation(),
                        style: TextStyle(fontSize: 35,fontWeight: FontWeight.w600,color: Color(0xff22B667)),
                      ),
                      const SizedBox(height: 30,),
                       Text(
                        result.round().toString(),
                        style: TextStyle(fontSize: 100,fontWeight: FontWeight.w600),
                      ),
                      const SizedBox(height: 30,),
                       Text(
                        recommendation(),
                        style: TextStyle(fontSize: 21,fontWeight: FontWeight.w600,color: Color(0xff33B5E7)),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          CustomButton(
            onPressed: () {
              Navigator.pop(context);
            },
            title: 'RECALCUALTE',
          )
        ],
      ),
    );
  }
}
