import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project_ideas/Delegate%20Home%20Screens/Committee.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Del_framework.dart';

class Position extends StatefulWidget {
  final String name;
  final String email;
  final String highschool;
  final String grade;
  final String committee;
  final String committeedb;
  const Position({
    Key? key,
    required this.name,
    required this.email,
    required this.highschool,
    required this.grade,
    required this.committee,
    required this.committeedb,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _Position();
}

class _Position extends State<Position> {
  TextEditingController position = TextEditingController();
  TextEditingController newPosition = TextEditingController();
  String UNODCstr = "GA : UNODC";
  String SPECPOLstr = "GA : SPECPOL";
  String AUstr = "Spec : African Union";
  String WCstr = "Spec : The Warren Commission";
  String POIstr = "Crisis : Partition of India";
  String TMOstr = "Crisis : Trouble on Mt. Olympus";
  bool isNewPos = false;
  late CollectionReference<Map<String, dynamic>> firestore =
      widget.committeedb == POIstr
          ? widget.committee == "Partition of India: Indian National Congress"
              ? FirebaseFirestore.instance
                  .collection(widget.committeedb)
                  .doc('Users')
                  .collection('Indian National Congress')
              : FirebaseFirestore.instance
                  .collection(widget.committeedb)
                  .doc('Users')
                  .collection('British Raj')
          : FirebaseFirestore.instance.collection(widget.committeedb);

  List<String> positionlist = <String>[];
  static const List<String> loading = <String>['loading...'];
  @override
  void initState() {
    super.initState();
    getData();
  }

  void getData() {
    widget.committeedb == POIstr
        ? widget.committee == "Partition of India: Indian National Congress"
            ? FirebaseFirestore.instance
                .collection(widget.committeedb)
                .doc('Users')
                .collection('Indian National Congress')
                .get()
                .then((query) {
                for (var doc in query.docs) {
                  setState(() {
                    positionlist.add(doc.id);
                  });
                }
              })
            : FirebaseFirestore.instance
                .collection(widget.committeedb)
                .doc('Users')
                .collection('British Raj')
                .get()
                .then((query) {
                for (var doc in query.docs) {
                  setState(() {
                    positionlist.add(doc.id);
                  });
                }
              })
        : FirebaseFirestore.instance
            .collection(widget.committeedb)
            .get()
            .then((query) {
            for (var doc in query.docs) {
              setState(() {
                positionlist.add(doc.id);
              });
            }
          });
    positionlist.add('Position Not Available');
  }

  Color getColor(Set<MaterialState> states) {
    const Set<MaterialState> interactiveStates = <MaterialState>{
      MaterialState.pressed,
      MaterialState.hovered,
      MaterialState.focused,
    };
    if (states.any(interactiveStates.contains)) {
      return Colors.black;
    }
    return Colors.white;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.grey[900],
          resizeToAvoidBottomInset: false,
          body: Stack(
            children: [
              ListView(children: [
                SizedBox(height: MediaQuery.of(context).size.height / 35),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Position assignment",
                      style: TextStyle(
                        fontSize: 32,
                        color: Colors.white,
                        fontFamily: 'CrimsonText',
                      ),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height / 19),
                  ],
                ),
                SizedBox(height: MediaQuery.of(context).size.height / 8),
                Center(
                  child: const Text(
                    "Choose your Position using the box below, \nif the position is not available, then please \nclick on \"New position\"",
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                      fontFamily: 'CrimsonText',
                    ),
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height / 20),
                Container(
                  margin: EdgeInsets.all(20),
                  child: DropdownMenu<String>(
                    controller: position,
                    menuHeight: MediaQuery.of(context).size.height / 3,
                    width: MediaQuery.of(context).size.width - 40,
                    label: const Text('Position',
                        style: TextStyle(
                          color: Colors.white54,
                        )),
                    requestFocusOnTap: true,
                    textStyle: const TextStyle(
                      fontSize: 15,
                      color: Colors.white,
                    ),
                    inputDecorationTheme: InputDecorationTheme(
                      fillColor: Colors.blueGrey.withOpacity(0.6),
                      filled: true,
                      contentPadding: EdgeInsets.symmetric(vertical: 5.0),
                    ),
                    enableFilter: true,
                    enableSearch: true,
                    leadingIcon: const Icon(
                      Icons.search,
                      color: Colors.lightBlueAccent,
                    ),
                    trailingIcon: const Icon(
                      Icons.arrow_downward_sharp,
                      color: Colors.white,
                    ),
                    dropdownMenuEntries: positionlist == []
                        ? loading
                            .map(
                              (String e) => DropdownMenuEntry<String>(
                                value: e,
                                label: e,
                                style: ButtonStyle(
                                  textStyle: MaterialStateTextStyle.resolveWith(
                                    (Set<MaterialState> state) {
                                      return const TextStyle(
                                          fontSize: 15, color: Colors.blue);
                                    },
                                  ),
                                  foregroundColor:
                                      MaterialStateProperty.resolveWith(
                                          getColor),
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                          Colors.grey[700]!),
                                ),
                              ),
                            )
                            .toList()
                        : positionlist
                            .map(
                              (String e) => DropdownMenuEntry<String>(
                                value: e,
                                label: e,
                                style: ButtonStyle(
                                  textStyle: MaterialStateTextStyle.resolveWith(
                                    (Set<MaterialState> state) {
                                      return const TextStyle(
                                          fontSize: 15, color: Colors.blue);
                                    },
                                  ),
                                  foregroundColor:
                                      MaterialStateProperty.resolveWith(
                                          getColor),
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                          Colors.grey[700]!),
                                ),
                              ),
                            )
                            .toList(),
                    onSelected: (String? s) {
                      if (s == 'Position Not Available') {
                        setState(
                          () {
                            isNewPos = true;
                          },
                        );
                      } else {
                        setState(
                          () {
                            isNewPos = false;
                          },
                        );
                      }
                    },
                  ),
                ),
                AnimatedOpacity(
                  opacity: isNewPos ? 1 : 0,
                  duration: Duration(seconds: 1),
                  curve: Curves.linear,
                  child: Container(
                    margin: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.grey[600]?.withOpacity(0.5),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: TextField(
                      controller: newPosition,
                      enabled: isNewPos,
                      textInputAction: TextInputAction.next,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 17,
                      ),
                      textAlign: TextAlign.left,
                      decoration: const InputDecoration(
                        contentPadding: EdgeInsets.all(15),
                        border: InputBorder.none,
                        hintStyle: TextStyle(color: Colors.white),
                        hintText: 'Position Name: ',
                        prefixIcon:
                            Icon(Icons.school, size: 28, color: Colors.white),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height / 20),
              ]),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  margin: EdgeInsets.only(
                    bottom: 80,
                  ),
                  width: MediaQuery.of(context).size.width / 3,
                  child: FilledButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(Colors.red),
                    ),
                    onPressed: () async {
                      if (position.text.isEmpty) {
                        Fluttertoast.showToast(msg: 'Please select a position');
                      } else if (isNewPos && newPosition.text.isEmpty) {
                        Fluttertoast.showToast(
                            msg: 'Please type your position name');
                      } else {
                        final SharedPreferences prefs =
                            await SharedPreferences.getInstance();
                        await prefs.setString('Name', widget.name);
                        await prefs.setString('Email', widget.email);
                        await prefs.setString('Committee', widget.committee);
                        await prefs.setString('Position',
                            isNewPos ? newPosition.text : position.text);

                        final data = {
                          "name": widget.name,
                          "email": widget.email,
                          "high school": widget.highschool,
                          "grade": widget.grade
                        };
                        final update = {"registered": true};
                        if (isNewPos &&
                            (positionlist.contains(newPosition.text))) {
                          Fluttertoast.showToast(
                              msg:
                                  'Your position already exists in the list, But I\'ll allow it');
                          firestore.doc(newPosition.text).set(data);
                          firestore.doc(newPosition.text).update(update);
                        } else if (isNewPos) {
                          Fluttertoast.showToast(
                              msg: 'Creating your position!');
                          firestore.doc(newPosition.text).set(data);
                          firestore.doc(newPosition.text).set(update);
                        } else {
                          Fluttertoast.showToast(
                              msg: 'Succesfully registered!');
                          firestore.doc(position.text).set(data);
                          firestore.doc(position.text).update(update);
                        }
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Framework(
                                name: widget.name,
                                email: widget.email,
                                committee: widget.committee,
                                position: isNewPos
                                    ? newPosition.text
                                    : position.text),
                          ),
                        );
                      }
                    },
                    child: const Text(
                      'Confirm',
                      style: TextStyle(
                        fontSize: 17,
                      ),
                    ),
                  ),
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
                              builder: (context) => Committee(
                                    name: widget.name,
                                    email: widget.email,
                                    highschool: widget.highschool,
                                    grade: widget.grade,
                                  )));
                    },
                    icon: const Icon(Icons.keyboard_double_arrow_left_sharp,
                        color: Colors.white, size: 45)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
