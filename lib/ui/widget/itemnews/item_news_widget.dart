import 'package:flutter/material.dart';
import 'package:news_app_vebri_yusdi_flutter/model/news_model.dart';
import 'package:news_app_vebri_yusdi_flutter/ui/screen/detail/detail_page.dart';

class ItemNewsWidget extends StatelessWidget {
  NewsModel data;
  BuildContext _context;

  ItemNewsWidget(this.data);

  @override
  Widget build(BuildContext context) {
    this._context = context;
    return new GestureDetector(
      onTap: _handleTapUp,
      child: new Container(
        margin: const EdgeInsets.only(
            left: 10.0, right: 10.0, bottom: 5.0, top: 5.0),
        child: new Material(
          borderRadius: new BorderRadius.circular(6.0),
          elevation: 2.0,
          child: _getListTile(),
        ),
      ),
    );
  }

  Widget _getListTile() {
    return new Container(
      height: 95.0,
      child: new Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          new Hero(
            tag: data.title,
            child: _getImgWidget(data.urlToImage),
          ),
          _getColumText(data.title, data.publishedAt, data.description)
        ],
      ),
    );
  }

  _handleTapUp() {
    Navigator.of(_context)
        .push(new MaterialPageRoute(builder: (BuildContext context) {
      return new DetailPage(data);
    }));
  }

  Widget _getColumText(tittle, date, description) {
    return new Expanded(
        child: new Container(
      margin: new EdgeInsets.all(10.0),
      child: new Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          _getTitleWidget(tittle),
          _getDateWidget(date),
          _getDescriptionWidget(description)
        ],
      ),
    ));
  }

  Widget _getImgWidget(String url) {
    return new Container(
      width: 95.0,
      height: 95.0,
      child: new ClipRRect(
        borderRadius: new BorderRadius.only(
            topLeft: const Radius.circular(6.0),
            bottomLeft: const Radius.circular(6.0)),
        child: _getImageNetwork(url),
      ),
    );
  }

  Widget _getImageNetwork(String url) {
    try {
      if (url.isNotEmpty) {
        return new FadeInImage.assetNetwork(
          placeholder: 'assets/place_holder.jpg',
          image: url,
          fit: BoxFit.cover,
        );
      } else {
        return new Image.asset('assets/place_holder.jpg');
      }
    } catch (e) {
      return new Image.asset('assets/place_holder.jpg');
    }
  }

  Text _getTitleWidget(String curencyName) {
    return new Text(
      curencyName,
      maxLines: 1,
      style: new TextStyle(fontWeight: FontWeight.bold),
    );
  }

  Widget _getDescriptionWidget(String description) {
    return new Container(
      margin: new EdgeInsets.only(top: 5.0),
      child: new Text(
        description,
        maxLines: 2,
      ),
    );
  }

  Widget _getDateWidget(String date) {
    return new Text(
      date,
      style: new TextStyle(color: Colors.grey, fontSize: 10.0),
    );
  }
}
