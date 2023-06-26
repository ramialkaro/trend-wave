import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import '../../models/news.dart';
import '../news_details.dart';

class NewsCard extends StatelessWidget {
  const NewsCard({Key? key, required this.article}) : super(key: key);

  final Article article;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => NewsDetails(article: article),
          ),
        );
      },
      child: Card(
        elevation: 0,
        child: SizedBox(
          height: 100,
          width: MediaQuery.of(context).size.width,
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(14),
                child: Container(
                  width: 100,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(article.image ??
                          'https://images.unsplash.com/photo-1532298229144-0ec0c57515c7?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1122&q=80'),
                      fit: BoxFit.cover,
                      scale: 1.0,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        article.category.toUpperCase(),
                        style: GoogleFonts.playfairDisplay(color: Colors.grey),
                      ),
                      Text(
                        article.title,
                        maxLines: 2,
                        style: GoogleFonts.playfairDisplay(
                          fontSize: 15.0,
                        ),
                      ),
                      const Spacer(),
                      Text(
                        article.author?.toString() ??
                            " ${DateFormat('MMM d, yyyy').format(article.published_at)}",
                        style: GoogleFonts.openSans(color: Colors.grey),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
