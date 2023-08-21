import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rive/rive.dart';

import '../../Widgets/sizedBox.dart';

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
                          borderRadius: BorderRadius.circular(8),
                        ),
                        backgroundColor: Colors.white
                      ),
                      onPressed: (){
                         showGeneralDialog(
                          barrierDismissible: true,
                          barrierLabel: "Sign In",
                            context: context,
                            pageBuilder:
                                (context, _, __) {
                              return Center(
                                child: Container(
                                  height: 620,
                                  margin: EdgeInsets.symmetric(horizontal: 16),
                                  padding: EdgeInsets.symmetric(vertical: 32,horizontal: 24),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
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
                                    body: Column(
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
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            });
                      },child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.arrow_forward,color: Colors.black,),
                      width8,
                      Text(
                        "Start the course",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: Colors.black
                        ),
                      ),
                    ],
                                  ),),
                  ),
                // height4,
                //   AnimatedButton(
                //     buttonController: buttonController,
                //     press: () {
                //       buttonController.isActive = true;
                     
                //     },
                //   ),
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
}

class SignInForm extends StatelessWidget {
  const SignInForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Form(child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
      Text("Email",style: TextStyle(
        color: Colors.black54
      ),),
      Padding(
        padding: const EdgeInsets.only(top:8.0,bottom: 16),
        child: TextFormField(
          decoration: InputDecoration(
            prefixIcon: Padding(
              padding:  EdgeInsets.symmetric(horizontal: 8),
              child: SvgPicture.asset("assets/icons/email.svg"),
            )
          ),
        ),
      ),
      Text("Password",style: TextStyle(
        color: Colors.black54
      ),),
      Padding(
        padding: const EdgeInsets.only(top:8.0,bottom: 16),
        child: TextFormField(
          decoration: InputDecoration(
            prefixIcon: Padding(
              padding:  EdgeInsets.symmetric(horizontal: 8),
              child: SvgPicture.asset("assets/icons/password.svg"),
            )
          ),
        ),
      ),
    ],),);
  }
}
