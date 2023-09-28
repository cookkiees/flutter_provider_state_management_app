import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

import '../../domain/entities/article_data_entity.dart';

class ArticleDetailScreen extends StatelessWidget {
  const ArticleDetailScreen({super.key, this.article});

  final ArticleDataEntity? article;
  @override
  Widget build(BuildContext context) {
    String time = '';
    if (article?.publishedAt != null) {
      DateTime dateTime = DateTime.parse("${article?.publishedAt}");
      String month = DateFormat('MMMM').format(dateTime);

      int day = dateTime.day;
      time = '$month $day';
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "${article?.source?.name}",
          style: const TextStyle(
            color: Colors.red,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.bookmark_outline,
              size: 24.0,
            ),
          )
        ],
        leading: IconButton(
          onPressed: () => context.pop(),
          icon: const Icon(
            Icons.arrow_back,
            size: 24.0,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '${article?.title}',
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 12),
              Text(
                '${article?.author} • $time',
                style: const TextStyle(
                  fontSize: 12,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(height: 16),
              ClipRRect(
                borderRadius: BorderRadius.circular(6),
                child: Image.network(
                  "${article?.urlToImage}",
                  width: double.infinity,
                  height: 200,
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
              const SizedBox(height: 16),
              Text(
                '${article?.description}',
                style: const TextStyle(
                  fontSize: 15,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 16),
              Text(
                '${article?.url}',
                style: const TextStyle(
                  fontSize: 12,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
