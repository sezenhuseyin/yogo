import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:yogoli/core/init/extension/string_extension.dart';
import 'package:yogoli/screens/consts.dart';
import 'package:yogoli/widgets/text.dart';

import '../../../core/init/locale_keys.g.dart';

class Notifications extends StatefulWidget {
  Notifications({super.key});

  @override
  State<Notifications> createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: yellow,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: yellow,
        title: Padding(
          padding: EdgeInsets.only(right: 30, left: 30, top: 20, bottom: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                LocaleKeys.main_screen_second_button.locale,
              ),
              Icon(
                CupertinoIcons.bell_fill,
                color: white,
              )
            ],
          ),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
            color: white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(18))),
        child: Center(
          child: ListView(
            children: [
              SizedBox(
                height: 10,
              ),
              _successTile("Hesap bilgileriniz tamamlanmıştır",
                  "Artık etkinliklere katılabilirsiniz"),
              _failTile("İade talebiniz olumsuz sonuçlanmıştır",
                  "İlettiğiniz talep tarafımzca değerlendirerek olumsuz sonuçlandırılmıştır"),
              _successTile("Hesap bilgileriniz tamamlanmıştır",
                  "Artık etkinliklere katılabilirsiniz"),
              _failTile("İade talebiniz olumsuz sonuçlanmıştır",
                  "İlettiğiniz talep tarafımzca değerlendirerek olumsuz sonuçlandırılmıştır"),
              _successTile("Hesap bilgileriniz tamamlanmıştır",
                  "Artık etkinliklere katılabilirsiniz"),
              _failTile("İade talebiniz olumsuz sonuçlanmıştır",
                  "İlettiğiniz talep tarafımzca değerlendirerek olumsuz sonuçlandırılmıştır"),
              _successTile("Hesap bilgileriniz tamamlanmıştır",
                  "Artık etkinliklere katılabilirsiniz"),
              _failTile("İade talebiniz olumsuz sonuçlanmıştır",
                  "İlettiğiniz talep tarafımzca değerlendirerek olumsuz sonuçlandırılmıştır"),
            ],
          ),
        ),
      ),
    );
  }

  Widget _successTile(String title, String subtitle) {
    return Container(
      decoration:
          BoxDecoration(color: grey, borderRadius: BorderRadius.circular(18)),
      margin: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      child: ListTile(
        contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        leading: Icon(
          FontAwesomeIcons.circleCheck,
          color: green,
        ),
        trailing: IconButton(
          icon: Icon(CupertinoIcons.xmark),
          onPressed: () {
            _deleteNotificationPopUp();
          },
        ),
        title: Text(
          title,
          style: TextStyle(fontFamily: "bold"),
        ),
        subtitle: Text(subtitle),
      ),
    );
  }

  Future<void> _deleteNotificationPopUp() {
    return showDialog<void>(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return AlertDialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
          title: Center(
              child: FittedBox(
            child: Text(
              LocaleKeys.notifications_notification_title.locale,
              style: TextStyle(fontFamily: "bold", fontSize: 20),
            ),
          )),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(
                  LocaleKeys.notifications_notification_subtitle1.locale,
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  LocaleKeys.notifications_notification_subtitle2.locale,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
          actionsAlignment: MainAxisAlignment.center,
          actions: <Widget>[
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: red),
              child: Center(
                  widthFactor: 3,
                  heightFactor: 2,
                  child: Text(
                    LocaleKeys.notifications_button_text.locale,
                  )),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  Widget _failTile(String title, String subtitle) {
    return Container(
      decoration:
          BoxDecoration(color: grey, borderRadius: BorderRadius.circular(18)),
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      margin: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      child: ListTile(
        contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        leading: Icon(
          FontAwesomeIcons.circleXmark,
          color: red,
        ),
        trailing: IconButton(
          icon: Icon(CupertinoIcons.xmark),
          onPressed: () {
            _deleteNotificationPopUp();
          },
        ),
        tileColor: grey,
        title: Text(
          title,
          style: TextStyle(fontFamily: "bold"),
        ),
        subtitle: Text(subtitle),
      ),
    );
  }
}
