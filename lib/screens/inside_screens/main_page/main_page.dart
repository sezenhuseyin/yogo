import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:yogoli/core/init/extension/string_extension.dart';
import 'package:yogoli/core/init/locale_keys.g.dart';
import 'package:yogoli/screens/consts.dart';
import 'package:yogoli/widgets/category_button.dart';
import 'package:yogoli/widgets/text.dart';
import 'package:appinio_swiper/appinio_swiper.dart';

class MainPage extends StatefulWidget {
  MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

late AppinioSwiperController _controller;

class _MainPageState extends State<MainPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = AppinioSwiperController();
  }

  bool visible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: purple,
      appBar: _homePageAppBar(),
      body: _homePageBody(),
    );
  }

  Container _homePageBody() {
    List<Widget> _imageList = [
      Image.asset("assets/yogoliTheme.png"),
      Image.asset("assets/justLogo.png")
    ];
    List<Widget> cards = [
      _swipeCards("Şam", "Dorock Xl", "22 Şubat",
          "https://pbs.twimg.com/media/Fjy0reOWAAE079P?format=jpg&name=small"),
      _swipeCards("Nova Norda", "Dorock Venue", "10 Ocak",
          "https://i.scdn.co/image/ab6761610000e5eb9d8a9220d6153c46e00772c7"),
      _swipeCards("Şam Pop 3", "Dorock Xl", "30 Mart",
          "https://pbs.twimg.com/media/Fjy0reOWAAE079P?format=jpg&name=small"),
    ];
    return Container(
      height: MediaQuery.of(context).size.height,
      padding: EdgeInsets.only(top: 30, right: 20, left: 20),
      decoration: BoxDecoration(
          color: white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(18))),
      child: ListView(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Bana Uygun Etkinlikler",
                style: TextStyle(fontFamily: "bold", fontSize: 22),
              ),
              IconButton(
                  onPressed: () {}, icon: Icon(CupertinoIcons.right_chevron))
            ],
          ),

          //////////
          //////////////
          ///////////
          ///////////////
          ///
          /* SizedBox(
            height: MediaQuery.of(context).size.height - 350,
            child: Stack(
              children: [
                _lastCard(),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height - 300,
                  child: AppinioSwiper(
                    controller: _controller,
                    onSwipe: (index, direction) {
                      print(index);
                      if (index == 0) {
                        visible = false;
                      }
                    },
                    cards: cards,
                  ),
                ),
              ],
            ),
          ),*/
          ////////
          /////
          ////
          ///
          ///
          ///
          SizedBox(
            height: 20,
          ),
          Text(
            "Kategori",
            style: TextStyle(fontFamily: "bold", fontSize: 22),
          ),
          Container(
              margin: EdgeInsets.symmetric(vertical: 20),
              height: 40,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  CategoryWidget(textTitle: "Konser"),
                  CategoryWidget(textTitle: "Rave"),
                  CategoryWidget(textTitle: "Parti"),
                  CategoryWidget(textTitle: "Spor"),
                  CategoryWidget(textTitle: "Yarışma")
                ],
              )),
          SizedBox(
            height: 20,
          ),
          Text(
            "Yaklaşan Etkinlikler",
            style: TextStyle(fontFamily: "bold", fontSize: 22),
          ),
          SizedBox(
            height: 20,
          ),
          //////////////
          ////
          ///
          ///
          ///
          ///
          /*
        SizedBox(
            height: 200,
            child: ListView.builder(
                //
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, int index) {
                  return _eventWidget(
                      "Adamlar",
                      "IF Beşiktaş",
                      "22 ocak",
                      "150 TL",
                      "https://blog.biletino.com/file/2022/07/if-performance-hall-besiktas-biletino-321461.png");
                }),
          ),
          
          SizedBox(
            height: 200,
            child: ListView.builder(
                //https://www.anadoluefessk.org/img/photos/01821bf9e7a9520d3fb4a2c507d413ed34a0bb86308cb4fd1623a158f249ed4b1080b564.jpg
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, int index) {
                  return _eventWidget(
                      "Adamlar",
                      "IF Beşiktaş",
                      "22 ocak",
                      "150 TL",
                      "https://www.anadoluefessk.org/img/photos/01821bf9e7a9520d3fb4a2c507d413ed34a0bb86308cb4fd1623a158f249ed4b1080b564.jpg");
                }),
          ),
          */
          /////////////////
          ///
          ///
          ///
          ///
          Text(
            "Popüler Mekanlar",
            style: TextStyle(fontFamily: "bold", fontSize: 22),
          ),
          SizedBox(
            height: 150,
          )
        ],
      ),
    );
  }

  Widget _eventWidget(
      String title, String place, String date, String price, String image) {
    return Container(
      width: MediaQuery.of(context).size.width / 3 * 2,
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.symmetric(horizontal: 10),
      decoration:
          BoxDecoration(color: grey, borderRadius: BorderRadius.circular(24)),
      child: Column(
        children: [
          Expanded(
              child: Row(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.width / 6 * 2,
                child: FittedBox(
                  child: Image.network(
                    image,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ],
          )),
          Expanded(
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [Text(title)],
            ),
          )
        ],
      ),
    );
  }

  Widget _swipeCards(String title, String mekan, String tarih, String image) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(24),
      child: Stack(
        children: [
          Positioned.fill(
            child: SizedBox(
              height: MediaQuery.of(context).size.height - 370,
              child: Builder(builder: (context) {
                return Image.asset(
                  "assets/populerBackground.png",
                  fit: BoxFit.fill,
                );
              }),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Spacer(
                  flex: 1,
                ),
                Expanded(
                  flex: 1,
                  child: FittedBox(
                    child: Text(
                      title,
                      textAlign: TextAlign.center,
                      style: TextStyle(fontFamily: "bold", color: white),
                    ),
                  ),
                ),
                Spacer(
                  flex: 5,
                ),
                Expanded(
                  flex: 15,
                  child: Container(
                    alignment: Alignment.centerLeft,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: MediaQuery.of(context).size.height - 600,
                          child: Image.network(image),
                        ),
                        Text(
                          mekan,
                          style: TextStyle(color: white),
                        ),
                        Text(
                          tarih,
                          style: TextStyle(color: white, fontSize: 20),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _lastCard() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(24),
        child: Stack(
          children: [
            Positioned.fill(
              child: SizedBox(
                height: MediaQuery.of(context).size.height - 370,
                child: Image.asset(
                  "assets/populerBackground.png",
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Hepsi Bitti",
                    style: TextStyle(color: white),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Ya da öyle mi dersin?",
                    style: TextStyle(color: white),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Yogoli ile etkinlik uzayına dal",
                    style: TextStyle(color: white, fontFamily: "bold"),
                  ),
                  TextButton(
                      style: TextButton.styleFrom(foregroundColor: purple),
                      onPressed: () {},
                      child: Text("Tümünü Gör"))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  AppBar _homePageAppBar() {
    return AppBar(
        centerTitle: true,
        foregroundColor: white,
        backgroundColor: purple,
        elevation: 0,
        title: Padding(
          padding: EdgeInsets.symmetric(horizontal: 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                  decoration:
                      BoxDecoration(color: black, shape: BoxShape.circle),
                  height: 50,
                  child: Image.asset("assets/justLogo.png")),
              SizedBox(height: 50, child: Image.asset("assets/logo.png"))
              /* Container(
                  decoration:
                      BoxDecoration(color: black, shape: BoxShape.circle),
                  height: 50,
                  child: Image.asset("assets/justLogo.png")),*/
            ],
          ),
        ));
  }
}

class SwipeCardData {
  String imageLink;
  SwipeCardData({required this.imageLink});
}
