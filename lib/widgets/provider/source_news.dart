import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../news/all_news.dart';
import 'source_news_card.dart';
import 'package:trendwave/services/news_service.dart';
import 'package:trendwave/models/news.dart';

class SourceNews extends StatefulWidget {
  const SourceNews({Key? key}) : super(key: key);

  @override
  _SourceNewsState createState() => _SourceNewsState();
}

class _SourceNewsState extends State<SourceNews> {
  late Future<News> newsData;
  late String title = "News by CNN";

  @override
  void initState() {
    super.initState();
    newsData = fetchNewsDataBySource('cnn', limit: 4);
  }

  @override
  Widget build(BuildContext context) {
    final controller = PageController();

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        AllNews(title: title, newsData: newsData),
                  ),
                );
              },
              child: const Text(
                "View all",
                style: TextStyle(color: Colors.blue),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        FutureBuilder<News>(
          future: newsData,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else {
              final articles = snapshot.data?.data ?? [];
              final pageCount = articles.length;
              return SizedBox(
                height: 230,
                child: PageView.builder(
                  controller: controller,
                  itemCount: pageCount,
                  itemBuilder: (context, index) {
                    final article = articles[index];
                    return SourceNewsCard(article: article);
                  },
                ),
              );
            }
          },
        ),
        FutureBuilder<News>(
          future: newsData,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const SizedBox();
            } else if (snapshot.hasError) {
              return const SizedBox();
            } else {
              final articles = snapshot.data?.data ?? [];
              final pageCount = articles.length;
              return SmoothPageIndicator(
                controller: controller,
                count: pageCount,
                effect: const ExpandingDotsEffect(
                  activeDotColor: Colors.blueGrey,
                  dotColor: Colors.black12,
                  dotHeight: 10,
                  dotWidth: 10,
                ),
              );
            }
          },
        ),
      ],
    );
  }
}
