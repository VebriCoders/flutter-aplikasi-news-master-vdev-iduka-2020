import 'package:flutter/material.dart';
import 'package:news_app_vebri_yusdi_flutter/model/news_model.dart';
import 'dart:async';
import 'dart:io';
import 'package:flutter/services.dart';
import 'package:share/share.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailPage extends StatelessWidget {
  NewsModel data;
  DetailPage(this.data);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(data.title),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.share),
            onPressed: () {
              shareNotice();
            },
            color: Colors.white,
          )
        ],
      ),
      body: new Container(
        margin: new EdgeInsets.all(10.0),
        child: new Material(
          elevation: 4.0,
          borderRadius: new BorderRadius.circular(6.0),
          child: new ListView(
            children: <Widget>[
              new Hero(
                  tag: data.title, child: _getImageNetwork(data.urlToImage)),
              _getBody(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _getImageNetwork(url) {
    try {
      if (url != '') {
        return ClipRRect(
          borderRadius: new BorderRadius.only(
              topLeft: Radius.circular(6.0), topRight: Radius.circular(6.0)),
          child: new Container(
            height: 200.0,
            child: new FadeInImage.assetNetwork(
              placeholder: 'assets/place_holder.jpg',
              image: url,
              fit: BoxFit.cover,
            ),
          ),
        );
      } else {
        return new Container(
          height: 200.0,
          child: new Image.asset('assets/place_holder_3.jpg'),
        );
      }
    } catch (e) {
      return new Container(
        height: 200.0,
        child: new Image.asset('assets/place_holder_3.jpg'),
      );
    }
  }

  Widget _getBody(context) {
    return new Container(
      margin: new EdgeInsets.all(15.0),
      child: new Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          _getTittle(data.title),
          _getDate(data.publishedAt, data.author),
          _getDescription(data.content),
          _getAntLink(),
          _getLink(data.url, context)
        ],
      ),
    );
  }

  Widget _getAntLink() {
    return new Container(
      margin: new EdgeInsets.only(top: 30.0),
      child: new Text(
        "Mais detalhes acesse:",
        style:
            new TextStyle(fontWeight: FontWeight.bold, color: Colors.grey[600]),
      ),
    );
  }

  Widget _getLink(link, context) {
    return new GestureDetector(
      child: new Text(
        link,
        style: new TextStyle(color: Colors.blue),
      ),
      onTap: () {
        _launchURL(link, context);
      },
    );
  }

  _getTittle(tittle) {
    return new Text(
      tittle,
      style: new TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
    );
  }

  _getDate(date, origin) {
    return new Container(
      margin: new EdgeInsets.only(top: 4.0),
      child: new Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          new Text(
            date,
            style: new TextStyle(fontSize: 10.0, color: Colors.grey),
          ),
          new Text(
            origin,
            style: new TextStyle(fontSize: 10.0, color: Colors.grey),
          )
        ],
      ),
    );
  }

  _getDescription(description) {
    return new Container(
      margin: new EdgeInsets.only(top: 20.0),
      child: new Text(description),
    );
  }

  _launchURL(url, context) async {
    if (Platform.isAndroid) {
      if (await canLaunch(url)) {
        await launch(url);
      } else {
        print('Could not launch $url');
      }
    } else {
      Clipboard.setData(new ClipboardData(text: url));
      _showDialog(context);
    }
  }

  Future shareNotice() async {
    await Share.share(data.title);
  }

  void _showDialog(context) {
    // flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          content: new Text("Link Copied"),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            new FlatButton(
              child: new Text("Close"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
