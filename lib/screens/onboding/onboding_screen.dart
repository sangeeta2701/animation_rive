import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

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

         
        ],
      
    ),);
  }
}
