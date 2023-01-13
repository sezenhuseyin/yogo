import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:yogoli/screens/consts.dart';

class CategoryWidget extends StatelessWidget {
  final String textTitle;
  CategoryWidget({super.key, required this.textTitle});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5),
      color: grey,
      child: Center(
          widthFactor: 2,
          heightFactor: 1,
          child: Text(
            textTitle,
            style: TextStyle(fontFamily: "bold"),
          )),
    );
  }
}
