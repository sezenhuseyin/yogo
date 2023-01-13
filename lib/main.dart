import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:yogoli/core/constants.dart';
import 'package:yogoli/screens/consts.dart';
import 'package:yogoli/screens/inside_screens/Profile/profile_screens/ticket/ticket_info.dart';
import 'package:yogoli/screens/inside_screens/main_screen.dart';
import 'package:yogoli/screens/log_screens/intro_screen.dart';
import 'package:yogoli/screens/log_screens/login_register_screen.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:yogoli/screens/log_screens/pick_interest.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  runApp(EasyLocalization(
      saveLocale: true,
      child: Yogoli(),
      supportedLocales: [AppConstant.TR_LOCALE, AppConstant.EN_LOCALE],
      path: AppConstant.PATH));
}

class Yogoli extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        builder: EasyLoading.init(),
        locale: context.locale,
        supportedLocales: context.supportedLocales,
        localizationsDelegates: context.localizationDelegates,
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            inputDecorationTheme: InputDecorationTheme(
              focusColor: white,
              border: UnderlineInputBorder(
                  borderRadius: BorderRadius.circular(36),
                  borderSide: BorderSide.none),
              focusedBorder: InputBorder.none,
              fillColor: grey,
              filled: true,
              hintStyle: TextStyle(
                fontFamily: "bold",
              ),
              labelStyle: TextStyle(
                fontFamily: "bold",
              ),
            ),
            elevatedButtonTheme: ElevatedButtonThemeData(
                style: ElevatedButton.styleFrom(
                    textStyle: TextStyle(fontFamily: "normal", fontSize: 18),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(36)))),
            appBarTheme: AppBarTheme(
                centerTitle: true,
                titleTextStyle: TextStyle(fontFamily: "bold", fontSize: 22),
                backgroundColor: darkerBlue)),
        title: 'Yogoli',
        home:
            MainScreen()); //  PickInterest()); // MainScreen()); //IntroductionScreen()); //MainScreen());
  }
}
