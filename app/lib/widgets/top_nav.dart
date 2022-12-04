import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TopBar extends StatelessWidget {
  const TopBar({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          top: 45,
          left: 85,
          child: Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Color(0xff127C56).withOpacity(0.5),
            ),
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: Image.asset('assets/profile.png'),
            ),
          ),
        ),
        Positioned(
          top: 40,
          left: 470,
          child: Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Color(0xff127C56).withOpacity(0.5),
            ),
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: Image.asset('assets/badge.png'),
            ),
          ),
        ),
      ],
    );
  }
}
