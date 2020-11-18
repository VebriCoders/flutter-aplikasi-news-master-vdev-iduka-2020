import 'dart:ui';

import 'package:flutter/material.dart';

class SearchWidget extends StatelessWidget {
  final TextEditingController editingController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return new Container(
      padding: new EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0),
      margin: const EdgeInsets.only(),
      child: new Material(
        borderRadius: const BorderRadius.all(const Radius.circular(25.0)),
        elevation: 2.0,
        child: new Container(
          height: 45.0,
          margin: new EdgeInsets.only(left: 16.0, right: 16.0),
          child: new Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              new Expanded(
                child: new TextField(
                  maxLength: 1,
                  style: TextStyle(
                      fontSize: 18.0,
                      color: Colors.black,
                      fontWeight: FontWeight.normal),
                  textAlignVertical: TextAlignVertical.center,
                  decoration: InputDecoration(
                      icon: Icon(
                        Icons.search,
                        color: Theme.of(context).accentColor,
                      ),
                      hintText: "Masukkan Keyword.... App By Vebri",
                      hintStyle: TextStyle(
                          fontSize: 14.0,
                          color: Colors.grey[400],
                          fontWeight: FontWeight.normal),
                      border: InputBorder.none),
                  onSubmitted: (query) => onSubmitted(query, context),
                  controller: editingController,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  onSubmitted(String query, BuildContext context) {
    if (query.isEmpty) return;
  }
}
