import 'package:flutter/material.dart';

import 'LoginPage/start.dart';

class backButton extends StatelessWidget {
  const backButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomLeft,
      child: IconButton(
          padding: EdgeInsets.fromLTRB(20, 0, 0, 40),
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => start()));
          },
          icon: const Icon(Icons.keyboard_double_arrow_left_sharp,
              color: Colors.white, size: 45)),
    );
  }
}
