import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Delegate Home Screens/IndAnnouncements.dart';
import '../LoginPage/loginpage.dart';

class StaffAnnouncements extends StatefulWidget {
  StaffAnnouncements({
    Key? key,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _StaffAnnouncements();
}

class _StaffAnnouncements extends State<StaffAnnouncements> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const ScrollPhysics(),
      shrinkWrap: true,
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(35),
            color: Colors.brown[900]?.withOpacity(0.8),
          ),
          padding: const EdgeInsets.symmetric(vertical: 10),
          height: MediaQuery.of(context).size.height / 1.5,
          width: MediaQuery.of(context).size.width,
          margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
          child: ListView(
            physics: const ScrollPhysics(),
            shrinkWrap: true,
            children: [
              SizedBox(
                height: 35,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 25,
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
