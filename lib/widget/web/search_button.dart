import 'package:flutter/material.dart';
import 'package:google_search_clone/colors.dart';

class SearchButton extends StatelessWidget {
  final String title;
  const SearchButton({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 18),
      color: searchColor,
      elevation: 0,
      onPressed: () {},
      child: Text(title),
    );
  }
}
