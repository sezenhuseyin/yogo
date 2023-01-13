import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:yogoli/core/init/extension/string_extension.dart';
import 'package:yogoli/core/init/locale_keys.g.dart';
import 'package:yogoli/screens/consts.dart';
import 'package:intl/intl.dart'; //for date format
import 'package:intl/date_symbol_data_local.dart';

class MessagePage extends StatefulWidget {
  final messageId;
  const MessagePage({super.key, required this.messageId});

  @override
  State<MessagePage> createState() => _MessagePageState();
}

class _MessagePageState extends State<MessagePage> {
  String _image =
      "https://media.licdn.com/dms/image/C5603AQFRJ2v8tL1RfQ/profile-displayphoto-shrink_400_400/0/1653419874909?e=1678320000&v=beta&t=fAOrTf5RImECcTI2mBHVIheErqWD8E7oYhFPTPN5_8s";

  String _name = "Ateşsu Ateş";
  List<Message> messages = [
    Message(
        text: "Selam nasılsın",
        date: DateTime.now().subtract(Duration(seconds: 20)),
        sendByMe: false),
    Message(
        text: "İyi ya aynı sen nasılsın",
        date: DateTime.now().subtract(Duration(seconds: 10)),
        sendByMe: true),
    Message(
        text: "İyiyim ben de",
        date: DateTime.now().subtract(Duration(seconds: 8)),
        sendByMe: false),
    Message(
        text:
            "Ya geçen partide baya eğlenmiştik tekrar bir şeyler yapalım mı ne dersin?",
        date: DateTime.now().subtract(Duration(seconds: 1)),
        sendByMe: false),
    Message(
        text: "Selam nasılsın",
        date: DateTime.now().subtract(Duration(seconds: 20)),
        sendByMe: false),
    Message(
        text: "İyi ya aynı sen nasılsın",
        date: DateTime.now().subtract(Duration(seconds: 10)),
        sendByMe: true),
    Message(
        text: "İyiyim ben de",
        date: DateTime.now().subtract(Duration(days: 8)),
        sendByMe: false),
    Message(
        text:
            "Ya geçen partide baya eğlenmiştik tekrar bir şeyler yapalım mı ne dersin?",
        date: DateTime.now().subtract(Duration(seconds: 1)),
        sendByMe: false),
    Message(
        text: "Selam nasılsın",
        date: DateTime.now().subtract(Duration(seconds: 20)),
        sendByMe: false),
    Message(
        text: "İyi ya aynı sen nasılsın",
        date: DateTime.now().subtract(Duration(seconds: 10)),
        sendByMe: true),
    Message(
        text: "İyiyim ben de",
        date: DateTime.now().subtract(Duration(seconds: 8)),
        sendByMe: false),
    Message(
        text:
            "Ya geçen partide baya eğlenmiştik tekrar bir şeyler yapalım mı ne dersin?",
        date: DateTime.now().subtract(Duration(seconds: 1)),
        sendByMe: false),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        child: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            ListTile(
              leading: ClipRRect(
                borderRadius: BorderRadius.circular(25),
                child: SizedBox(height: 50, child: Image.network(_image)),
              ),
              title: Text(
                _name,
                style: TextStyle(fontFamily: "bold"),
              ),
              trailing: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(CupertinoIcons.xmark)),
            ),
            const Divider(),
            Expanded(
                child: GroupedListView<Message, DateTime>(
              elements: messages,
              groupBy: (message) => DateTime(
                  message.date.year, message.date.month, message.date.day),
              groupHeaderBuilder: (Message message) => Container(
                decoration: BoxDecoration(
                    color: pink.withAlpha(200),
                    borderRadius: BorderRadius.circular(8)),
                padding: EdgeInsets.symmetric(horizontal: 5, vertical: 8),
                child: Center(
                    widthFactor: 1,
                    heightFactor: 1,
                    child: Text(DateFormat.yMMMd(
                            LocaleKeys.message_page_language.locale)
                        .format(message.date))),
              ),
              itemBuilder: (context, Message message) => Align(
                  alignment: !message.sendByMe
                      ? Alignment.centerLeft
                      : Alignment.centerRight,
                  child: Container(
                      constraints: BoxConstraints(
                        maxWidth: MediaQuery.of(context).size.width / 8 * 5,
                      ),
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                      margin: EdgeInsets.symmetric(vertical: 5),
                      decoration: BoxDecoration(
                          color: !message.sendByMe ? lightBlue : grey,
                          borderRadius: BorderRadius.circular(12)),
                      child: Text(
                        message.text,
                        style:
                            TextStyle(color: !message.sendByMe ? white : black),
                        textAlign: TextAlign.start,
                      ))),
              useStickyGroupSeparators: true,
              floatingHeader: true,
              order: GroupedListOrder.ASC,
            )),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                    width: MediaQuery.of(context).size.width - 100,
                    child: TextField(
                      decoration: InputDecoration(
                          hintStyle: TextStyle(fontFamily: "normal"),
                          hintText:
                              LocaleKeys.message_page_text_field_hint.locale),
                    )),
                CircleAvatar(
                    radius: 25,
                    child: FloatingActionButton(
                        backgroundColor: purple,
                        elevation: 10,
                        onPressed: () {},
                        child: Icon(CupertinoIcons.paperplane_fill)))
              ],
            )
          ],
        ),
      ),
    );
  }
}

class Message {
  String text;
  DateTime date;
  bool sendByMe;
  Message({required this.text, required this.date, required this.sendByMe});
}
