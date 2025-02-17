import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
import 'package:test_app/core/app_colors.dart';
import 'package:test_app/core/widgets/gender_container.dart';
import 'package:test_app/screens/result_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  double sliderValue = 150;
  int weight = 1;
  int age = 10;
  bool? isMale;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.mainColor,
      appBar: AppBar(
        elevation: 10,
        backgroundColor: AppColors.secondaryColor,
        centerTitle: true,
        title: Text(
          "BMI Calculator",
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.w600, color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 26),
        child: Column(
          children: [
            Row(
              children: [
                GenderContainer(
                  onTap: () {
                    if (isMale == false || isMale == null) {
                      setState(() {
                        isMale = true;
                      });
                    }
                  },
                  title: "Male",
                  icon: "assets/icons/male.svg",
                  isActive: isMale ?? false,
                ),
                SizedBox(
                  width: 10,
                ),
                GenderContainer(
                  title: "Female",
                  icon: "assets/icons/female.svg",
                  isActive: !(isMale ?? true),
                  onTap: () {
                    if (isMale ?? true) {
                      setState(() {
                        isMale = false;
                      });
                    }
                  },
                ),
              ],
            ),
            SizedBox(
              height: 25,
            ),
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(vertical: 27, horizontal: 20),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: AppColors.mainLightColor),
              child: Column(
                children: [
                  Text(
                    "Height",
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                  Text.rich(TextSpan(children: [
                    TextSpan(
                        text: "${sliderValue.toInt()}",
                        style: TextStyle(
                            fontSize: 40,
                            fontWeight: FontWeight.w900,
                            color: Colors.white)),
                    TextSpan(
                        text: "cm",
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                            color: Colors.white))
                  ])),
                  Slider(
                    min: 0,
                    max: 200,
                    value: sliderValue,
                    onChanged: (value) {
                      setState(() {
                        sliderValue = value;
                      });
                    },
                    activeColor: Color.fromARGB(255, 228, 23, 74),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 25,
            ),

            /// ToDo: custom this widget
            Row(
              children: [
                Expanded(
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 24),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: AppColors.secondaryColor),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Weight",
                          style: TextStyle(
                              fontSize: 20, color: AppColors.textGrayColor),
                        ),
                        Text(
                          "$weight",
                          style: TextStyle(
                              fontSize: 40,
                              fontWeight: FontWeight.w700,
                              color: Colors.white),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            FloatingActionButton.small(
                              heroTag: null,
                              onPressed: () {
                                if (weight > 1) {
                                  setState(() {
                                    weight--;
                                  });
                                }
                              },
                              shape: CircleBorder(),
                              backgroundColor: Colors.grey,
                              child: Icon(
                                Icons.remove,
                                color: Colors.white,
                              ),
                            ),
                            FloatingActionButton.small(
                              heroTag: null,
                              onPressed: () {
                                setState(() {
                                  weight++;
                                });
                              },
                              shape: CircleBorder(),
                              backgroundColor: Colors.grey,
                              child: Icon(
                                Icons.add,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 24),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: AppColors.secondaryColor),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Age",
                          style: TextStyle(
                              fontSize: 20, color: AppColors.textGrayColor),
                        ),
                        Text(
                          "$age",
                          style: TextStyle(
                              fontSize: 40,
                              fontWeight: FontWeight.w700,
                              color: Colors.white),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            FloatingActionButton.small(
                              heroTag: null,
                              onPressed: () {
                                if (age > 0) {
                                  setState(() {
                                    age--;
                                  });
                                }
                              },
                              shape: CircleBorder(),
                              backgroundColor: Colors.grey,
                              child: Icon(
                                Icons.remove,
                                color: Colors.white,
                              ),
                            ),
                            FloatingActionButton.small(
                              heroTag: null,
                              onPressed: () {
                                if (age < 100) {
                                  setState(() {
                                    age++;
                                  });
                                }
                              },
                              shape: CircleBorder(),
                              backgroundColor: Colors.grey,
                              child: Icon(
                                Icons.add,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) => ResultScreen(
                                weight: weight,
                                height: sliderValue,
                                age: age,
                                isMale: isMale ?? false,
                              )));
                },
                child: Text("Calculate")),
          ],
        ),
      ),
    );
  }
}
