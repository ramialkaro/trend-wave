import 'dart:math';
import 'package:flutter/material.dart';
import '../utils/country_selector.dart';
import 'news/all_news.dart';
import 'news/news_card.dart';

class CountryNews extends StatefulWidget {
  const CountryNews({Key? key}) : super(key: key);

  @override
  _CountryNewsState createState() => _CountryNewsState();
}

class _CountryNewsState extends State<CountryNews> {
  late String selectedCountryCode;
  late String title =
      "News from ${countryList.firstWhere((country) => country["code"] == selectedCountryCode)["name"]}";

  @override
  void initState() {
    super.initState();
    selectedCountryCode = _getRandomCountryCode();
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
        FutureBuilder<Widget>(builder: (context, snapshot) {
          return ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: 20,
            itemBuilder: (context, index) {
              return const NewsCard();
            },
          );
        }),
      ],
    );
  }
}
