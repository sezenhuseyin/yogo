import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:yogoli/core/init/extension/string_extension.dart';
import 'package:yogoli/core/init/locale_keys.g.dart';
import 'package:yogoli/screens/consts.dart';
import 'package:yogoli/screens/inside_screens/Profile/profile_screens/edit_profile/edit_profile.dart';
import 'package:yogoli/screens/inside_screens/Profile/profile_screens/ticket/ticket_info.dart';
import 'package:yogoli/screens/inside_screens/Profile/profile_screens/ticket/ticket_list.dart';
import 'package:yogoli/screens/inside_screens/main_page/main_page.dart';
import 'package:yogoli/screens/inside_screens/main_screen.dart';
import 'package:yogoli/widgets/text.dart';
import 'package:yogoli/widgets/translate.dart';

class Profile extends StatefulWidget {
  Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: orange,
      appBar: AppBar(
        centerTitle: false,
        backgroundColor: orange,
        elevation: 0,
        title: Padding(
          padding: EdgeInsets.only(left: 30),
          child: Text(
            LocaleKeys.main_screen_fourth_button.locale,
          ),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
            color: white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(18))),
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          child: Center(
              child: Column(
            children: [
              Container(
                margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: Column(
                  children: [
                    Column(
                      children: [
                        Stack(
                          children: [
                            ClipOval(
                              clipBehavior: Clip.antiAlias,
                              child: Container(
                                child: Padding(
                                  padding: const EdgeInsets.all(
                                      10.0), //width of the border
                                  child: ClipOval(
                                    clipBehavior: Clip.antiAlias,
                                    child: Container(
                                      width:
                                          140.0, // this width forces the container to be a circle
                                      height: 140.0,
                                      child: SizedBox(
                                        height: 140,
                                      ),
                                      decoration: kInnerDecoration,
                                    ),
                                  ),
                                ),
                                decoration: kGradientBoxDecoration,
                              ),
                            ),
                            Positioned(
                              left: 11,
                              bottom: 11,
                              child: CircleAvatar(
                                backgroundColor: white,
                                radius: 70,
                                child: ClipRRect(
                                    borderRadius: BorderRadius.circular(70),
                                    child: Image.network(
                                        "https://media.licdn.com/dms/image/C5603AQFRJ2v8tL1RfQ/profile-displayphoto-shrink_400_400/0/1653419874909?e=1678320000&v=beta&t=fAOrTf5RImECcTI2mBHVIheErqWD8E7oYhFPTPN5_8s")),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Hüseyin SEZEN",
                      style: TextStyle(
                          fontFamily: "bold",
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text("Çaylak"),
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 100),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              Text(
                                "100",
                                style:
                                    TextStyle(fontFamily: "bold", fontSize: 16),
                              ),
                              Text("Takip")
                            ],
                          ),
                          Column(
                            children: [
                              Text(
                                "100",
                                style:
                                    TextStyle(fontFamily: "bold", fontSize: 16),
                              ),
                              Text("Takipçi")
                            ],
                          ),
                          Column(
                            children: [
                              Text(
                                "1250",
                                style:
                                    TextStyle(fontFamily: "bold", fontSize: 16),
                              ),
                              Text("Puan")
                            ],
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          elevation: 0, backgroundColor: green),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => EditProfile()));
                      },
                      child: Center(
                        heightFactor: 2,
                        widthFactor: 1,
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              "Profili Düzenle",
                              style: TextStyle(fontFamily: "normal"),
                            ),
                            Icon(CupertinoIcons.right_chevron)
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 20, bottom: 10, left: 10),
                      color: grey,
                      child: Align(
                          alignment: Alignment.bottomLeft,
                          child: Text(
                            "İçerik",
                            style: TextStyle(
                                fontFamily: "bold", color: darkerGrey),
                          )),
                    ),
                    ListTile(
                      onTap: () {},
                      leading: Icon(
                        FontAwesomeIcons.solidHeart,
                        color: darkerGrey,
                      ),
                      trailing: Icon(CupertinoIcons.right_chevron),
                      title: Text(
                        "Favoriler",
                        style: TextStyle(fontFamily: "bold", color: black),
                      ),
                    ),
                    ListTile(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => TicketList()));
                      },
                      leading: Icon(
                        CupertinoIcons.ticket_fill,
                        color: darkerGrey,
                      ),
                      trailing: Icon(CupertinoIcons.right_chevron),
                      title: Text(
                        "Biletlerim",
                        style: TextStyle(fontFamily: "bold", color: black),
                      ),
                    ),
                    ListTile(
                      onTap: () {},
                      leading: Icon(FontAwesomeIcons.solidCalendar),
                      trailing: Icon(CupertinoIcons.right_chevron),
                      title: Text(
                        "Etkinliklerim",
                        style: TextStyle(fontFamily: "bold", color: black),
                      ),
                    ),
                    ListTile(
                      onTap: () {},
                      leading: Icon(CupertinoIcons.sparkles),
                      trailing: Icon(CupertinoIcons.right_chevron),
                      title: Text(
                        "Katıldıklarım",
                        style: TextStyle(fontFamily: "bold", color: black),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 20, bottom: 10, left: 10),
                      color: grey,
                      child: Align(
                          alignment: Alignment.bottomLeft,
                          child: Text(
                            "Tercihler  ",
                            style: TextStyle(
                                fontFamily: "bold", color: darkerGrey),
                          )),
                    ),
                    ListTile(
                      onTap: () {
                        _languageSelection(context);
                      },
                      leading: Icon(FontAwesomeIcons.language),
                      trailing: Icon(CupertinoIcons.right_chevron),
                      title: Text(
                        "Dil",
                        style: TextStyle(fontFamily: "bold", color: black),
                      ),
                    ),
                    ListTile(
                      onTap: () {},
                      leading: Icon(FontAwesomeIcons.gear),
                      trailing: Icon(CupertinoIcons.right_chevron),
                      title: Text(
                        "Hesap Ayarları",
                        style: TextStyle(fontFamily: "bold", color: black),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    ListTile(
                      tileColor: red,
                      onTap: () {},
                      title: Center(
                        child: Text(
                          "Çıkış Yap",
                          style: TextStyle(fontFamily: "bold", color: white),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 150,
                    ),
                  ],
                ),
              )
            ],
          )),
        ),
      ),
    );
  }

  Future<void> _languageSelection(BuildContext context) {
    return showDialog<void>(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: white,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(36)),
          actionsAlignment: MainAxisAlignment.center,
          title: Center(
              child: const Text(
            'Dil Seçimi',
            style: TextStyle(fontFamily: "bold", color: purple),
          )),
          actions: <Widget>[
            TextButton(
              child: const Text(
                'Türkçe',
                style: TextStyle(fontFamily: "normal", color: black),
              ),
              onPressed: () {
                context.setLocale(Locale("tr", "TR"));
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text(
                'English',
                style: TextStyle(fontFamily: "normal", color: black),
              ),
              onPressed: () {
                context.setLocale(Locale("en", "US"));
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}

final kInnerDecoration = BoxDecoration(
  color: Colors.transparent,
  border: Border.all(color: Colors.white),
  borderRadius: BorderRadius.circular(32),
);
// border for all 3 colors
final kGradientBoxDecoration = BoxDecoration(
  gradient: LinearGradient(colors: [orange, pink, yellow, purple]),
  border: Border.all(
    color: Colors.transparent, //kHintColor, so this should be changed?
  ),
  borderRadius: BorderRadius.circular(32),
);
