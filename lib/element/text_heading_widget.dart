import 'package:flutter/material.dart';

class TextHeadingWidget extends StatelessWidget {
  const TextHeadingWidget({
    super.key,
    required this.text,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      maxLines: 3,
      overflow: TextOverflow.ellipsis,
      text,
      style: const TextStyle(
          fontWeight: FontWeight.normal, color: Colors.white, fontSize: 18),
    );
  }
}
