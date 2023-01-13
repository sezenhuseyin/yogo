import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:yogoli/core/constants.dart';
import 'package:yogoli/core/init/extension/string_extension.dart';
import 'package:yogoli/core/init/locale_keys.g.dart';
import 'package:yogoli/screens/consts.dart';
import 'package:yogoli/screens/inside_screens/Messages/messages.dart';
import 'package:yogoli/screens/inside_screens/Profile/profile.dart';
import 'package:yogoli/screens/inside_screens/main_page/main_page.dart';
import 'package:yogoli/screens/inside_screens/notifications/notifications.dart';
import 'package:cupertino_icons/cupertino_icons.dart';
import 'package:yogoli/widgets/text.dart';

class MainScreen extends StatefulWidget {
  MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

int _index = 0;
var _pageList;

class _MainScreenState extends State<MainScreen> {
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _pageList.clear();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _pageList = [MainPage(), Notifications(), Messages(), Profile()];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            _pageList[_index],
            coloredbottomNavBar() //bottomNavBar() // tried(),
          ],
        ),
      ),
    );
  }

  Widget coloredbottomNavBar() => Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          margin: EdgeInsets.only(bottom: 15, right: 10, left: 10),
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: _colorList[_index].withOpacity(.5),
                blurRadius: 36.0,
                spreadRadius: 0.0,
                offset: Offset(.1, 0.1), // shadow direction: bottom right
              )
            ],
            borderRadius: BorderRadius.circular(36),
            color: _colorList[_index].withAlpha(200),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _whiteBottomItem(0),
              _whiteBottomItem(1),
              _whiteBottomItem(2),
              _whiteBottomItem(3)
            ],
          ),
        ),
      );
  Widget _whiteBottomItem(int funcIndex) => InkWell(
      onTap: () {
        setState(() {
          _index = funcIndex;
        });
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18),
          color: _index == funcIndex ? white : Colors.transparent,
        ),
        child: Row(
          children: [
            Icon(
              _list[funcIndex].icon,
              color: _index != funcIndex
                  ? black.withAlpha(220)
                  : _list[funcIndex].color,
            ),
            const SizedBox(
              width: 5,
            ),
            Text(
              _index == funcIndex ? _list[funcIndex].string : "",
              style: TextStyle(
                  fontFamily: "bold",
                  color: _colorList[funcIndex],
                  fontSize: 12),
            ),
          ],
        ),
      ));
  /*
  Widget bottomNavBar() => Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          margin: EdgeInsets.only(bottom: 10, right: 10, left: 10),
          decoration: BoxDecoration(
              color: white, borderRadius: BorderRadius.circular(36)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _exampleBottomItem(0),
              _exampleBottomItem(1),
              _exampleBottomItem(2),
              _exampleBottomItem(3)
            ],
          ),
        ),
      );
  Widget _exampleBottomItem(int funcIndex) => InkWell(
      onTap: () {
        setState(() {
          index = funcIndex;
        });
      },
      child: AnimatedContainer(
        duration: Duration(milliseconds: index != funcIndex ? 0 : 150),
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18),
          color: index != funcIndex
              ? Colors.transparent
              : _list[funcIndex].color.withOpacity(.3),
        ),
        child: Row(
          children: [
            Icon(
              _list[funcIndex].icon,
              color: index != funcIndex
                  ? black.withAlpha(220)
                  : _list[funcIndex].color,
            ),
            SizedBox(
              width: 5,
            ),
            Text(
              index == funcIndex ? _list[funcIndex].string : "",
              style: TextStyle(fontFamily: "bold", color: black),
            ),
          ],
        ),
      ));*/
}

List<Color> _colorList = [purple, yellow, pink, orange];
List<IconWidget> _list = [
  IconWidget(
      string: LocaleKeys.main_screen_first_button.locale,
      icon: CupertinoIcons.house_fill,
      color: purple),
  IconWidget(
      string: LocaleKeys.main_screen_second_button.locale,
      icon: CupertinoIcons.bell_solid,
      color: yellow),
  IconWidget(
      string: LocaleKeys.main_screen_third_button.locale,
      icon: CupertinoIcons.chat_bubble_fill,
      color: pink),
  IconWidget(
      string: LocaleKeys.main_screen_fourth_button.locale,
      icon: CupertinoIcons.person_circle_fill,
      color: orange),
];

class IconWidget {
  String string;
  IconData icon;
  Color color;
  IconWidget({required this.string, required this.icon, required this.color});
}
