// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:peso_mate_getx/app/data/db_helper/db_helper.dart';

import 'package:peso_mate_getx/app/data/widgets/colors.dart';

import 'dart:async';

import 'package:animated_text_kit/animated_text_kit.dart';

class ScreenSplashView extends StatefulWidget {
  const ScreenSplashView({Key? key}) : super(key: key);

  @override
  _ScreenSplashViewState createState() => _ScreenSplashViewState();
}

class _ScreenSplashViewState extends State<ScreenSplashView> {
  @override
  void initState() {
    super.initState();
    

    Timer(const Duration(milliseconds: 400), () {
      setState(() {
        _a = true;
      });
    });
    Timer(const Duration(milliseconds: 400), () {
      setState(() {
        _b = true;
      });
    });
    Timer(const Duration(milliseconds: 1300), () {
      setState(() {
        _c = true;
      });
    });
    Timer(const Duration(milliseconds: 1700), () {
      setState(() {
        _e = true;
      });
    });
    Timer(const Duration(milliseconds: 3400), () {
      setState(() {
        _d = true;
      });
    });
    Timer(const Duration(milliseconds: 3650), () {
      setState(() { 
        checkLogin();
      });
    });

    
  }
  

  bool _a = false;
  bool _b = false;
  bool _c = false;
  bool _d = false;
  bool _e = false;

  @override
  void dispose() {
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: scfldWhite,
      body: Center(
        child: Column(
          children: [
            AnimatedContainer(
              duration: Duration(milliseconds: _d ? 900 : 2500),
              curve: _d ? Curves.fastLinearToSlowEaseIn : Curves.elasticOut,
              height: _d
                  ? 0
                  : _a
                      ? h / 2
                      : 20,
              width: 20,
              // color: Colors.deepPurpleAccent,
            ),
            AnimatedContainer(
              duration: Duration(
                  seconds: _d
                      ? 1
                      : _c
                          ? 2
                          : 0),
              curve: Curves.fastLinearToSlowEaseIn,
              height: _d
                  ? h
                  : _c
                      ? 80
                      : 20,
              width: _d
                  ? w
                  : _c
                      ? 200
                      : 20,
              decoration: BoxDecoration(
                  color: _b ? amber : Colors.transparent,
                  borderRadius: _d
                      ? const BorderRadius.only()
                      : BorderRadius.circular(30)),
              child: Center(
                child: _e
                    ? AnimatedTextKit(
                        totalRepeatCount: 1,
                        animatedTexts: [
                          FadeAnimatedText(
                            'Peso Mate',
                            duration: const Duration(milliseconds: 1700),
                            textStyle: const TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.w700,
                                fontFamily: "Swera"),
                          ),
                        ],
                      )
                    : const SizedBox(),
              ),
            ),
          ],
        ),
      ),
    );
  }


  Future <void> checkLogin()async{
    final loggedName =getBox.read("username");
        if (loggedName == null) {
      gotoLogin();
    } else {
      await Future.delayed(const Duration(seconds: 1));
     Get.offNamed("/home");
    }
  }
  Future<void> gotoLogin() async {
    await Future.delayed(const Duration(seconds: 1));
    Get.offNamed("/screen-login");
  }
}
