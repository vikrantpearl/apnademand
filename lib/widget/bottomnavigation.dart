import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../mainpage/mainscreen.dart';
import '../screen/chatscreen/chatscreen.dart';


class BottomNavigation extends StatefulWidget {
  const BottomNavigation({Key? key}) : super(key: key);

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  int _currentIndex = 0;

  final widgetOptions=[
    LoadingListPage(),
    ChatScreen(),
    ChatScreen(),
    ChatScreen(),
    ChatScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Color(0xFFFFFFFF),
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.black.withOpacity(.60),
        selectedFontSize: 14,
        unselectedFontSize: 14,
        onTap: (newIndex) => setState(() => _currentIndex = newIndex),
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(

            label: 'Home',
            icon: Expanded(child: SvgPicture.asset("assets/svg/home.svg")),
          ),
          BottomNavigationBarItem(
            label: 'Music',
            icon: Expanded(child: SvgPicture.asset("assets/svg/fi_grid.svg")),
          ),
          BottomNavigationBarItem(
              label: 'Places',
              icon: Expanded(
                  child: SvgPicture.asset("assets/svg/notifications.svg"))),
          BottomNavigationBarItem(
            label: 'News',
            icon: Expanded(child: SvgPicture.asset("assets/svg/cart.svg")),
          ),
          BottomNavigationBarItem(
            label: 'News',
            icon: Expanded(child: SvgPicture.asset("assets/svg/profile.svg")),
          ),
        ],
      ),
        body: Center(
        child: widgetOptions.elementAt(_currentIndex),
    ),
    );
  }
}
