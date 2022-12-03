import 'package:app/screens/temporary_screens.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'style.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  static const _colors = [
    Style.greenNavbar,
    Style.blueNavbar,
    Style.yellowNavbar,
  ];
  int _currentScreen = 2;
  final PageController _pageController = PageController(initialPage: 2);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Style.black,
        body: PageView(
          physics: BouncingScrollPhysics(),
          controller: _pageController,
          onPageChanged: (int index) {
            setState(
              () {
                _currentScreen = index;
              },
            );
          },
          children: <Widget>[
            TemporaryScreen(color: _colors[0]),
            TemporaryScreen(color: _colors[1]),
            TemporaryScreen(color: _colors[2]),
          ],
        ),
        bottomNavigationBar: SizedBox(
          width: 150,
          child: BottomNavigationBar(
            selectedItemColor: _colors[_currentScreen],
            unselectedItemColor: Style.white,
            backgroundColor: Colors.white.withOpacity(0.1),
            type: BottomNavigationBarType.fixed,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            currentIndex: _currentScreen,
            onTap: (int index) {
              _pageController.jumpToPage(index);
            },
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(
                  CupertinoIcons.chat_bubble,
                ),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.phone),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.settings),
                label: '',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
