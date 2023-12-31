import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:trendwave/models/news.dart';

class NewsDetails extends StatelessWidget {
  const NewsDetails({Key? key, required this.article}) : super(key: key);

  final Article article;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            leading: Container(
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Color.fromARGB(168, 238, 238, 238),
              ),
              child: IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
            actions: [
              Container(
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color.fromARGB(168, 238, 238, 238),
                ),
                child: IconButton(
                  icon: const Icon(Icons.bookmark_border),
                  onPressed: () {},
                ),
              ),
            ],
            backgroundColor: Colors.transparent,
            elevation: 0.0,
            expandedHeight: 400.0,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.network(
                article.image ??
                    "https://images.unsplash.com/photo-1496147539180-13929f8aa03a?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2340&q=80",
                fit: BoxFit.cover,
              ),
              title: Text(
                article.title,
                style: GoogleFonts.playfairDisplay(fontWeight: FontWeight.bold),
              ),
              centerTitle: false,
              expandedTitleScale: 1.2,
              titlePadding: const EdgeInsets.all(10),
            ),
            pinned: false,
            floating: false,
            snap: false,
          ),
          SliverToBoxAdapter(
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(16.0),
                topRight: Radius.circular(16.0),
              ),
              child: Container(
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(children: [
                        Text(
                          "${article.category.toUpperCase()} ",
                          style: GoogleFonts.playfairDisplay(
                            fontSize: 24.0,
                          ),
                        ),
                        Text(
                          DateFormat('MMM d, yyyy')
                              .format(article.published_at),
                          style: GoogleFonts.playfairDisplay(
                            color: Colors.grey,
                          ),
                        )
                      ]),
                      const SizedBox(height: 16.0),
                      Row(
                        children: [
                          const CircleAvatar(
                            backgroundImage: NetworkImage(
                              "https://images.unsplash.com/photo-1496147539180-13929f8aa03a?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2340&q=80",
                            ),
                          ),
                          const SizedBox(width: 8.0),
                          Text(
                            article.source!.toUpperCase(),
                            style: GoogleFonts.playfairDisplay(
                              fontWeight: FontWeight.bold,
                              letterSpacing: 2,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16.0),
                      Text(
                        article.description ?? '',
                        style: GoogleFonts.openSans(
                          fontSize: 16.0,
                        ),
                      ),
                      const SizedBox(height: 50.0),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
