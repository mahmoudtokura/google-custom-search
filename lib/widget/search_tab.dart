import 'package:flutter/material.dart';
import 'package:google_search_clone/colors.dart';

class SearchTab extends StatelessWidget {
  final IconData icon;
  final bool isActive;
  final String title;
  const SearchTab({
    super.key,
    required this.icon,
    required this.title,
    this.isActive = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 18,
              color: isActive ? blueColor : Colors.grey,
            ),
            const SizedBox(width: 3),
            Text(
              title,
              style: TextStyle(
                fontSize: 15,
                color: isActive ? blueColor : Colors.grey,
              ),
            ),
          ],
        ),
        const SizedBox(width: 7),
        isActive
            ? Container(
                height: 3,
                width: 40,
                color: blueColor,
              )
            : Container(),
      ],
    );
  }
}
