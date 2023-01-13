import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:yogoli/screens/consts.dart';

class PickInterest extends StatefulWidget {
  const PickInterest({super.key});

  @override
  State<PickInterest> createState() => _PickInterestState();
}

class _PickInterestState extends State<PickInterest> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: purple, title: Text("İlgi Alanların")),
      body: GridView.builder(
          primary: false,
          itemCount: _interestsList.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
          ),
          padding: const EdgeInsets.all(20),
          itemBuilder: (context, index) {
            return _pickInterestWidget(_interestsList[index]);
          }),
    );
  }

  List<Interest> _pickedInterests = [];

  List<Interest> _interestsList = [
    Interest(name: "Spor", index: 0, picked: false),
    Interest(name: "Sinema", index: 1, picked: false),
    Interest(name: "Kahve", index: 2, picked: false),
    Interest(name: "Bilardo", index: 3, picked: false),
  ];
  Widget _pickInterestWidget(Interest intereset) {
    return InkWell(
      borderRadius: BorderRadius.circular(24),
      onTap: () {
        setState(() {
          intereset.picked = !intereset.picked;
        });
      },
      child: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
          color: intereset.picked ? blue : grey,
          child: Center(
            child: Text(
              intereset.name,
              style: TextStyle(
                  fontFamily: "bold", color: intereset.picked ? white : black),
            ),
          )),
    );
  }
}

class Interest {
  String name;
  int index;
  bool picked;
  Interest({required this.name, required this.index, required this.picked});
}
