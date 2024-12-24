import 'package:flutter/material.dart';

class DividerWithText extends StatelessWidget {
  final Text text;
  final Divider divider;
  const DividerWithText(
      {Key? key, required this.text, this.divider = const Divider()})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [Expanded(child: divider), text, Expanded(child: divider)],
    );
  }
}
