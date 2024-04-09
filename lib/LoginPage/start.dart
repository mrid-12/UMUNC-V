import 'dart:async';
import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project_ideas/LoginPage/dellogin.dart';
import 'package:page_transition/page_transition.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../Delegate Home Screens/Del_framework.dart';
import '../Staff Home Screens/password.dart';
import '../backButton.dart';
import 'loginpage.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: start());
  }
}

class start extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _start();
}

class _start extends State<start> {
  late var email;
  late String name;
  late String useremail;
  late String committee;
  late String position;
  @override
  initState() {
    getdata().whenComplete(
      () async => Timer(
          Duration(milliseconds: 50),
          () => email == null
              ? Navigator.push(
                  context, MaterialPageRoute(builder: (context) => start()))
              : getpushData().whenComplete(() async => Timer(
                    Duration(milliseconds: 50),
                    () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Framework(
                            name: name,
                            email: email,
                            committee: committee,
                            position: position),
                      ),
                    ),
                  ))),
    );
    super.initState();
  }

  Future getdata() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    var givenemail = sharedPreferences.getString('Email');
    setState(() {
      email = givenemail!;
    });
  }

  Future getpushData() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    name = sharedPreferences.getString('Name')!;
    useremail = sharedPreferences.getString('Email')!;
    committee = sharedPreferences.getString('Committee')!;
    position = sharedPreferences.getString('Position')!;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: Colors.black12,
          body: Stack(
            children: [
              Container(
                margin: const EdgeInsets.fromLTRB(0, 0, 0, 50),
                width: double.infinity,
                height: double.infinity,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(
                        'https://images.squarespace-cdn.com/content/v1/5cad22d38155121d32542a28/1586353906658-563KJ674RDSPM2L099Q5/Blank_Black.jpg?format=300w'),
                    colorFilter:
                        ColorFilter.mode(Colors.black45, BlendMode.darken),
                  ),
                ),
              ), // BackGround Image
              Column(
                children: [
                  Container(
                    alignment: Alignment.bottomCenter,
                    padding: const EdgeInsets.fromLTRB(50, 60, 50, 0),
                    height: 150,
                    width: double.infinity,
                    child: const Center(
                      child: Text(
                        'Welcome to',
                        style: TextStyle(
                          fontFamily: 'CrimsonText',
                          fontSize: 55,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ), // 'Welcome To' text
                  Container(
                    alignment: Alignment.topCenter,
                    height: 60,
                    width: double.infinity,
                    child: const Center(
                      child: Text(
                        'UMUNC V',
                        style: TextStyle(
                          fontFamily: 'CrimsonText',
                          fontSize: 50,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ), // 'UMUNC V' text
                ],
              ), // Text at top of screen
              Padding(
                padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).viewInsets.bottom + 55),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      child: Column(
                        children: [
                          Container(
                            height: 55,
                            width: double.infinity,
                            margin: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 8),
                            child: ElevatedButton(
                              style: ButtonStyle(
                                shape: MaterialStateProperty.all(
                                    const RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(15)),
                                )),
                                backgroundColor: MaterialStateProperty.all(
                                  Colors.grey[600]?.withOpacity(0.5),
                                ),
                                shadowColor: MaterialStateProperty.all(
                                  Colors.transparent,
                                ),
                              ),
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => delPassword()));
                              },
                              child: const Text(
                                'Delegate/Attendee',
                                style: TextStyle(
                                  fontFamily: 'CrimsonText',
                                  fontSize: 25,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Column(
                      children: [
                        Container(
                          height: 55,
                          width: double.infinity,
                          margin: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 8),
                          child: ElevatedButton(
                            style: ButtonStyle(
                              shape: MaterialStateProperty.all(
                                  const RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15)),
                              )),
                              backgroundColor: MaterialStateProperty.all(
                                Colors.grey[600]?.withOpacity(0.5),
                              ),
                              shadowColor: MaterialStateProperty.all(
                                Colors.transparent,
                              ),
                            ),
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Password()));
                            },
                            child: const Text(
                              'UMUNC Staff',
                              style: TextStyle(
                                fontFamily: 'CrimsonText',
                                fontSize: 25,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 60,
                    ), //Spacing between button and textBoxes
                    //Registration form completion
                  ], // Registration block
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
