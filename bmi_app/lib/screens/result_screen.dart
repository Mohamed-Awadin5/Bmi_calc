import 'package:flutter/material.dart';

import '../core/app_colors.dart';

class ResultScreen extends StatelessWidget {
  final int weight;
  final double height;
  final bool isMale;
  final int age;
  const ResultScreen(
      {super.key,
      required this.weight,
      required this.height,
      required this.isMale,
      required this.age});

  double ConvertHeightToMeter() {
    return height / 100;
  }

  double CalcBmi() {
    return weight / (height * height);
  }

  String range() {
    if (CalcBmi() <= 18.5) {
      return 'Underweight';
    } else if (CalcBmi() > 18.5 && CalcBmi() <= 25) {
      return 'Normal';
    } else if (CalcBmi() > 25 && CalcBmi() <= 30) {
      return 'Overweight';
    } else {
      return 'Obese';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.mainColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 22, horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'your result ',
              style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 40,
                  color: Colors.white),
            ),
            SizedBox(height: 20),
            Container(
              padding:
                  EdgeInsets.only(left: 35, right: 33, top: 70, bottom: 150),
              width: double.infinity,
              decoration: BoxDecoration(
                  color: AppColors.secondaryColor,
                  borderRadius: BorderRadius.circular(12)),
              child: Column(
                children: [
                  Text('${range()}',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                          color: Colors.green)),
                  SizedBox(height: 33),
                  Text('${CalcBmi().toStringAsFixed(3)}',
                      style: TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.w700,
                          color: Colors.white)),
                  SizedBox(
                    height: 60,
                  ),
                  Text('You Have a Normal Body Weight,Good Job.',
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: AppColors.textGrayColor)),
                  SizedBox(height: 33),
                  Text('gender:${isMale ? 'Male' : 'Female'} ',
                      style: TextStyle(
                          fontWeight: FontWeight.w700, color: Colors.white)),
                  SizedBox(
                    height: 33,
                  ),
                  Text('age:$age',
                      style: TextStyle(
                          fontWeight: FontWeight.w700, color: Colors.white))
                ],
              ),
            )
          ],
        ),
      ),
      appBar: AppBar(
        elevation: 10,
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: AppColors.secondaryColor,
        centerTitle: true,
        leading: Center(
          child: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Text(
              "home",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
        title: Text(
          "BMI Calculator",
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.w600, color: Colors.white),
        ),
      ),
    );
  }
}

@override
Widget build(BuildContext context) {
  // TODO: implement build
  throw UnimplementedError();
}
