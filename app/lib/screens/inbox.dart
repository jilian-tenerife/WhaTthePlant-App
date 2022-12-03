import 'package:flutter/material.dart';
import 'package:app/style.dart';

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
              children: [
                Text("Chats"),
                searchBox(),
                Text("Top Friend Planter"),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  padding: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        color: Style.inputgreen,
                        width: 100,
                        height: 100,
                      ),
                      Container(
                        color: Style.btngreen,
                        width: 100,
                        height: 100,
                      ),
                      Container(
                        color: Style.inputgreen,
                        width: 100,
                        height: 100,
                      ),
                      Container(
                        color: Style.btngreen,
                        width: 100,
                        height: 100,
                      ),
                      Container(
                        color: Style.inputgreen,
                        width: 100,
                        height: 100,
                      )
                    ],
                  ),
                ),
                SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    padding: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ToDoItem(),
                          ToDoItem(),
                          ToDoItem(),
                          ToDoItem(),
                          ToDoItem(),
                          ToDoItem(),
                          ToDoItem(),
                        ]))
              ],
            ),
          )),
        ));
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
    padding: EdgeInsets.symmetric(horizontal: 15),
    decoration: BoxDecoration(
        color: Colors.white, borderRadius: BorderRadius.circular(0)),
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
        hintText: 'Gipangita?',
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
    title: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      Container(
          height: 50,
          width: 310,
          child: Text(
            "chat",
            style: TextStyle(fontSize: 50, color: Colors.white),
          ) /*ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset('assets/wtp_png.png'))*/
          )
    ]),
  );
}
