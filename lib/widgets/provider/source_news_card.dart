import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import '../news_details.dart';

class SourceNewsCard extends StatelessWidget {
  const SourceNewsCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const NewsDetails(),
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(14),
          child: Container(
            height: 240,
            width: 350,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                    'https://images.unsplash.com/photo-1532298229144-0ec0c57515c7?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1122&q=80'),
                fit: BoxFit.cover,
                scale: 1.0,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(14.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    color: Colors.blue,
                    padding: const EdgeInsets.only(left: 8, right: 8),
                    child: Text(
                      "SPORTS",
                      style: GoogleFonts.openSans(
                          fontSize: 14,
                          color: Colors.white,
                          letterSpacing: 1.4,
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                  const SizedBox(
                    height: 90,
                  ),
                  Row(
                    children: [
                      Text(
                        "BBC WORLD - ${DateFormat('MMM d, yyyy').format(DateTime.now())}",
                        style: GoogleFonts.playfairDisplay(
                            color: Colors.white, fontSize: 12),
                      ),
                    ],
                  ),
                  Text(
                    "NEWS FROM BBC",
                    maxLines: 2,
                    style: GoogleFonts.playfairDisplay(
                        fontSize: 18,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
