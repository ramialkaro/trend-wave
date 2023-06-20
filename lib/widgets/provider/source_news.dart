import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../news/all_news.dart';
import 'source_news_card.dart';

class SourceNews extends StatefulWidget {
  const SourceNews({Key? key}) : super(key: key);

  @override
  _SourceNewsState createState() => _SourceNewsState();
}

class _SourceNewsState extends State<SourceNews> {
  late String title = "News by CNN";

  @override
  void initState() {
    super.initState();
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
                    builder: (context) => AllNews(title: title),
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
        FutureBuilder<Widget>(
          builder: (context, snapshot) {
            return SizedBox(
              height: 230,
              child: PageView.builder(
                controller: controller,
                itemCount: 6,
                itemBuilder: (context, index) {
                  return const SourceNewsCard();
                },
              ),
            );
          },
        ),
        FutureBuilder<Widget>(
          builder: (context, snapshot) {
            return SmoothPageIndicator(
              controller: controller,
              count: 6,
              effect: const ExpandingDotsEffect(
                activeDotColor: Colors.blueGrey,
                dotColor: Colors.black12,
                dotHeight: 10,
                dotWidth: 10,
              ),
            );
          },
        ),
      ],
    );
  }
}
