import 'package:flutter/material.dart';
import 'package:rive/rive.dart';
import 'package:rive_animation/Widgets/sizedBox.dart';



class AnimatedButton extends StatelessWidget {
  const AnimatedButton(
      {super.key, required this.buttonController, required this.press});

  final RiveAnimationController buttonController;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        buttonController.isActive = true;
      },
      child: SizedBox(
          height: 64,
          width: 260,
          child: Stack(
            children: [
              RiveAnimation.asset(
                "assets/RiveAssets/button.riv",
                controllers: [buttonController],
              ),
              Positioned.fill(
                top: 8,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.arrow_forward),
                    width8,
                    Text(
                      "Start the course",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              )
            ],
          )),
    );
  }
}
