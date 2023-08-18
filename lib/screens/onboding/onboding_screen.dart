import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

import '../../Widgets/sizedBox.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            width: MediaQuery.of(context).size.width *1.7,
            bottom: 200,
            left: 100,
            child: Image.asset("assets/Backgrounds/Spline.png")),
            Positioned.fill(child: BackdropFilter(filter: ImageFilter.blur(
            sigmaX: 20,
            sigmaY: 10
          ),child: SizedBox(),),),
        RiveAnimation.asset("assets/RiveAssets/shapes.riv",fit: BoxFit.cover,),

          Positioned.fill(child: BackdropFilter(filter: ImageFilter.blur(
            sigmaX: 50,
            sigmaY: 30
          ),child: SizedBox(),),),

          SafeArea(child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            child: Column(
              children: [
                SizedBox(
                  width: 260,
                  child: Column(
                    children: [
                      Text("Learn design & Code",style: TextStyle(
                        fontSize: 60,
                        fontFamily: "Poppins",
                        height: 1.2,
                      ),),
                      height16,
                      Text(
                                "Don’t skip design. Learn design and code, by building real apps with Flutter and Swift. Complete courses about the best tools.",
                              ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 64,
                  width: 260,
                  child: Stack(
                    children: [
                      RiveAnimation.asset("assets/RiveAssets/button.riv",),
                      Positioned.fill(
                        top: 8,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.arrow_forward),
                            width8,
                            Text("Start the course",style: TextStyle(
                              fontWeight: FontWeight.w600,
                            ),),
                          ],
                        ),
                      )
                    ],
                  )),

              ],
            ),
          ),),
        ],
      
    ),);
  }
}
