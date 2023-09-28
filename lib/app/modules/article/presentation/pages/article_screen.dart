import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../../../config/routes/my_routes.dart';
import '../../domain/entities/article_data_entity.dart';
import '../provider/article_procider.dart';
import '../widgets/article_query_drop_button_widget.dart';
import '../widgets/article_sortby_drop_button_widget.dart';

class ArticleScreen extends StatelessWidget {
  const ArticleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "A R T I C L E",
          style: TextStyle(fontWeight: FontWeight.w500),
        ),
        bottom: PreferredSize(
          preferredSize: const Size(double.infinity, kToolbarHeight),
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: const Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                ArticleSortByDropButtonWidget(),
                ArticleQueryDropButtonWidget(),
              ],
            ),
          ),
        ),
      ),
      body: buildUserWithFutureBuilder(),
    );
  }

  Widget buildUserWithFutureBuilder() {
    return Consumer<ArticleProvider>(
      builder: (_, userProvider, child) {
        var sortBy = userProvider.selectedSortBy.name;
        var query = userProvider.selectedQuery.name;
        return FutureBuilder<List<ArticleDataEntity>>(
          future: userProvider.handleArticleFuture(sortBy, query),
          builder: (_, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CupertinoActivityIndicator());
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return const Text('No Article found.');
            } else {
              final articleList = snapshot.data;
              return ListView.builder(
                itemCount: articleList?.length,
                padding: const EdgeInsets.symmetric(horizontal: 12),
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  final article = articleList?[index];
                  return InkWell(
                    onTap: () {
                      context.goNamed(
                        MyRoutes.articleDetail,
                        pathParameters: {'author': "${article?.author}"},
                        extra: article,
                      );
                    },
                    child: _buildCardArticle(article),
                  );
                },
              );
            }
          },
        );
      },
    );
  }

  Card _buildCardArticle(ArticleDataEntity? article) {
    String time = '';
    if (article?.publishedAt != null) {
      DateTime dateTime = DateTime.parse("${article?.publishedAt}");
      String month = DateFormat('MMMM').format(dateTime);
      int years = dateTime.year;
      int day = dateTime.day;
      time = '$day $month $years ';
    }

    return Card(
      child: Container(
        height: 100,
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(6),
              child: Image.network(
                "${article?.urlToImage}",
                width: 80,
                height: double.infinity,
                fit: BoxFit.cover,
                loadingBuilder: (context, child, event) => child,
                errorBuilder: (context, type, stack) {
                  return Container(
                    height: double.infinity,
                    width: 80,
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: const Icon(
                      Icons.image_outlined,
                      size: 44.0,
                      color: Colors.white,
                    ),
                  );
                },
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '${article?.source?.name}',
                    maxLines: 1,
                    style: const TextStyle(
                      fontSize: 10,
                      color: Colors.red,
                    ),
                  ),
                  Text(
                    '${article?.title}',
                    maxLines: 2,
                    style: const TextStyle(
                      fontSize: 12,
                      color: Colors.black,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Text(
                    time,
                    maxLines: 1,
                    style: const TextStyle(
                      fontSize: 10,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
