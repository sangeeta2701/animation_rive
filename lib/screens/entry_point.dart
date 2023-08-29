import 'package:flutter/material.dart';
import 'package:rive/rive.dart';
import 'package:rive_animation/constants.dart';
import 'package:rive_animation/utils/riveUtils.dart';

class EnteryPoint extends StatefulWidget {
  const EnteryPoint({super.key});

  @override
  State<EnteryPoint> createState() => _EnteryPointState();
}

class _EnteryPointState extends State<EnteryPoint> {
  late SMIBool searchTrigger;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: SafeArea(
        child: Container(
          padding: EdgeInsets.all(12),
          margin: EdgeInsets.symmetric(horizontal: 24),
          decoration: BoxDecoration(
              color: backgroundColor2.withOpacity(0.8),
              borderRadius: BorderRadius.circular(20)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ...List.generate(
                bottomNavs.length,
                (index) => GestureDetector(
                  onTap: () {
                    bottomNavs[index].input!.change(true);
                  },
                  child: SizedBox(
                      height: 36,
                      width: 36,
                      child: RiveAnimation.asset(
                        bottomNavs.first.src,
                        // "assets/RiveAssets/icons.riv",
                        artboard: bottomNavs[index].artboard,
                        onInit: (artboard) {
                          StateMachineController controller =
                              RiveUtils.getRiveController(artboard,
                                  stateMachineName:
                                      bottomNavs[index].stateMachineName);
                          bottomNavs[index].input =
                              controller.findSMI("active") as SMIBool;
                        },
                      )),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class RiveAsset {
  final String artboard, stateMachineName, title, src;
  late SMIBool? input;

  RiveAsset(
      {required this.artboard,
      required this.stateMachineName,
      required this.title,
      this.input,
      required this.src});
  set setInput(SMIBool status) {
    input = status;
  }
}

List<RiveAsset> bottomNavs = [
  RiveAsset(
      artboard: "CHAT",
      stateMachineName: "CHAT_Interactivity",
      title: "Chat",
      src: "assets/RiveAssets/icons.riv"),
  RiveAsset(
      artboard: "SEARCH",
      stateMachineName: "SEARCH_Interactivity",
      title: "Search",
      src: "assets/RiveAssets/icons.riv"),
  RiveAsset(
      artboard: "TIMER",
      stateMachineName: "TIMER_Interactivity",
      title: "Chat",
      src: "assets/RiveAssets/icons.riv"),
  RiveAsset(
      artboard: "BELL",
      stateMachineName: "BELL_Interactivity",
      title: "Notification",
      src: "assets/RiveAssets/icons.riv"),
  RiveAsset(
      artboard: "USER",
      stateMachineName: "USER_Interactivity",
      title: "Profile",
      src: "assets/RiveAssets/icons.riv")
];
