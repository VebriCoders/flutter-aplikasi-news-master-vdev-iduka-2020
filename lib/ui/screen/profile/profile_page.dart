import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfiePageState createState() => _ProfiePageState();
}

class _ProfiePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SafeArea(
          child: Text("My Profile"),
        ),
      ),
    );
  }
}
