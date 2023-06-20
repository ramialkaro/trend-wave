import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:trendwave/widgets/country_news.dart';
import '../widgets/provider/source_news.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
          alignment: Alignment.centerLeft,
          child: ShaderMask(
            shaderCallback: (Rect bounds) {
              return const LinearGradient(
                colors: [Colors.pink, Colors.purple, Colors.red, Colors.cyan],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ).createShader(bounds);
            },
            child: Text(
              "Trend Wave",
              style: GoogleFonts.caveat(
                fontSize: 34,
                color: Colors.white,
              ),
            ),
          ),
        ),
        actions: [
          Container(
            alignment: Alignment.centerRight,
            child: IconButton(
              icon: const Icon(Icons.search),
              onPressed: () {},
            ),
          ),
        ],
      ),
      body: const Padding(
        padding: EdgeInsets.all(14.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SourceNews(),
              CountryNews(),
            ],
          ),
        ),
      ),
    );
  }
}
