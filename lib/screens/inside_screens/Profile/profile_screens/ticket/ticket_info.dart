import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:yogoli/core/init/extension/string_extension.dart';
import 'package:yogoli/core/init/locale_keys.g.dart';
import 'package:yogoli/screens/consts.dart';
import 'package:ticket_widget/ticket_widget.dart';
import 'package:qr_flutter/qr_flutter.dart';

class TicketInfo extends StatelessWidget {
  TicketInfo({super.key});
  var _image =
      "https://www.rapertuar.com/wp-content/uploads/2022/11/s%CC%A7am-1080x680.jpg";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            SizedBox(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: Image.asset(
                  "assets/background.png",
                  fit: BoxFit.fill,
                )),
            _ticketDetails(context),
            _appBar(context),
          ],
        ),
      ),
    );
  }

  Widget _ticketDetails(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(36),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width - 100,
                  child: Center(
                    child: Column(
                      children: [
                        Image.network(_image),
                        TicketWidget(
                            isCornerRounded: false,
                            color: purple,
                            width: MediaQuery.of(context).size.width - 100,
                            height: MediaQuery.of(context).size.height / 2,
                            child: Column(
                              children: [
                                Spacer(),
                                Text(
                                  "Şamil Oymak: POP 3 ",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: white,
                                      fontFamily: "bold",
                                      fontSize: 20),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  "29 Kasım 2023",
                                  style: TextStyle(
                                      color: grey,
                                      fontFamily: "bold",
                                      fontSize: 16),
                                ),
                                Spacer(),
                                Divider(
                                  thickness: 2,
                                  indent: 40,
                                  endIndent: 40,
                                ),
                                Spacer(),
                                Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 20),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(LocaleKeys
                                              .ticket_details_date.locale),
                                          Text("29 Kasım 2023")
                                        ],
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                          Text(LocaleKeys
                                              .ticket_details_time.locale),
                                          Text("10:30 PM")
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 20),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(LocaleKeys
                                              .ticket_details_venue.locale),
                                          Text("IF Beşiktaş")
                                        ],
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                          Text(LocaleKeys
                                              .ticket_details_seat.locale),
                                          Text("Koltuk Yok")
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                                Spacer(
                                  flex: 4,
                                ),
                                Divider(
                                  thickness: 2,
                                  indent: 40,
                                  endIndent: 40,
                                ),
                                Spacer(
                                  flex: 2,
                                ),
                                QrImage(
                                  foregroundColor: white,
                                  data: "Sam Konseri",
                                  size: MediaQuery.of(context).size.height / 5,
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                              ],
                            )),
                      ],
                    ),
                  ),
                ),
              ),
              Positioned(
                  top: 10,
                  right: 10,
                  child: IconButton(
                      onPressed: () {
                        _showDetailedDialog(context);
                      },
                      icon: CircleAvatar(
                        backgroundColor: blue,
                        child: Icon(
                          FontAwesomeIcons.info,
                          color: white,
                        ),
                      ))),
            ],
          ),
        ],
      ),
    );
  }

  Future<void> _showDetailedDialog(BuildContext context) {
    return showDialog<void>(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return AlertDialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
          title: Text(LocaleKeys.ticket_details_more_event_details.locale),
          content: SingleChildScrollView(
            child: ListBody(
              children: const <Widget>[
                Text('Ek etkinlik açıklamaları'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text(LocaleKeys.ticket_details_button.locale),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  Row _appBar(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          icon: Icon(
            CupertinoIcons.left_chevron,
            color: white,
            size: 18,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        Text(
          "Bilet Bilgisi",
          style: TextStyle(fontFamily: "bold", fontSize: 18, color: white),
        ),
        IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.share,
              color: white,
            ))
      ],
    );
  }
}
