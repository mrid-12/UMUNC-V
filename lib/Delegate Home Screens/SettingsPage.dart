import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

import '../LoginPage/start.dart';
import 'Del_framework.dart';

class SettingsPage extends StatefulWidget {
  final String name;
  final String email;
  final String committee;
  final String position;

  SettingsPage(
      {super.key,
      required this.name,
      required this.email,
      required this.committee,
      required this.position});

  @override
  State<StatefulWidget> createState() => _SettingsPage();
}

class _SettingsPage extends State<SettingsPage> {
  late BuildContext newcontext;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.transparent,
      ),
      height: MediaQuery.of(context).size.height,
      margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
      child: ListView(
        physics: const ScrollPhysics(),
        shrinkWrap: true,
        children: [
          Container(
            height: MediaQuery.of(context).size.height / 20,
            child: Center(
              child: Text("Settings",
                  style: TextStyle(color: Colors.white, fontSize: 28)),
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height / 30,
          ),
          Container(
            padding: EdgeInsets.symmetric(
              vertical: 30,
              horizontal: 10,
            ),
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.white,
                width: 0.3,
              ),
              borderRadius: BorderRadius.circular(25),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text("Account Information",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontFamily: 'CrimsonText')),
                const SizedBox(height: 20),
                Text(widget.name,
                    style: TextStyle(color: Colors.white, fontSize: 18)),
                const SizedBox(height: 10),
                Text(widget.email,
                    style: TextStyle(color: Colors.white, fontSize: 18)),
                const SizedBox(height: 30),
                Container(
                  height: 30,
                  padding: EdgeInsets.only(
                    bottom: 10,
                  ),
                  child: Center(
                    child: Text(
                        widget.committee ==
                                "Partition of India: Indian National Congress"
                            ? "Partition of India: INC"
                            : widget.committee ==
                                    "Partition of India: British Raj"
                                ? "Partition of India: BR"
                                : widget.committee ==
                                        "United Nations Office on Drugs and Crime"
                                    ? "UNODC"
                                    : widget.committee ==
                                            "Special Political and Decolonization Committee"
                                        ? "SPECPOL"
                                        : widget.committee,
                        style: TextStyle(color: Colors.white, fontSize: 18)),
                  ),
                ),
                const SizedBox(height: 10),
                Text(widget.position,
                    style: TextStyle(color: Colors.white, fontSize: 18)),
              ],
            ),
          ),
          const SizedBox(height: 50),
          GestureDetector(
            onTap: () {
              showDialog(
                context: context,
                builder: (_) => CupertinoAlertDialog(
                  title: Text("Confirm Logout?"),
                  content: Text(
                      "Please click anywhere outside the box to cancel/close"),
                  actions: [
                    CupertinoDialogAction(
                      isDestructiveAction: true,
                      child: Text("Confirm"),
                      onPressed: (() async {
                        final SharedPreferences prefs =
                            await SharedPreferences.getInstance();
                        await prefs.remove('Name');
                        await prefs.remove('Email');
                        await prefs.remove('Committee');
                        await prefs.remove('Position');

                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => start()));
                        Navigator.of(context, rootNavigator: true)
                            .pop("Discard");
                      }),
                    ),
                  ],
                ),
              );
            },
            child: ListTile(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
              tileColor: Colors.white.withOpacity(0.3),
              leading: CircleAvatar(
                backgroundColor: Colors.blue[800],
                child: const Icon(
                  Icons.exit_to_app,
                  color: Colors.white,
                ),
              ),
              title: const Text(
                'Logout',
                style: TextStyle(color: Colors.white),
              ),
              subtitle: const Text(
                'Redirects you to the Login page',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
          const SizedBox(height: 20),
          GestureDetector(
            onTap: () {
              showDialog(
                context: context,
                builder: (_) => CupertinoAlertDialog(
                  title: Text("Confirm Account Deletion?"),
                  content: Text(
                      "Please click anywhere outside the box to cancel/close"),
                  actions: [
                    CupertinoDialogAction(
                      isDestructiveAction: true,
                      child: Text("Confirm"),
                      onPressed: (() async {
                        final SharedPreferences prefs =
                            await SharedPreferences.getInstance();
                        await prefs.remove('Name');
                        await prefs.remove('Email');
                        await prefs.remove('Committee');
                        await prefs.remove('Position');
                        var firestore = widget.committee ==
                                "Partition of India: Indian National Congress"
                            ? FirebaseFirestore.instance
                                .collection('Crisis : Partition of India')
                                .doc('Users')
                                .collection('Indian National Congress')
                            : widget.committee ==
                                    "Partition of India: British Raj"
                                ? FirebaseFirestore.instance
                                    .collection('Crisis : Partition of India')
                                    .doc('Users')
                                    .collection('British Raj')
                                : widget.committee ==
                                        "United Nations Office on Drugs and Crime"
                                    ? FirebaseFirestore.instance
                                        .collection("GA : UNODC")
                                    : widget.committee == "African Union"
                                        ? FirebaseFirestore.instance
                                            .collection("Spec : African Union")
                                        : widget.committee ==
                                                "Special Political and Decolonization Committee"
                                            ? FirebaseFirestore.instance
                                                .collection("GA : SPECPOL")
                                            : widget.committee ==
                                                    "Trouble on Mt. Olympus"
                                                ? FirebaseFirestore.instance
                                                    .collection(
                                                        "Crisis : Trouble on Mt. Olympus")
                                                : FirebaseFirestore.instance
                                                    .collection(
                                                        "Spec : The Warren Commission");
                        final updates = <String, dynamic>{
                          "name": FieldValue.delete(),
                          "email": FieldValue.delete(),
                          "high school": FieldValue.delete(),
                          "grade": FieldValue.delete(),
                          "registered": false
                        };
                        firestore.doc(widget.position).update(updates);
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => start()));
                        Navigator.of(context, rootNavigator: true)
                            .pop("Discard");
                      }),
                    ),
                  ],
                ),
              );
            },
            child: ListTile(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
              tileColor: Colors.white.withOpacity(0.3),
              leading: CircleAvatar(
                backgroundColor: Colors.red[900],
                child: const Icon(
                  Icons.delete,
                  color: Colors.white,
                ),
              ),
              title: const Text(
                'Delete account',
                style: TextStyle(color: Colors.white),
              ),
              subtitle: const Text(
                'Deletes your account completely',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
          const SizedBox(height: 20),
          GestureDetector(
            onTap: () async {
              Uri url = Uri.parse("https://umdmun.org/committees");
              await launchUrl(url);
            },
            child: ListTile(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
              tileColor: Colors.white.withOpacity(0.3),
              leading: CircleAvatar(
                backgroundColor: Colors.blueGrey[600],
                child: const Icon(
                  Icons.question_mark_sharp,
                  color: Colors.white,
                ),
              ),
              title: const Text(
                'About',
                style: TextStyle(color: Colors.white),
              ),
              subtitle: const Text(
                'Redirects you to our website',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}
