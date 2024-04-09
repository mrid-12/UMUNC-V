import 'package:email_otp/email_otp.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../LoginPage/loginpage.dart';
import 'info.dart';

class OTPVerify extends StatefulWidget {
  final String name;
  final String email;
  final EmailOTP auth;
  OTPVerify({
    Key? key,
    required this.name,
    required this.email,
    required this.auth,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _OTPVerify();
}

class _OTPVerify extends State<OTPVerify> {
  TextEditingController first = TextEditingController();
  TextEditingController second = TextEditingController();
  TextEditingController third = TextEditingController();
  TextEditingController fourth = TextEditingController();
  FocusNode firstFocus = FocusNode();
  FocusNode secondFocus = FocusNode();
  FocusNode thirdFocus = FocusNode();
  FocusNode fourthFocus = FocusNode();

  Future<bool> verify() async {
    return widget.auth
        .verifyOTP(otp: first.text + second.text + third.text + fourth.text);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: Colors.grey[900],
          body: Stack(
            children: [
              // Expanded(
              //   child: Container(
              //     color: Colors.black87,
              //   ),
              // ),
              Column(
                children: [
                  const Center(
                    child: Image(
                      width: 350,
                      image: AssetImage(
                        "assets/OTP Screen Image.png",
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Text(
                    "Check your email for an OTP !",
                    style: TextStyle(
                      fontFamily: 'CrimsonText',
                      fontSize: 28,
                      color: Colors.green[400],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 100,
              ),
              Padding(
                padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).viewInsets.bottom + 100),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.black45,
                            borderRadius: BorderRadius.circular(15),
                          ),
                          margin: const EdgeInsets.symmetric(
                              horizontal: 5, vertical: 8),
                          width: 60,
                          height: 60,
                          child: Center(
                            child: TextField(
                                controller: first,
                                keyboardType: TextInputType.number,
                                focusNode: firstFocus,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 35,
                                ),
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  contentPadding: EdgeInsets.all(9),
                                ),
                                onChanged: (value) {
                                  if (value.length == 1) {
                                    firstFocus.nextFocus();
                                  } else if (value.length > 1) {
                                    second.text = value[1];
                                    first.text = value[0];
                                    firstFocus.nextFocus();
                                  }
                                }),
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.black45,
                            borderRadius: BorderRadius.circular(15),
                          ),
                          margin: const EdgeInsets.symmetric(
                              horizontal: 5, vertical: 8),
                          width: 60,
                          height: 60,
                          child: Center(
                            child: TextField(
                                controller: second,
                                keyboardType: TextInputType.number,
                                focusNode: secondFocus,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 35,
                                ),
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  contentPadding: EdgeInsets.all(9),
                                ),
                                onChanged: (value) {
                                  if (value.length == 1) {
                                    secondFocus.nextFocus();
                                  } else if (value.isEmpty) {
                                    secondFocus.previousFocus();
                                  } else if (value.length > 1) {
                                    third.text = value[1];
                                    second.text = value[0];
                                    secondFocus.nextFocus();
                                  }
                                }),
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.black45,
                            borderRadius: BorderRadius.circular(15),
                          ),
                          margin: const EdgeInsets.symmetric(
                              horizontal: 5, vertical: 8),
                          width: 60,
                          height: 60,
                          child: Center(
                            child: TextField(
                              controller: third,
                              keyboardType: TextInputType.number,
                              focusNode: thirdFocus,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 35,
                              ),
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                contentPadding: EdgeInsets.all(9),
                              ),
                              onChanged: (value) {
                                if (value.length == 1) {
                                  thirdFocus.nextFocus();
                                } else if (value.isEmpty) {
                                  thirdFocus.previousFocus();
                                } else if (value.length > 1) {
                                  fourth.text = value[1];
                                  third.text = value[0];
                                  thirdFocus.nextFocus();
                                }
                              },
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.black45,
                            borderRadius: BorderRadius.circular(15),
                          ),
                          margin: const EdgeInsets.symmetric(
                              horizontal: 5, vertical: 8),
                          width: 60,
                          height: 60,
                          child: Center(
                            child: TextField(
                              controller: fourth,
                              keyboardType: TextInputType.number,
                              focusNode: fourthFocus,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 35,
                              ),
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                contentPadding: EdgeInsets.all(9),
                              ),
                              onChanged: (value) {
                                if (value.length == 0) {
                                  fourthFocus.previousFocus();
                                } else if (value.length > 1) {
                                  fourth.text = value[0];
                                  fourthFocus.unfocus();
                                }
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 25),
                    FilledButton(
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStatePropertyAll<Color>(Colors.red[700]!),
                      ),
                      onPressed: () async {
                        if (await verify()) {
                          Fluttertoast.showToast(msg: "Successful Login!");
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DelegateInfo(
                                  name: widget.name, email: widget.email),
                            ),
                          );
                        } else {
                          Fluttertoast.showToast(msg: "Verification Failed");
                        }
                      },
                      child: const Text(
                        'Verify',
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              Align(
                alignment: Alignment.bottomLeft,
                child: IconButton(
                    padding: EdgeInsets.fromLTRB(20, 0, 0, 40),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const WelcomeScreen()));
                    },
                    icon: const Icon(Icons.keyboard_double_arrow_left_sharp,
                        color: Colors.white, size: 45)),
              )
            ],
          ),
        ),
      ),
    );
  }
}
