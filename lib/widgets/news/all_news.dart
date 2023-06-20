import 'package:flutter/material.dart';

import 'news_card.dart';

class AllNews extends StatelessWidget {
  AllNews({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: FutureBuilder<Widget>(
        builder: (context, snapshot) {
          return SingleChildScrollView(
            child: ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 20,
              itemBuilder: (context, index) {
                return const NewsCard();
              },
            ),
          );
        },
      ),
    );
  }
}
