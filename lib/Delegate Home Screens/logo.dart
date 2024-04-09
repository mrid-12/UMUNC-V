import 'package:flutter/material.dart';

class logo extends StatelessWidget {
  logo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(0, 20, 0, 10),
      width: double.infinity,
      height: 50,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/UMV.jpg'),
// colorFilter:
// ColorFilter.mode(Colors.black45, BlendMode.darken),
        ),
      ),
    );
  }
}
