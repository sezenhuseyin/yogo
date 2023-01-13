import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:yogoli/core/init/extension/string_extension.dart';
import 'package:yogoli/core/init/locale_keys.g.dart';
import 'package:yogoli/screens/consts.dart';
import 'package:yogoli/screens/inside_screens/Messages/message_page/message_page.dart';
import 'package:yogoli/widgets/text.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class Messages extends StatefulWidget {
  Messages({super.key});

  @override
  State<Messages> createState() => _MessagesState();
}

String exampleID = "255221";

class _MessagesState extends State<Messages> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: pink,
      appBar: AppBar(
          backgroundColor: pink,
          elevation: 0,
          title: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  LocaleKeys.main_screen_third_button.locale,
                ),
                SizedBox(
                  height: 40,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(40),
                    child: Image.network(
                        "https://media.licdn.com/dms/image/C5603AQFRJ2v8tL1RfQ/profile-displayphoto-shrink_400_400/0/1653419874909?e=1678320000&v=beta&t=fAOrTf5RImECcTI2mBHVIheErqWD8E7oYhFPTPN5_8s"),
                  ),
                ),
              ],
            ),
          )),
      body: Container(
        decoration: BoxDecoration(
            color: white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(18))),
        child: Center(
          child: Padding(
            padding: EdgeInsets.only(top: 20),
            child: ListView(
              children: [
                Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                    child: TextField(
                      decoration: InputDecoration(
                          hintText:
                              LocaleKeys.messages_screen_search_text.locale,
                          hintStyle: TextStyle(fontFamily: "normal"),
                          prefixIcon: Icon(
                            FontAwesomeIcons.magnifyingGlass,
                          )),
                    )),
                _messageText("Hüseyin SEZEN", "Son Mesaj bilgisi", "18:30",
                    "https://media.licdn.com/dms/image/C5603AQFRJ2v8tL1RfQ/profile-displayphoto-shrink_400_400/0/1653419874909?e=1678320000&v=beta&t=fAOrTf5RImECcTI2mBHVIheErqWD8E7oYhFPTPN5_8s"),
                _messageText("Alaattin SAMANCI", "Son Mesaj bilgisi", "18:29",
                    "https://media.licdn.com/dms/image/C5603AQGwLFa0qPH5QQ/profile-displayphoto-shrink_400_400/0/1644088897693?e=1678320000&v=beta&t=00mJAdffmQHESKCcG0oYln7mWDXpOFm9uPoKeIP0dx8"),
                _messageText("Hüseyin SEZEN", "Son Mesaj bilgisi", "18:30",
                    "https://media.licdn.com/dms/image/C5603AQFRJ2v8tL1RfQ/profile-displayphoto-shrink_400_400/0/1653419874909?e=1678320000&v=beta&t=fAOrTf5RImECcTI2mBHVIheErqWD8E7oYhFPTPN5_8s"),
                _messageText("Alaattin SAMANCI", "Son Mesaj bilgisi", "18:29",
                    "https://media.licdn.com/dms/image/C5603AQGwLFa0qPH5QQ/profile-displayphoto-shrink_400_400/0/1644088897693?e=1678320000&v=beta&t=00mJAdffmQHESKCcG0oYln7mWDXpOFm9uPoKeIP0dx8"),
                _messageText("Hüseyin SEZEN", "Son Mesaj bilgisi", "18:30",
                    "https://media.licdn.com/dms/image/C5603AQFRJ2v8tL1RfQ/profile-displayphoto-shrink_400_400/0/1653419874909?e=1678320000&v=beta&t=fAOrTf5RImECcTI2mBHVIheErqWD8E7oYhFPTPN5_8s"),
                _messageText("Alaattin SAMANCI", "Son Mesaj bilgisi", "18:29",
                    "https://media.licdn.com/dms/image/C5603AQGwLFa0qPH5QQ/profile-displayphoto-shrink_400_400/0/1644088897693?e=1678320000&v=beta&t=00mJAdffmQHESKCcG0oYln7mWDXpOFm9uPoKeIP0dx8"),
                _messageText("Hüseyin SEZEN", "Son Mesaj bilgisi", "18:30",
                    "https://media.licdn.com/dms/image/C5603AQFRJ2v8tL1RfQ/profile-displayphoto-shrink_400_400/0/1653419874909?e=1678320000&v=beta&t=fAOrTf5RImECcTI2mBHVIheErqWD8E7oYhFPTPN5_8s"),
                _messageText("Alaattin SAMANCI", "Son Mesaj bilgisi", "18:29",
                    "https://media.licdn.com/dms/image/C5603AQGwLFa0qPH5QQ/profile-displayphoto-shrink_400_400/0/1644088897693?e=1678320000&v=beta&t=00mJAdffmQHESKCcG0oYln7mWDXpOFm9uPoKeIP0dx8"),
                _messageText("Hüseyin SEZEN", "Son Mesaj bilgisi", "18:30",
                    "https://media.licdn.com/dms/image/C5603AQFRJ2v8tL1RfQ/profile-displayphoto-shrink_400_400/0/1653419874909?e=1678320000&v=beta&t=fAOrTf5RImECcTI2mBHVIheErqWD8E7oYhFPTPN5_8s"),
                _messageText("Alaattin SAMANCI", "Son Mesaj bilgisi", "18:29",
                    "https://media.licdn.com/dms/image/C5603AQGwLFa0qPH5QQ/profile-displayphoto-shrink_400_400/0/1644088897693?e=1678320000&v=beta&t=00mJAdffmQHESKCcG0oYln7mWDXpOFm9uPoKeIP0dx8")
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _messageText(
      String name, String lastMessage, String lastMessageDate, String image) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => MessagePage(messageId: exampleID)));
      },
      child: Container(
        decoration:
            BoxDecoration(color: grey, borderRadius: BorderRadius.circular(24)),
        margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        child: Slidable(
            endActionPane: ActionPane(
              motion: Container(
                decoration: BoxDecoration(
                    color: red,
                    borderRadius: BorderRadius.all(Radius.circular(12))),
                child: IconButton(
                    onPressed: () {},
                    icon: Icon(
                      CupertinoIcons.delete_solid,
                      color: white,
                    )),
              ),
              children: [],
            ),
            child: ListTile(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)),
              tileColor: white,
              leading: ClipRRect(
                child: Image.network(image),
                borderRadius: BorderRadius.circular(40),
              ),
              trailing: Text(lastMessageDate),
              title: Text(
                name,
                style: TextStyle(fontFamily: "bold"),
              ),
              subtitle: Text(lastMessage),
            )),
      ),
    );
  }
}
