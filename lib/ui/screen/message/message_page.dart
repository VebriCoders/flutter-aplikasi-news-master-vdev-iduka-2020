import 'package:flutter/material.dart';

class MessagePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SafeArea(
          child: Text("My Message"),
        ),
      ),
    );
  }
}
