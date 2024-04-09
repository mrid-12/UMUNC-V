import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../Delegate Home Screens/Del_framework.dart';
import '../LoginPage/start.dart';
import 'package:flutter_project_ideas/backButton.dart';

import 'Staff_framework.dart';

class Password extends StatefulWidget {
  const Password({super.key});

  @override
  State<StatefulWidget> createState() => _Password();
}

class _Password extends State<Password> {
  final pass = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          body: Stack(
            children: [
              Container(
                height: double.infinity,
                color: Colors.black,
              ),
              Padding(
                padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).viewInsets.bottom),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(bottom: 25),
                      width: double.infinity,
                      child: Center(
                        child: Text(
                          'Please enter the member password',
                          style: TextStyle(
                            fontSize: 25,
                            decoration: TextDecoration.none,
                            fontFamily: 'CrimsonText',
                            color: Colors.red.shade400,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 8),
                      decoration: BoxDecoration(
                        color: Colors.grey[600]?.withOpacity(0.5),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: TextField(
                        controller: pass,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                        textAlign: TextAlign.left,
                        decoration: const InputDecoration(
                          contentPadding: EdgeInsets.all(15),
                          border: InputBorder.none,
                          hintStyle: TextStyle(color: Colors.white),
                          hintText: 'Password: ',
                          prefixIcon:
                              Icon(Icons.key, size: 30, color: Colors.white),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor: MaterialStatePropertyAll<Color>(
                                Colors.deepPurple[900]!)),
                        onPressed: () {
                          if (pass.text == 'goterps!') {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => StaffFramework(),
                              ),
                            );
                          } else {
                            Fluttertoast.showToast(
                                backgroundColor: Colors.red,
                                msg: 'Wrong password!',
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.CENTER,
                                timeInSecForIosWeb: 1,
                                textColor: Colors.white);
                          }
                          ;
                        },
                        child: const Text(
                          'Submit',
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                      ),
                    )
                  ],
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
