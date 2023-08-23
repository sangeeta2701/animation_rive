import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rive/rive.dart';

import '../../Widgets/sizedBox.dart';
import 'Components/signIn_form.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  late RiveAnimationController buttonController;

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
          Positioned(
              width: MediaQuery.of(context).size.width * 1.7,
              bottom: 200,
              left: 100,
              child: Image.asset("assets/Backgrounds/Spline.png")),
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
          SafeArea(
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
                          "Learn design & Code",
                          style: TextStyle(
                            fontSize: 60,
                            fontFamily: "Poppins",
                            height: 1.2,
                          ),
                        ),
                        height16,
                        Text(
                          "Don’t skip design. Learn design and code, by building real apps with Flutter and Swift. Complete courses about the best tools.",
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
                        customSignInDialog(context);
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
                            "Start the course",
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
        ],
      ),
    );
  }

  Future<Object?> customSignInDialog(BuildContext context) {
    return showGeneralDialog(
        barrierDismissible: true,
        barrierLabel: "Sign In",
        context: context,
        //Slide animation for dialog
        transitionBuilder: (context, animation, secondaryAnimation, child) {
          Tween<Offset> tween;
          tween = Tween(begin: Offset(-1, 0), end: Offset.zero);
          return SlideTransition(
              position: tween.animate(
                  CurvedAnimation(parent: animation, curve: Curves.easeInOut),),
                  child: child,);
        },
        pageBuilder: (context, _, __) {
          return Center(
            child: Container(
              height: 620,
              margin: EdgeInsets.symmetric(horizontal: 16),
              padding: EdgeInsets.symmetric(vertical: 32, horizontal: 24),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.94),
                borderRadius: BorderRadius.circular(40),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.3),
                    offset: const Offset(0, 30),
                    blurRadius: 60,
                  ),
                ],
              ),
              child: Scaffold(
                backgroundColor: Colors.transparent,
                body: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Column(
                      children: [
                        Text(
                          "Sign in",
                          style: TextStyle(
                            fontSize: 34,
                            fontFamily: "Poppins",
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(vertical: 16),
                          child: Text(
                            "Access to 240+ hours of content. Learn design and code, by building real apps with Flutter and Swift.",
                            textAlign: TextAlign.center,
                          ),
                        ),
                        SignInForm(),
                        Row(
                          children: [
                            Expanded(child: Divider()),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16),
                              child: Text(
                                "OR",
                                style: TextStyle(
                                  color: Colors.black26,
                                ),
                              ),
                            ),
                            Expanded(child: Divider()),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 20),
                          child: Text(
                            "Sign up with Email,Apple or Google",
                            style: TextStyle(
                              color: Colors.black54,
                            ),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            IconButton(
                                padding: EdgeInsets.zero,
                                onPressed: () {},
                                icon: SvgPicture.asset(
                                  "assets/icons/email_box.svg",
                                  height: 60,
                                  width: 60,
                                )),
                            IconButton(
                                padding: EdgeInsets.zero,
                                onPressed: () {},
                                icon: SvgPicture.asset(
                                  "assets/icons/apple_box.svg",
                                  height: 60,
                                  width: 60,
                                )),
                            IconButton(
                                padding: EdgeInsets.zero,
                                onPressed: () {},
                                icon: SvgPicture.asset(
                                  "assets/icons/google_box.svg",
                                  height: 60,
                                  width: 60,
                                ))
                          ],
                        )
                      ],
                    ),
                    Positioned(
                      left: 0,
                      right: 0,
                      bottom: -48,
                      child: CircleAvatar(
                        radius: 16,
                        backgroundColor: Colors.white,
                        child: Icon(Icons.close),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
