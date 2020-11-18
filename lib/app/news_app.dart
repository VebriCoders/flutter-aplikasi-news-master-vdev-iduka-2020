import 'package:flutter/material.dart';
import 'package:news_app_vebri_yusdi_flutter/ui/screen/main_page.dart';
import 'package:news_app_vebri_yusdi_flutter/app/app_theme.dart';

class NewsApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "News App - Vebri Pradana",
      theme: AppThemeDataFactory.prepareThemeData(),
      home: MainPage(title: 'News App - Vebri Pradana'),
    );
  }
}
