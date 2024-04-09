import 'package:flutter/material.dart';

class Separator extends StatelessWidget {
  const Separator({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 18, horizontal: 20),
      height: 3,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        color: Colors.white54,
      ),
    );
  }
}
