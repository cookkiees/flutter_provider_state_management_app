import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/article_procider.dart';

class ArticleQueryDropButtonWidget extends StatefulWidget {
  const ArticleQueryDropButtonWidget({super.key});

  @override
  ArticleQueryDropButtonWidgetState createState() =>
      ArticleQueryDropButtonWidgetState();
}

class ArticleQueryDropButtonWidgetState
    extends State<ArticleQueryDropButtonWidget> {
  SortBy selectedSortBy = SortBy.popularity;
  Query selectedQuery = Query.apple;

  @override
  Widget build(BuildContext context) {
    return Consumer<ArticleProvider>(
        builder: (context, articleProvider, child) {
      return DropdownButton<String>(
        elevation: 1,
        dropdownColor: Colors.white,
        underline: const SizedBox.shrink(),
        value: articleProvider.selectedQuery.name,
        onChanged: (String? newValue) {
          final query = Query.values.firstWhere(
            (e) => e.name == newValue,
          );
          articleProvider.onSelectedQuery = query;
        },
        items: <String>[Query.apple.name, Query.tesla.name].map((String value) {
          final entri = capitalizeFirstLetter(value);
          return DropdownMenuItem<String>(
            value: value,
            child: Text(
              entri,
              style: const TextStyle(color: Colors.black),
            ),
          );
        }).toList(),
      );
    });
  }

  String capitalizeFirstLetter(String text) {
    return text[0].toUpperCase() + text.substring(1);
  }
}
