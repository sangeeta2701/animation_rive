import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

import '../../Widgets/sizedBox.dart';
import 'Components/custom_SignIn_Dialog.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  late RiveAnimationController buttonController;
  bool isSignInDialogShown = false;

  @override
  void initState() {
    buttonController = OneShotAnimation("active", autoplay: false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        clipBehavior: Clip.none,
        children: [
          // Positioned(
          //     width: MediaQuery.of(context).size.width * 1.7,
          //     bottom: 200,
          //     left: 100,
          //     child: Image.asset("assets/Backgrounds/Spline.png")),
          Positioned.fill(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 20, sigmaY: 10),
              child: SizedBox(),
            ),
          ),
          RiveAnimation.asset(
            "assets/RiveAssets/shapes.riv",
            fit: BoxFit.cover,
          ),
          Positioned.fill(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 50, sigmaY: 30),
              child: SizedBox(),
            ),
          ),
          AnimatedPositioned(
            top: isSignInDialogShown ? -50 : 0,
            duration: Duration(milliseconds: 240),
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Spacer(),
                    SizedBox(
                      width: 260,
                      child: Column(
                        children: [
                          Text(
                            "Fit At Home",
                            style: TextStyle(
                              fontSize: 60,
                              fontFamily: "Poppins",
                              height: 1.2,
                            ),
                          ),
                          height16,
                          Text(
                            "Lose weight and get fit AT HOME with Female Fitness App! NO EQUIPMENT needed and suitable for BOTH BEGINNER AND PRO. Sweat a few minutes a day to get your dream body in weeks! 💪 💪 💪",
                          ),
                        ],
                      ),
                    ),
                    Spacer(
                      flex: 2,
                    ),

                    SizedBox(
                      height: 54,
                      width: 260,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10),
                                topRight: Radius.circular(25),
                                bottomLeft: Radius.circular(25),
                                bottomRight: Radius.circular(25),
                              ),
                            ),
                            backgroundColor: Colors.white),
                        onPressed: () {
                          setState(() {
                            isSignInDialogShown = true;
                          });
                          customSignInDialog(context, onClosed: (_) {
                            setState(() {
                              isSignInDialogShown = false;
                            });
                          });
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.arrow_forward,
                              color: Colors.black,
                            ),
                            width8,
                            Text(
                              "Start Your Journey",
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black),
                            ),
                          ],
                        ),
                      ),
                    ),
                    // height4,
                    // AnimatedButton(
                    //   buttonController: buttonController,
                    //   press: () {
                    //     buttonController.isActive = true;
                    //     //show dialog after button animation
                    //     Future.delayed(Duration(milliseconds: 800), () {
                    //       customSignInDialog(context);
                    //     });
                    //   },
                    // ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 24),
                      child: Text(
                          "Purchase includes access to 30+ courses, 240+ premium tutorials, 120+ hours of videos, source files and certificates."),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  
}
