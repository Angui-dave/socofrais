import 'package:flutter/material.dart';

class PrincipalButon extends StatelessWidget {
  final String title;
  final String color;
  final String width;
  final Function()? onPressed;

  const PrincipalButon(
      {super.key,
      required this.title,
      required this.color,
      required this.width,
      this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.black),
    );
  }
}
