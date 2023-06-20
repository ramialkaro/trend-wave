import 'package:flutter/material.dart';

import '../widgets/bookmarked/bookmarked.dart';

class BookmarkedScreen extends StatefulWidget {
  const BookmarkedScreen({Key? key}) : super(key: key);

  @override
  _BookmarkedState createState() => _BookmarkedState();
}

class _BookmarkedState extends State<BookmarkedScreen> {
  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(
        left: 16,
        right: 16,
        bottom: 16,
      ),
      child: Bookmarked(),
    );
  }
}
