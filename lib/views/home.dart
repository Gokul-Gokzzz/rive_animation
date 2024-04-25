import 'dart:ui';

import 'package:animation/widgets/btn.dart';
import 'package:animation/widgets/custom_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

import 'package:rive/rive.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isSigninDialog = false;
  late RiveAnimationController btnAnimationController;
  @override
  void initState() {
    btnAnimationController = OneShotAnimation(
      "active",
      autoplay: false,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            width: MediaQuery.of(context).size.width * 1.7,
            bottom: 200,
            left: 100,
            child: Image.asset('assets/Backgrounds/Spline.png'),
          ),
          Positioned.fill(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 20, sigmaY: 10),
              child: const SizedBox(),
            ),
          ),
          const RiveAnimation.asset('assets/RiveAssets/shapes.riv'),
          Positioned.fill(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 30, sigmaY: 30),
              child: const SizedBox(),
            ),
          ),
          AnimatedPositioned(
            top: isSigninDialog ? -50 : 0,
            duration: Duration(milliseconds: 240),
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Spacer(),
                    const SizedBox(
                      width: 260,
                      child: Column(
                        children: [
                          Text(
                            'Learn design & code',
                            style: TextStyle(
                                fontSize: 60,
                                fontFamily: "Poppins",
                                height: 1.2),
                          ),
                          SizedBox(
                            height: 16,
                          ),
                          Text(
                              "Don't skip the design.Learn design and code , by building real apps with flutter and swift . Complete course about the best tool "),
                        ],
                      ),
                    ),
                    const Spacer(
                      flex: 2,
                    ),
                    BtnAnimation(
                      btnAnimationController: btnAnimationController,
                      press: () {
                        btnAnimationController.isActive = true;
                        Future.delayed(
                          Duration(milliseconds: 800),
                          () {
                            setState(() {
                              isSigninDialog = true;
                            });
                            customSinginDialog(context, onClosed: (_) {
                              setState(() {
                                isSigninDialog = false;
                              });
                            });
                          },
                        );
                      },
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 24),
                      child: Text(
                        "Purchase includes acess to 30+ courses, 240+ premium tutorials, 120+ hours of videos, source files and certificate.",
                      ),
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
