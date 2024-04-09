import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../LoginPage/loginpage.dart';
import 'Del_framework.dart';
import 'IndAnnouncements.dart';
import 'info.dart';

class HomePage extends StatefulWidget {
  final String name;
  final String email;
  HomePage({
    Key? key,
    required this.name,
    required this.email,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _HomePage();
}

class _HomePage extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const ScrollPhysics(),
      shrinkWrap: true,
      children: [
        // Container(
        //   height: MediaQuery.of(context).size.height / 25,
        // ),
        // Row(
        //   children: [
        //     SizedBox(
        //       width: 20,
        //     ),
        //     Container(
        //       height: MediaQuery.of(context).size.height / 20,
        //       child: Text(
        //         "Hello " + widget.name + ",",
        //         style: TextStyle(
        //             color: Colors.white, fontSize: 28, fontFamily: 'Lato'),
        //       ),
        //     ),
        //   ],
        // ),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(35),
            color: Colors.brown[900]?.withOpacity(0.8),
          ),
          height: MediaQuery.of(context).size.height / 1.5,
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
          child: ListView(
            physics: const ScrollPhysics(),
            shrinkWrap: true,
            children: [
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 35,
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height / 20,
                    child: Text(
                      "Announcements",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontFamily: 'Lato'),
                    ),
                  ),
                ],
              ),
              Announcements(),
            ],
          ),
        ),
      ],
    );
  }
}
