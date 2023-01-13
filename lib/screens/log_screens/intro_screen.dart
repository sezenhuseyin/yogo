import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:yogoli/core/init/extension/string_extension.dart';
import 'package:yogoli/core/init/locale_keys.g.dart';
import 'package:yogoli/screens/consts.dart';
import 'package:yogoli/screens/log_screens/login_register_screen.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:yogoli/widgets/translate.dart';

class IntroductionScreen extends StatefulWidget {
  const IntroductionScreen({super.key});

  @override
  State<IntroductionScreen> createState() => _IntroductionScreenState();
}

class _IntroductionScreenState extends State<IntroductionScreen> {
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    controller.dispose();
  }

  final controller = PageController();
  bool isLast = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: SafeArea(
        child: Stack(
          children: [
            Positioned.fill(
              child: Image.asset(
                "assets/background.png",
                fit: BoxFit.fill,
              ),
            ),
            PageView(
              onPageChanged: (value) {
                setState(() {
                  isLast = value == 2;
                });
              },
              controller: controller,
              children: [
                _firstPage(),
                _secondPage(),
                _thirdPage(),
              ],
            ),
            isLast
                ? Padding(
                    padding: EdgeInsets.only(bottom: 20),
                    child: Align(
                        alignment: Alignment.bottomCenter,
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 25),
                          child: CupertinoButton(
                              color: blue,
                              onPressed: () {
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => LogRegister()));
                              },
                              child: Center(
                                heightFactor: 1.75,
                                child: Text(
                                  LocaleKeys.introduction_last_button.locale,
                                  style: TextStyle(
                                      fontFamily: "bold", color: white),
                                ),
                              )),
                        )),
                  )
                : Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TranslateButton(),
                          TextButton(
                            onPressed: () {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => LogRegister()));
                            },
                            child: Text(
                              LocaleKeys.introduction_skip_button.locale,
                              style:
                                  TextStyle(fontFamily: "bold", color: purple),
                            ),
                          ),
                        ],
                      ),
                      Spacer(),
                      Container(
                          decoration: BoxDecoration(
                              color: white,
                              borderRadius: BorderRadius.circular(36)),
                          padding:
                              EdgeInsets.symmetric(horizontal: 20, vertical: 7),
                          margin: EdgeInsets.only(bottom: 20),
                          child: SmoothPageIndicator(
                              onDotClicked: (index) {
                                setState(() {
                                  controller.animateToPage(index,
                                      duration: Duration(milliseconds: 400),
                                      curve: Curves.linear);
                                });
                              },
                              effect:
                                  WormEffect(activeDotColor: blue, spacing: 16),
                              controller: controller,
                              count: 3)),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 25),
                        child: CupertinoButton(
                            color: blue,
                            child: Center(
                              child: Text(
                                  LocaleKeys.introduction_next_button.locale),
                              heightFactor: 1.5,
                            ),
                            onPressed: () {
                              controller.nextPage(
                                  duration: Duration(milliseconds: 500),
                                  curve: Curves.linear);
                            }),
                      ),
                      SizedBox(
                        height: 20,
                      )
                    ],
                  ),
          ],
        ),
      ),
    );
  }

  Widget _firstPage() {
    return Column(
      children: [
        const Spacer(
          flex: 2,
        ),
        SizedBox(height: 300, child: Image.asset("assets/justLogo.png")),
        const Spacer(),
        Expanded(
          flex: 5,
          child: Container(
            padding: EdgeInsets.only(top: 20, right: 10, left: 10),
            decoration: BoxDecoration(
                color: purple.withOpacity(.9),
                borderRadius: BorderRadius.vertical(top: Radius.circular(36))),
            child: Column(
              children: [
                const SizedBox(
                  height: 10,
                ),
                Center(
                  child: Text(
                    LocaleKeys.introduction_first_title.locale,
                    style: TextStyle(
                        fontFamily: "bold", color: white, fontSize: 36),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  LocaleKeys.introduction_first_subtitle.locale,
                  style: TextStyle(
                      fontFamily: "normal", color: white, fontSize: 22),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _secondPage() {
    return Column(
      children: [
        const Spacer(
          flex: 2,
        ),
        SizedBox(height: 300, child: Image.asset("assets/justLogo.png")),
        const Spacer(),
        Expanded(
          flex: 5,
          child: Container(
            padding: EdgeInsets.only(top: 20, right: 10, left: 10),
            decoration: BoxDecoration(
                color: orange,
                borderRadius: BorderRadius.vertical(top: Radius.circular(36))),
            child: Column(
              children: [
                const SizedBox(
                  height: 10,
                ),
                Text(
                  LocaleKeys.introduction_second_title.locale,
                  style:
                      TextStyle(fontFamily: "bold", color: white, fontSize: 36),
                ),
                const SizedBox(
                  height: 20,
                ),
                Center(
                  child: Text(
                    LocaleKeys.introduction_second_subtitle.locale,
                    style: TextStyle(
                        fontFamily: "normal", color: white, fontSize: 22),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }

  Widget _thirdPage() {
    return Column(
      children: [
        const SizedBox(
          height: 10,
        ),
        const Spacer(
          flex: 2,
        ),
        SizedBox(height: 300, child: Image.asset("assets/justLogo.png")),
        const Spacer(),
        Expanded(
          flex: 5,
          child: Container(
            padding: EdgeInsets.only(top: 20, right: 10, left: 10),
            decoration: BoxDecoration(
                color: pink,
                borderRadius: BorderRadius.vertical(top: Radius.circular(36))),
            child: Column(
              children: [
                Text(
                  LocaleKeys.introduction_third_title.locale,
                  style:
                      TextStyle(fontFamily: "bold", color: white, fontSize: 36),
                ),
                SizedBox(
                  height: 20,
                ),
                Center(
                  child: Text(
                    LocaleKeys.introduction_third_subtitle.locale,
                    style: TextStyle(
                        fontFamily: "normal", color: white, fontSize: 22),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
