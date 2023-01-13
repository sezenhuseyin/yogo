import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:yogoli/core/init/extension/string_extension.dart';
import 'package:yogoli/core/init/locale_keys.g.dart';
import 'package:yogoli/screens/consts.dart';
import 'package:yogoli/screens/log_screens/login_screen.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

TextEditingController _mailController = TextEditingController();
TextEditingController _passController = TextEditingController();
TextEditingController _passCheckController = TextEditingController();
TextEditingController _nameSurnameController = TextEditingController();
TextEditingController _phoneController = TextEditingController();
bool obsecureText = true;
bool obsecureText2 = true;

class _RegisterState extends State<Register> {
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _mailController.clear();
    _passController.clear();
    _passCheckController.clear();
    _nameSurnameController.clear();
    _phoneController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
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
                  AppBar(
                    title: Text(
                      LocaleKeys.reg_register.locale,
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
                        LocaleKeys.reg_title.locale,
                        style: TextStyle(
                          fontFamily: "bold",
                          color: pink,
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
                        LocaleKeys.reg_subtitle.locale,
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
                        controller: _nameSurnameController,
                        keyboardType: TextInputType.name,
                        decoration: InputDecoration(
                          hintText: LocaleKeys.reg_name.locale,
                        )),
                  ),
                  Spacer(),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 40),
                    child: TextField(
                        controller: _phoneController,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          hintText: LocaleKeys.reg_phone.locale,
                        )),
                  ),
                  Spacer(),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 40),
                    child: TextField(
                        controller: _mailController,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          hintText: LocaleKeys.reg_mail.locale,
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
                        hintText: LocaleKeys.reg_password.locale,
                      ),
                    ),
                  ),
                  Spacer(),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 40),
                    child: TextField(
                      obscureText: obsecureText2,
                      controller: _passCheckController,
                      keyboardType: TextInputType.visiblePassword,
                      decoration: InputDecoration(
                        suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                obsecureText2 = !obsecureText2;
                              });
                            },
                            icon: obsecureText2
                                ? Icon(FontAwesomeIcons.solidEye)
                                : Icon(FontAwesomeIcons.solidEyeSlash)),
                        hintText: LocaleKeys.reg_passwordcheck.locale,
                      ),
                    ),
                  ),
                  Spacer(
                    flex: 5,
                  ),
                  ElevatedButton(
                      onPressed: () {},
                      child: Text(
                        LocaleKeys.reg_register.locale,
                        style: TextStyle(fontFamily: "bold", color: white),
                      ),
                      style: ElevatedButton.styleFrom(
                          backgroundColor: pink,
                          minimumSize: Size(
                              MediaQuery.of(context).size.width - 80, 60))),
                  Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        LocaleKeys.reg_bottomtext.locale,
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
                                    builder: (context) => LogIn()));
                          },
                          child: Text(
                            LocaleKeys.reg_bottombutton.locale,
                            style: TextStyle(fontFamily: "bold", color: purple),
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
        ),
      ),
    );
  }
}
