import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:yogoli/screens/consts.dart';

class TranslateButton extends StatelessWidget {
  const TranslateButton({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      color: white,
      onPressed: () {
        if (context.locale == Locale("tr", "TR")) {
          context.setLocale(Locale("en", "US"));
        } else {
          context.setLocale(Locale("tr", "TR"));
        }
      },
      icon: Icon(
        FontAwesomeIcons.language,
      ),
    );
  }
}
