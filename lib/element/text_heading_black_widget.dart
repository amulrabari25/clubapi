import 'package:flutter/material.dart';

class TextHeadingBlackWidget extends StatelessWidget {
  const TextHeadingBlackWidget({
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
          fontWeight: FontWeight.normal, color: Colors.black, fontSize: 16),
    );
  }
}
