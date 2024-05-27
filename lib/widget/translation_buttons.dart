import 'package:flutter/material.dart';
import 'package:google_search_clone/widget/language_text.dart';

class TranslationButton extends StatelessWidget {
  const TranslationButton({super.key});

  @override
  Widget build(BuildContext context) {
    return const Wrap(
      alignment: WrapAlignment.center,
      children: [
        Text("Google Offered in:"),
        SizedBox(width: 5),
        LanguageText(title: "Hausa"),
        SizedBox(width: 5),
        LanguageText(title: "Yoruba"),
        SizedBox(width: 5),
        LanguageText(title: "Igbo"),
        SizedBox(width: 5),
        LanguageText(title: "Arabic"),
      ],
    );
  }
}
