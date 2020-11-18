import 'package:flutter/material.dart';
import 'package:news_app_vebri_yusdi_flutter/ui/screen/message/message_page.dart';
import 'package:news_app_vebri_yusdi_flutter/ui/screen/profile/profile_page.dart';
import 'package:news_app_vebri_yusdi_flutter/ui/screen/home/home_page.dart';

class MainPage extends StatefulWidget {
  MainPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _currentIndex = 0;

  final List<Widget> _childrenWidget = [
    HomePage(),
    MessagePage(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        onTap: _onTabTapped, //new
        currentIndex: _currentIndex, //new
        items: [
          BottomNavigationBarItem(
            icon: new Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: new Icon(Icons.mail),
            label: "Message",
          ),
          BottomNavigationBarItem(
            icon: new Icon(Icons.person),
            label: "Profile",
          ),
        ],
      ),
      body: SafeArea(
        child: _childrenWidget[_currentIndex],
      ),
    );
  }

  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}
