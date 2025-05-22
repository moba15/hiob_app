import 'package:flutter/material.dart';

class SubstringHighlightWidget extends StatelessWidget {
  final RegExp exp;
  final String text;
  final int highlightedGroup;

  const SubstringHighlightWidget(
      {super.key, required this.text, required this.exp, required this.highlightedGroup});

  @override
  Widget build(BuildContext context) {
    RegExpMatch? match = exp.firstMatch(text);
    if (match != null) {
      List<TextSpan> spans = [];
      for (int i = 2; i <= match.groupCount; i++) {
        spans.add(TextSpan(text: match.group(i), style: i == highlightedGroup ? TextStyle(color: Colors.amber) : null));
      }
      return RichText(
        text: TextSpan(text: match.group(1), children: spans),
      );
    }

    return Text(text);
  }
}
