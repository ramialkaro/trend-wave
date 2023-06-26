import 'package:flutter/material.dart';
import 'package:trendwave/models/news.dart';

import 'news_card.dart';

class AllNews extends StatelessWidget {
  AllNews({Key? key, required this.title, required this.newsData})
      : super(key: key);

  final Future<News> newsData;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: FutureBuilder<News>(
        future: newsData,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            final newsList = snapshot.data?.data ?? [];
            if (newsList.isEmpty) {
              return const Center(child: Text('No results found.'));
            } else {
              return SingleChildScrollView(
                child: ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: newsList.length,
                  itemBuilder: (context, index) {
                    return NewsCard(article: newsList[index]);
                  },
                ),
              );
            }
          }
        },
      ),
    );
  }
}
