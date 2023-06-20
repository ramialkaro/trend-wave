import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../news/news_card.dart';

class DiscoverWrapper extends StatefulWidget {
  DiscoverWrapper({Key? key}) : super(key: key);

  @override
  State<DiscoverWrapper> createState() => _DiscoverWrapperState();
}

class _DiscoverWrapperState extends State<DiscoverWrapper> {
  final List<String> filterOptions = [
    'General',
    'Sports',
    'Business',
    'Entertainment',
    'Health',
    'Science',
    'Technology',
  ];

  String? selectedFilter;
  String? searchQuery;

  @override
  void initState() {
    super.initState();
  }

  Future<void> filterByCategory(String category) async {
    setState(() {
      selectedFilter = category;
    });
  }

  Future<void> filterByByQuery(String query) async {
    setState(() {
      searchQuery = query;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(''),
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          left: 16,
          right: 16,
          bottom: 16,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Discover',
              style: GoogleFonts.playfairDisplay(
                fontSize: 40,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8.0),
            Text(
              'News Everyday',
              style: GoogleFonts.playfairDisplay(
                fontSize: 16.0,
              ),
            ),
            const SizedBox(height: 16.0),
            TextField(
              onChanged: (value) {
                filterByByQuery(value);
              },
              decoration: InputDecoration(
                hintText: 'Search',
                prefixIcon: const Icon(Icons.search),
                suffixIcon: searchQuery != null
                    ? IconButton(
                        icon: const Icon(Icons.clear),
                        onPressed: () {
                          setState(() {
                            searchQuery = null;
                          });
                        },
                      )
                    : null,
                filled: true,
                fillColor: Colors.grey[200],
                border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(40.0),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16.0),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: filterOptions.map((filter) {
                  final isSelected = selectedFilter == filter;
                  return Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: FilterChip(
                      backgroundColor:
                          isSelected ? Colors.blue : Colors.grey[200],
                      label: Text(filter),
                      onSelected: (_) {
                        if (isSelected) {
                          filterByCategory('General');
                        } else {
                          filterByCategory(filter);
                        }
                      },
                    ),
                  );
                }).toList(),
              ),
            ),
            const SizedBox(height: 16.0),
            Expanded(
              child: FutureBuilder<Widget>(
                builder: (context, snapshot) {
                  return ListView.builder(
                    itemCount: 14,
                    itemBuilder: (context, index) {
                      return const NewsCard();
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
