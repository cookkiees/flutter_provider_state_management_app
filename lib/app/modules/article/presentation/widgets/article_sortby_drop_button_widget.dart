import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/article_procider.dart';

class ArticleSortByDropButtonWidget extends StatefulWidget {
  const ArticleSortByDropButtonWidget({super.key});

  @override
  ArticleSortByDropButtonWidgetState createState() =>
      ArticleSortByDropButtonWidgetState();
}

class ArticleSortByDropButtonWidgetState
    extends State<ArticleSortByDropButtonWidget> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ArticleProvider>(
        builder: (context, articleProvider, child) {
      return DropdownButton<String>(
        elevation: 1,
        dropdownColor: Colors.white,
        underline: const SizedBox.shrink(),
        value: articleProvider.selectedSortBy.name,
        onChanged: (String? newValue) {
          final sortBy = SortBy.values.firstWhere(
            (e) => e.name == newValue,
          );
          articleProvider.onSelectedSortBy = sortBy;
        },
        items: <String>[SortBy.popularity.name, SortBy.publishedAt.name]
            .map((String value) {
          final entri = capitalizeFirstLetter(value);
          return DropdownMenuItem<String>(
            value: value,
            child: Text(
              entri,
              style: const TextStyle(
                color: Colors.black,
              ),
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
