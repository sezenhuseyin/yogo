import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:yogoli/core/init/extension/string_extension.dart';
import 'package:yogoli/core/init/locale_keys.g.dart';
import 'package:yogoli/screens/consts.dart';
import 'package:yogoli/screens/inside_screens/Profile/profile_screens/ticket/ticket_info.dart';

class TicketList extends StatelessWidget {
  const TicketList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Center(
              child: Column(
                children: [
                  SizedBox(
                    height: 60,
                  ),
                  Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: TextField(
                        decoration: InputDecoration(
                            fillColor: grey,
                            prefixIcon: Icon(FontAwesomeIcons.magnifyingGlass)),
                      )),
                  _ticketWidget(context, "Şamil Oymak"),
                  _ticketWidget(context, "Şamil Oymak"),
                  _ticketWidget(context, "Şamil Oymak"),
                  _ticketWidget(context, "Şamil Oymak"),
                  _ticketWidget(context, "Şamil Oymak"),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                BackButton(),
                Text(
                  LocaleKeys.ticket_list_title.locale,
                  style: TextStyle(
                      fontFamily: "bold", fontSize: 22, color: orange),
                ),
                SizedBox(
                  width: 36,
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  _ticketWidget(BuildContext context, String title) {
    return Container(
      margin: EdgeInsets.only(top: 10),
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: ListTile(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        tileColor: grey,
        title: Text(
          title,
          style: TextStyle(fontFamily: "bold"),
        ),
        onTap: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => TicketInfo()));
        },
      ),
    );
  }
}
