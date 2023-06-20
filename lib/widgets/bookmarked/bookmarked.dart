import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Bookmarked extends StatefulWidget {
  const Bookmarked({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _BookmarkedWidgetState createState() => _BookmarkedWidgetState();
}

class _BookmarkedWidgetState extends State<Bookmarked> {
  List<String> bookmarkedNews = []; // List to store bookmarked news

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
          alignment: Alignment.centerLeft, // Align title to the left
          child: Text(
            "Saved Bookmarks",
            style: GoogleFonts.playfairDisplay(
              fontWeight: FontWeight.bold,
              color: Colors.black,
              fontSize: 24,
            ),
          ),
        ),
        actions: [
          Visibility(
            visible: bookmarkedNews.isNotEmpty,
            child: IconButton(
              icon: const Icon(Icons.delete_rounded),
              onPressed: () {
                setState(() {
                  bookmarkedNews.clear();
                });
              },
            ),
          ),
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.sort),
            onPressed: () {},
          ),
        ],
      ),
      body: bookmarkedNews.isNotEmpty
          ? ListView.builder(
              itemCount: bookmarkedNews.length,
              itemBuilder: (context, index) {
                return null;
              },
            )
          : Center(
              child: Text(
                'No bookmarked news',
                style: GoogleFonts.playfairDisplay(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
    );
  }
}
