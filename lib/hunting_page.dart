import 'package:flutter/material.dart';
import 'dart:math';

import 'package:kencan_app/model/account.dart';

class HuntingPage extends StatefulWidget {
  const HuntingPage({Key? key}) : super(key: key);

  @override
  _HuntingPageState createState() => _HuntingPageState();
}

class _HuntingPageState extends State<HuntingPage> {
  int indexIdPerson = 0;

  void randomValue() {
    indexIdPerson = Random().nextInt(18);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Card(
        margin: const EdgeInsets.all(20),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        child: Center(
          child: Image(
              height: 350,
              fit: BoxFit.fill,
              image: AssetImage(accountList[indexIdPerson].profilePic)),
        ),
        color: Colors.blue,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Container(
        margin: const EdgeInsets.fromLTRB(30, 0, 30, 30),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: () {
                setState(() {
                  randomValue();
                });
              },
              child: const CircleAvatar(
                backgroundColor: Colors.white,
                radius: 25,
                child: Icon(
                  Icons.close,
                  color: Colors.red,
                  size: 50,
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  randomValue();
                });
              },
              child: const CircleAvatar(
                backgroundColor: Colors.white,
                radius: 25,
                child: Padding(
                  padding: EdgeInsets.only(top: 5),
                  child: Icon(
                    Icons.favorite,
                    color: Colors.red,
                    size: 40,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
