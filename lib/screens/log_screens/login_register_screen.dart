import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:yogoli/core/init/extension/string_extension.dart';
import 'package:yogoli/core/init/locale_keys.g.dart';
import 'package:yogoli/screens/consts.dart';
import 'package:yogoli/screens/log_screens/login_screen.dart';
import 'package:yogoli/screens/log_screens/register_screen.dart';
import 'package:yogoli/widgets/text.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:yogoli/widgets/translate.dart';

class LogRegister extends StatelessWidget {
  const LogRegister({super.key});

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
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
            Column(
              children: [
                Expanded(
                    flex: 25,
                    child: Center(
                        child: SizedBox(
                            height: 300,
                            child: Image.asset("assets/coloredLogo.png")))),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => LogIn()));
                  },
                  child: Text(
                    LocaleText(text: LocaleKeys.log_reg_giris.locale).text,
                    style: TextStyle(fontFamily: "bold", color: white),
                  ),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: purple,
                      minimumSize: Size(_width - 100, 60)),
                ),
                Spacer(),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Register()));
                  },
                  child: Text(
                    LocaleText(text: LocaleKeys.log_reg_kayit.locale).text,
                    style: TextStyle(fontFamily: "bold", color: purple),
                  ),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: white,
                      minimumSize: Size(_width - 100, 60)),
                ),
                Spacer(),
              ],
            ),
            TranslateButton()
          ],
        ),
      ),
    );
  }
}
