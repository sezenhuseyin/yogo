import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:yogoli/core/init/extension/string_extension.dart';

class LocaleText extends StatelessWidget {
  final String text;

  const LocaleText({super.key, required this.text
  });

  @override
  Widget build(BuildContext context) {
    return AutoSizeText(text.locale);
  }
}
