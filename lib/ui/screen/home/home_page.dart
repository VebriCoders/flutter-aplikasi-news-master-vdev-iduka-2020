import 'package:flutter/material.dart';
import 'package:news_app_vebri_yusdi_flutter/model/news_response.dart';
import 'package:news_app_vebri_yusdi_flutter/server/repository/news_repository.dart';
import 'package:news_app_vebri_yusdi_flutter/server/api_exception_mapper.dart';
import 'package:news_app_vebri_yusdi_flutter/ui/widget/search/search_widget.dart';
import 'package:news_app_vebri_yusdi_flutter/ui/widget/itemnews/item_news_widget.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final NewsRepository _newsRepository = NewsRepository();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        SearchWidget(),
        _buildListNews(),
        // Text("ok"),
      ],
    );
  }

  Widget _buildListNews() => Expanded(
        child: FutureBuilder<NewsResponse>(
            future: _newsRepository.getAllNews(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: Container(
                    width: 25,
                    height: 25,
                    child: CircularProgressIndicator(),
                  ),
                );
              } else if (snapshot.hasError) {
                return Text(ApiExceptionMapper.toErrorMessage(snapshot.error));
              } else {
                return ListView(
                    children: snapshot.data.articles.map((news) {
                  return ItemNewsWidget(news);
                }).toList());
              }
            }),
      );
}
