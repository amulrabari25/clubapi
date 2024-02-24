import 'package:flutter/material.dart';

class TitleWidget extends StatelessWidget {
  final String text;

  const TitleWidget(this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
          color: Colors.black, fontSize: 20, fontWeight: FontWeight.normal),
    );
  }
}
