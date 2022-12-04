import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<Settings> {
  bool valNotify1 = false;

  OnChangedFunction1(bool newValue1) {
    setState(() {
      valNotify1 = newValue1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/wtp_bg.png'), fit: BoxFit.cover),
      ),
      child: Stack(
        children: [
          Positioned(
            top: 71,
            left: 30,
            child: Row(
              children: [
                Icon(
                  Icons.settings,
                  size: 50,
                  color: Colors.white,
                ),
                SizedBox(width: 10),
                Text(
                  'Settings',
                  style: TextStyle(fontSize: 55, color: Colors.white),
                ),
              ],
            ),
          ),
          Positioned(
            left: 23,
            top: 140,
            child: Container(
              width: 555,
              height: 650,
              decoration: BoxDecoration(
                  color: Colors.black26,
                  borderRadius: BorderRadius.all(Radius.circular(20))),
              child: Column(children: [
                Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.fromLTRB(10, 10, 0, 10),
                      child: Container(
                        height: 65,
                        width: 65,
                        margin: const EdgeInsets.symmetric(horizontal: 20),
                        decoration: BoxDecoration(
                          image: const DecorationImage(
                              image: AssetImage("assets/user.jpg"),
                              fit: BoxFit.scaleDown),
                          color: const Color(0xFFC4C4C4),
                          border: Border.all(
                            color: const Color(0xFFECFF0F),
                            width: 5,
                          ),
                          borderRadius: BorderRadius.circular(100),
                        ),
                      ),
                    ),
                    Text(
                      'Garfield Greg V. Lim',
                      style: TextStyle(fontSize: 30, color: Colors.white),
                    ),
                  ],
                ),
                Divider(
                  color: Colors.white,
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 15, 320, 0),
                  child: Text(
                    'Account Settings',
                    style: TextStyle(fontSize: 30, color: Colors.white),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                buildAccountOption(context, 'Edit Profile'),
                buildAccountOption(context, 'Change Password'),
                buildAccountOption(context, 'Content Settings'),
                buildAccountOption(context, 'Friends'),
                buildAccountOption(context, 'Privacy and Security'),
                buildNotificationOption(
                    'Push Notifications', valNotify1, OnChangedFunction1),
              ]),
            ),
          ),
        ],
      ),
    );
  }

  Padding buildNotificationOption(
      String title, bool value, Function onChangedMethod) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 21),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 25,
              color: Colors.white,
            ),
          ),
          Transform.scale(
            scale: 1,
            child: CupertinoSwitch(
              activeColor: Colors.green,
              trackColor: Colors.grey,
              value: value,
              onChanged: (bool newValue) {
                onChangedMethod(newValue);
              },
            ),
          )
        ],
      ),
    );
  }

  GestureDetector buildAccountOption(BuildContext context, String title) {
    return GestureDetector(
      onTap: () {},
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 21),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: TextStyle(fontSize: 25, color: Colors.white),
            ),
            Icon(
              Icons.arrow_forward_ios,
              color: Color(0xff4B4B4B),
            ),
          ],
        ),
      ),
    );
  }
}
