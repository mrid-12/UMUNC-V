import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../Delegate Home Screens/info.dart';
import '../backButton.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});
  @override
  State<StatefulWidget> createState() => _WelcomeScreen();
}

class _WelcomeScreen extends State<WelcomeScreen> {
  final name = TextEditingController();
  final email = TextEditingController();
  late bool result = false;

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
                            margin: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 8),
                            decoration: BoxDecoration(
                              color: Colors.grey[600]?.withOpacity(0.5),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: TextField(
                              controller: name,
                              textInputAction: TextInputAction.next,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                              ),
                              textAlign: TextAlign.left,
                              decoration: const InputDecoration(
                                contentPadding: EdgeInsets.all(15),
                                border: InputBorder.none,
                                hintStyle: TextStyle(color: Colors.white),
                                hintText: 'Name: ',
                                prefixIcon: Icon(Icons.account_box_rounded,
                                    size: 30, color: Colors.white),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Column(
                      children: [
                        Container(
                          margin: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 8),
                          decoration: BoxDecoration(
                            color: Colors.grey[600]?.withOpacity(0.5),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: TextField(
                            controller: email,
                            textInputAction: TextInputAction.done,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                            ),
                            textAlign: TextAlign.left,
                            decoration: const InputDecoration(
                              contentPadding: EdgeInsets.all(15),
                              border: InputBorder.none,
                              hintStyle: TextStyle(color: Colors.white),
                              hintText: 'Email: ',
                              prefixIcon: Icon(Icons.mail_outline_sharp,
                                  size: 30, color: Colors.white),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ), //Spacing between button and textBoxes
                    FilledButton(
                      onPressed: () async {
                        // Map<String, String> userData = {
                        //   'name:': name.text,
                        //   'email': email.text,
                        // };
                        // FirebaseFirestore.instance
                        //     .collection('Users')
                        //     .doc('Committee 1')
                        //     .set(userData);
                        if (email.text.length < 11 ||
                            email.text.substring(email.text.length - 10) !=
                                "@gmail.com") {
                          Fluttertoast.showToast(msg: "Invalid email address");
                        } else {
                          //sendOTP();
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DelegateInfo(
                                  name: name.text, email: email.text),
                            ),
                          );
                          // Navigator.push(
                          //   context,
                          //   MaterialPageRoute(
                          //     builder: (context) =>
                          //         // DelegateInfo(
                          //         // name: name.text, email: email.text),
                          //
                          //         OTPVerify(
                          //       name: name.text,
                          //       email: email.text,
                          //       auth: myauth,
                          //     ),
                          //   ),
                          // );
                        }
                      },
                      child: const Text(
                        'Register',
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                    ), //Registration form completion
                  ], // Registration block
                ),
              ),
              backButton(),
            ],
          ),
        ),
      ),
    );
  }
}
