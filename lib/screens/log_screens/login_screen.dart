import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:yogoli/core/init/extension/string_extension.dart';
import 'package:yogoli/core/init/locale_keys.g.dart';
import 'package:yogoli/screens/consts.dart';
import 'package:yogoli/screens/log_screens/register_screen.dart';
import 'package:yogoli/widgets/text.dart';

class LogIn extends StatefulWidget {
  const LogIn({super.key});

  @override
  State<LogIn> createState() => _LogInState();
}

bool obsecureText = true;
TextEditingController _mailController = TextEditingController();
late TextEditingController _passController = TextEditingController();

class _LogInState extends State<LogIn> {
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _mailController.clear();
    _passController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              "assets/background.png",
              fit: BoxFit.fill,
            ),
          ),
          Column(
            children: [
              AppBar(
                title: LocaleText(
                  text: LocaleKeys.log_reg_giris,
                ),
                backgroundColor: Colors.transparent,
                elevation: 0,
              ),
              Spacer(
                flex: 2,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 40),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    LocaleKeys.log_title.locale,
                    style: TextStyle(
                      fontFamily: "bold",
                      color: purple,
                      fontSize: 36,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 40),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    LocaleKeys.log_subtitle.locale,
                    style: TextStyle(
                      fontFamily: "bold",
                      color: white,
                      fontSize: 22,
                    ),
                  ),
                ),
              ),
              Spacer(
                flex: 3,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 40),
                child: TextField(
                    controller: _mailController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      hintText: LocaleKeys.log_mail.locale,
                    )),
              ),
              Spacer(),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 40),
                child: TextField(
                  obscureText: obsecureText,
                  controller: _passController,
                  keyboardType: TextInputType.visiblePassword,
                  decoration: InputDecoration(
                    suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            obsecureText = !obsecureText;
                          });
                        },
                        icon: obsecureText
                            ? Icon(FontAwesomeIcons.solidEye)
                            : Icon(FontAwesomeIcons.solidEyeSlash)),
                    hintText: LocaleKeys.log_password.locale,
                  ),
                ),
              ),
              Spacer(
                flex: 5,
              ),
              ElevatedButton(
                  onPressed: () {},
                  child: Text(
                    LocaleKeys.log_login.locale,
                    style: TextStyle(fontFamily: "bold"),
                  ),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: purple,
                      minimumSize:
                          Size(MediaQuery.of(context).size.width - 80, 60))),
              Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    LocaleKeys.log_bottomtext.locale,
                    style: TextStyle(
                      fontFamily: "bold",
                      color: white,
                      fontSize: 18,
                    ),
                  ),
                  TextButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Register()));
                      },
                      child: Text(
                        LocaleKeys.log_bottombutton.locale,
                        style: TextStyle(fontFamily: "bold", color: pink),
                      ))
                ],
              ),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
