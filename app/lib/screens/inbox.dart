import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'dart:ui';

import '../style.dart';

class Inbox extends StatefulWidget {
  const Inbox({Key? key}) : super(key: key);

  @override
  State<Inbox> createState() => _inbox();
}

class _inbox extends State<Inbox> {
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/wtp_bg.png'), fit: BoxFit.cover)),
        child: Scaffold(
          appBar: _buildAppBar(),
          backgroundColor: Colors.transparent,
          body: SafeArea(
              child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                    child: Row(children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(15, 0, 0, 0),
                    child: searchBox(),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                        width: 50,
                        height: 50,
                        child: Icon(Icons.person_add),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white.withOpacity(.5))),
                  )
                ])),
                Padding(
                  padding: const EdgeInsets.fromLTRB(18, 8, 0, 0),
                  child: Text(
                    "Top Friend Planter",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 28),
                    textAlign: TextAlign.start,
                  ),
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  padding: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      friends(
                        name: 'Garfield',
                      ),
                      friends(
                        name: 'Greg',
                      ),
                      friends(
                        name: 'Garfield Greg',
                      ),
                      friends(
                        name: 'Garfield',
                      ),
                      friends(
                        name: 'Greg',
                      ),
                      friends(
                        name: 'Garfield Greg',
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      padding: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            message(name: 'Garfield'),
                            message(name: 'Garfield'),
                            message(name: 'Garfield'),
                            message(name: 'Garfield'),
                            message(name: 'Garfield'),
                            message(name: 'Garfield'),
                          ])),
                ),
              ],
            ),
          )),
        ));
  }
}

class friends extends StatelessWidget {
  final name;
  const friends({
    required this.name,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: new ClipRect(
        child: new BackdropFilter(
          filter: new ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
          child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(18),
                  color: Colors.grey.shade200.withOpacity(0.1)),
              width: 100,
              height: 100,
              child: Column(
                children: [
                  SizedBox(height: 20),
                  CircleAvatar(
                    radius: 25, // Image radius
                    backgroundImage: AssetImage('assets/gradpic.jpeg'),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Text(
                      '$name',
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              )),
        ),
      ),
    );
  }
}

class message extends StatelessWidget {
  final name;
  const message({
    required this.name,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: new ClipRect(
        child: new BackdropFilter(
          filter: new ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
          child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(18),
                  color: Colors.grey.shade300.withOpacity(0.2)),
              width: 700,
              height: 100,
              child: Row(
                children: [
                  SizedBox(width: 20),
                  CircleAvatar(
                    radius: 25, // Image radius
                    backgroundImage: AssetImage('assets/gradpic.jpeg'),
                  ),
                  SizedBox(width: 20),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 30,
                      ),
                      Text(
                        '$name',
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                        textAlign: TextAlign.left,
                      ),
                      Text(
                        'New chat! Tap to view',
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                  SizedBox(width: 300),
                  Icon(
                    Icons.message_rounded,
                    color: Colors.white,
                  ),
                ],
              )),
        ),
      ),
    );
  }
}

class ToDoItem extends StatelessWidget {
  const ToDoItem({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(bottom: 20),
        child: ListTile(
          onTap: () {},
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(0),
          ),
          contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
          tileColor: Color(0xFFbda476),
          leading: Icon(
            Icons.check_box_outline_blank,
            color: Style.btngreen,
          ),
          title: Text(
            "Riddle",
            style: TextStyle(
              fontSize: 18,
              color: Colors.white,
              decoration: TextDecoration.lineThrough,
              fontFamily: 'Louis',
              fontWeight: FontWeight.w200,
            ),
          ),
          trailing: Container(
              padding: EdgeInsets.all(0),
              margin: EdgeInsets.symmetric(vertical: 12),
              height: 35,
              width: 35,
              decoration: BoxDecoration(
                  color: Style.btngreen,
                  borderRadius: BorderRadius.circular(0)),
              child: IconButton(
                color: Colors.white,
                iconSize: 18,
                icon: Icon(Icons.delete),
                onPressed: () {},
              )),
        ));
  }
}

Widget searchBox() {
  return Container(
    width: 510,
    padding: EdgeInsets.symmetric(horizontal: 15),
    decoration: BoxDecoration(
        color: Colors.white.withOpacity(.5),
        borderRadius: BorderRadius.circular(18)),
    child: TextField(
      decoration: InputDecoration(
        contentPadding: EdgeInsets.all(0),
        prefixIcon: Icon(
          Icons.search,
          color: Style.btngreen,
          size: 20,
        ),
        prefixIconConstraints: BoxConstraints(maxHeight: 20, minWidth: 25),
        border: InputBorder.none,
        hintText: ' ',
        hintStyle: TextStyle(color: Style.btngreen),
      ),
    ),
  );
}

AppBar _buildAppBar() {
  return AppBar(
    automaticallyImplyLeading: false,
    backgroundColor: Colors.transparent,
    elevation: 0,
    title: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
      Container(
          height: 60,
          width: 310,
          child: Text(
            "Chat",
            style: TextStyle(fontSize: 50, color: Colors.white),
          ) /*ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset('assets/wtp_png.png'))*/
          )
    ]),
  );
}
