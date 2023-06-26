import 'dart:math';

import 'package:flutter/material.dart';
import 'package:trendwave/widgets/news/news_card.dart';
import 'package:trendwave/services/news_service.dart';
import 'package:trendwave/models/news.dart';

import '../utils/country_selector.dart';
import 'news/all_news.dart';

class CountryNews extends StatefulWidget {
  const CountryNews({Key? key}) : super(key: key);

  @override
  _CountryNewsState createState() => _CountryNewsState();
}

class _CountryNewsState extends State<CountryNews> {
  late Future<News> newsData;
  late String selectedCountryCode;
  late String title =
      "News from ${countryList.firstWhere((country) => country["code"] == selectedCountryCode)["name"]}";

  @override
  void initState() {
    super.initState();
    selectedCountryCode = _getRandomCountryCode();
    newsData = fetchNewsDataByCountry(
      selectedCountryCode,
      limit: 10,
    );
  }

  String _getRandomCountryCode() {
    final random = Random();
    final randomIndex = random.nextInt(countryList.length);
    return countryList[randomIndex]["code"]!;
  }

  void _navigateToAllNews() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => AllNews(
          title: title,
          newsData: newsData,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 16.0, bottom: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              GestureDetector(
                onTap: _navigateToAllNews,
                child: const Text(
                  "View all",
                  style: TextStyle(color: Colors.blue),
                ),
              ),
            ],
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(bottom: 18.0),
        ),
        FutureBuilder<News>(
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
                return ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: newsList.length,
                  itemBuilder: (context, index) {
                    return NewsCard(article: newsList[index]);
                  },
                );
              }
            }
          },
        ),
      ],
    );
  }
}
