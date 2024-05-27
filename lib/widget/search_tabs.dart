import 'package:flutter/material.dart';
import 'package:google_search_clone/widget/search_tab.dart';

class SearchTabs extends StatelessWidget {
  const SearchTabs({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return const SizedBox(
      height: 55,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          SearchTab(
            icon: Icons.search,
            title: "All",
            isActive: true,
          ),
          SizedBox(
            width: 20,
          ),
          SearchTab(
            icon: Icons.image,
            title: "Images",
            isActive: false,
          ),
          SizedBox(
            width: 20,
          ),
          SearchTab(
            icon: Icons.map,
            title: "Maps",
            isActive: false,
          ),
          SizedBox(
            width: 20,
          ),
          SearchTab(
            icon: Icons.article,
            title: "News",
            isActive: false,
          ),
          SizedBox(
            width: 20,
          ),
          SearchTab(
            icon: Icons.shopping_cart,
            title: "Shopping",
            isActive: false,
          ),
          SizedBox(
            width: 20,
          ),
          SearchTab(
            icon: Icons.more_vert,
            title: "More",
            isActive: false,
          ),
          SizedBox(
            width: 20,
          ),
        ],
      ),
    );
  }
}
