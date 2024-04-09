import 'package:flutter/material.dart';
import 'package:flutter_project_ideas/Delegate%20Home%20Screens/position.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../LoginPage/loginpage.dart';
import 'Del_framework.dart';
import 'info.dart';

class Committee extends StatefulWidget {
  final String name;
  final String email;
  final String highschool;
  final String grade;
  Committee({
    Key? key,
    required this.name,
    required this.email,
    required this.highschool,
    required this.grade,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _Committee();
}

class _Committee extends State<Committee> {
  bool SPECPOL = false;
  bool UNODC = false;
  bool AU = false;
  bool WC = false;
  bool POIINC = false;
  bool POIBR = false;
  bool TMO = false;
  String UNODCstr = "GA : UNODC";
  String SPECPOLstr = "GA : SPECPOL";
  String AUstr = "Spec : African Union";
  String WCstr = "Spec : The Warren Commission";
  String POIstr = "Crisis : Partition of India";
  String TMOstr = "Crisis : Trouble on Mt. Olympus";
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.grey[900],
          resizeToAvoidBottomInset: false,
          body: Stack(
            children: [
              ListView(
                children: [
                  SizedBox(height: MediaQuery.of(context).size.height / 35),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Committee assignment",
                        style: TextStyle(
                          fontSize: 32,
                          color: Colors.white,
                          fontFamily: 'CrimsonText',
                        ),
                      ),
                      SizedBox(height: MediaQuery.of(context).size.height / 19),
                    ],
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height / 30),
                  GestureDetector(
                      onTap: () {
                        setState(
                          () {
                            UNODC = !UNODC;
                            SPECPOL = AU = WC = POIINC = POIBR = TMO = false;
                          },
                        );
                      },
                      child: Card(
                        borderOnForeground: false,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                        elevation: UNODC ? 20 : 5,
                        shadowColor: UNODC ? Colors.white : Colors.transparent,
                        color: Colors.transparent,
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: UNODC ? Colors.white : Colors.transparent,
                              width: 3.0,
                            ),
                            borderRadius: BorderRadius.circular(25),
                            image: const DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(
                                  'https://images.squarespace-cdn.com/content/v1/5cad22d38155121d32542a28'
                                  '/1699394304725-DETE25H97LF6UPF0ID2D/opioid+teaser+v1.jpg?format=2500w'),
                              colorFilter: ColorFilter.mode(
                                  Colors.black54, BlendMode.darken),
                            ),
                          ),
                          width: MediaQuery.of(context).size.width - 30,
                          height: MediaQuery.of(context).size.height / 10,
                          child: const Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Center(
                                child: Text(
                                  "United Nations Office on",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 22),
                                ),
                              ),
                              Center(
                                child: Text(
                                  "Drugs and Crime",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 22),
                                ),
                              ),
                            ],
                          ),
                        ),
                      )),
                  SizedBox(height: 10),
                  GestureDetector(
                      onTap: () {
                        setState(
                          () {
                            SPECPOL = !SPECPOL;
                            UNODC = AU = WC = POIINC = POIBR = TMO = false;
                          },
                        );
                      },
                      child: Card(
                        borderOnForeground: false,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                        elevation: SPECPOL ? 50 : 5,
                        shadowColor:
                            SPECPOL ? Colors.white : Colors.transparent,
                        color: Colors.transparent,
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              color:
                                  SPECPOL ? Colors.white : Colors.transparent,
                              width: 3.0,
                            ),
                            borderRadius: BorderRadius.circular(25),
                            image: const DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage('assets/SPECPOL.png'),
                              colorFilter: ColorFilter.mode(
                                  Colors.black54, BlendMode.darken),
                            ),
                          ),
                          width: MediaQuery.of(context).size.width - 30,
                          height: MediaQuery.of(context).size.height / 10,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Center(
                                child: Text(
                                  "Special Political and",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 22),
                                ),
                              ),
                              Center(
                                child: Text(
                                  "Decolonization Committee",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 22),
                                ),
                              ),
                            ],
                          ),
                        ),
                      )),
                  SizedBox(height: 10),
                  GestureDetector(
                      onTap: () {
                        setState(
                          () {
                            AU = !AU;
                            UNODC = SPECPOL = WC = POIINC = POIBR = TMO = false;
                          },
                        );
                      },
                      child: Card(
                        borderOnForeground: false,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                        elevation: AU ? 50 : 5,
                        shadowColor: AU ? Colors.white : Colors.transparent,
                        color: Colors.transparent,
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: AU ? Colors.white : Colors.transparent,
                              width: 3.0,
                            ),
                            borderRadius: BorderRadius.circular(25),
                            image: const DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage('assets/AUimage.jpg'),
                              colorFilter: ColorFilter.mode(
                                  Colors.black54, BlendMode.darken),
                            ),
                          ),
                          width: MediaQuery.of(context).size.width - 30,
                          height: MediaQuery.of(context).size.height / 10,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Center(
                                child: Text(
                                  "African Union",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 22),
                                ),
                              ),
                            ],
                          ),
                        ),
                      )),
                  SizedBox(height: 10),
                  GestureDetector(
                      onTap: () {
                        setState(
                          () {
                            WC = !WC;
                            UNODC = SPECPOL = AU = POIINC = POIBR = TMO = false;
                          },
                        );
                      },
                      child: Card(
                        borderOnForeground: false,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                        elevation: WC ? 50 : 5,
                        shadowColor: WC ? Colors.white : Colors.transparent,
                        color: Colors.transparent,
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: WC ? Colors.white : Colors.transparent,
                              width: 3.0,
                            ),
                            borderRadius: BorderRadius.circular(25),
                            image: const DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage('assets/TWC.jpg'),
                              colorFilter: ColorFilter.mode(
                                  Colors.black54, BlendMode.darken),
                            ),
                          ),
                          width: MediaQuery.of(context).size.width - 30,
                          height: MediaQuery.of(context).size.height / 10,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Center(
                                child: Text(
                                  "The Warren Commission",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 22),
                                ),
                              ),
                            ],
                          ),
                        ),
                      )),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      GestureDetector(
                          onTap: () {
                            setState(
                              () {
                                POIINC = !POIINC;
                                UNODC = POIBR = SPECPOL = AU = WC = TMO = false;
                              },
                            );
                          },
                          child: Card(
                            borderOnForeground: false,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25),
                            ),
                            elevation: POIINC ? 50 : 5,
                            shadowColor:
                                POIINC ? Colors.white : Colors.transparent,
                            color: Colors.transparent,
                            child: Container(
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: POIINC
                                      ? Colors.white
                                      : Colors.transparent,
                                  width: 3.0,
                                ),
                                borderRadius: BorderRadius.circular(25),
                                image: const DecorationImage(
                                  fit: BoxFit.cover,
                                  image: AssetImage('assets/INC.jpg'),
                                  colorFilter: ColorFilter.mode(
                                      Colors.black54, BlendMode.darken),
                                ),
                              ),
                              width:
                                  (MediaQuery.of(context).size.width / 2) - 15,
                              height: MediaQuery.of(context).size.height / 10,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Center(
                                    child: Text(
                                      "Indian National",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 22),
                                    ),
                                  ),
                                  Center(
                                    child: Text(
                                      "Congress",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 22),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )),
                      GestureDetector(
                          onTap: () {
                            setState(
                              () {
                                POIBR = !POIBR;
                                UNODC =
                                    SPECPOL = AU = WC = TMO = POIINC = false;
                              },
                            );
                          },
                          child: Card(
                            borderOnForeground: false,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25),
                            ),
                            elevation: POIBR ? 50 : 5,
                            shadowColor:
                                POIBR ? Colors.white : Colors.transparent,
                            color: Colors.transparent,
                            child: Container(
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color:
                                      POIBR ? Colors.white : Colors.transparent,
                                  width: 3.0,
                                ),
                                borderRadius: BorderRadius.circular(25),
                                image: const DecorationImage(
                                  fit: BoxFit.cover,
                                  image: AssetImage('assets/INC.jpg'),
                                  colorFilter: ColorFilter.mode(
                                      Colors.black54, BlendMode.darken),
                                ),
                              ),
                              width:
                                  (MediaQuery.of(context).size.width / 2) - 15,
                              height: MediaQuery.of(context).size.height / 10,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Center(
                                    child: Text(
                                      "British Raj",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 22),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )),
                    ],
                  ),
                  SizedBox(height: 10),
                  GestureDetector(
                      onTap: () {
                        setState(
                          () {
                            TMO = !TMO;
                            UNODC = SPECPOL = AU = WC = POIINC = POIBR = false;
                          },
                        );
                      },
                      child: Card(
                        borderOnForeground: false,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                        elevation: TMO ? 50 : 5,
                        shadowColor: TMO ? Colors.white : Colors.transparent,
                        color: Colors.transparent,
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: TMO ? Colors.white : Colors.transparent,
                              width: 3.0,
                            ),
                            borderRadius: BorderRadius.circular(25),
                            image: const DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage('assets/TMO.png'),
                              colorFilter: ColorFilter.mode(
                                  Colors.black54, BlendMode.darken),
                            ),
                          ),
                          width: MediaQuery.of(context).size.width - 30,
                          height: MediaQuery.of(context).size.height / 10,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Center(
                                child: Text(
                                  "We Didn't steal the Fire!",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 22),
                                ),
                              ),
                            ],
                          ),
                        ),
                      )),
                  SizedBox(height: 15),
                  Container(
                    margin: EdgeInsets.symmetric(
                      vertical: 2,
                      horizontal: MediaQuery.of(context).size.width / 3,
                    ),
                    width: 10,
                    height: 32,
                    child: ElevatedButton(
                      style: ButtonStyle(
                        fixedSize: MaterialStateProperty.all(Size(20, 20)),
                        backgroundColor:
                            MaterialStatePropertyAll<Color>(Colors.red[800]!),
                      ),
                      onPressed: () async {
                        if (AU | POIINC | POIBR | TMO | UNODC | SPECPOL | WC) {
                          String committeechoice = AU
                              ? "African Union"
                              : POIINC
                                  ? "Partition of India: Indian National Congress"
                                  : POIBR
                                      ? "Partition of India: British Raj"
                                      : TMO
                                          ? "Trouble on Mt. Olympus"
                                          : UNODC
                                              ? "United Nations Office on Drugs and Crime"
                                              : SPECPOL
                                                  ? "Special Political and Decolonization Committee"
                                                  : "The Warren Commission";
                          final SharedPreferences prefs =
                              await SharedPreferences.getInstance();
                          await prefs.setString('Name', widget.name);
                          await prefs.setString('Email', widget.email);
                          await prefs.setString('Committee', committeechoice);
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Position(
                                        name: widget.name,
                                        email: widget.email,
                                        committee: committeechoice,
                                        highschool: widget.highschool,
                                        grade: widget.grade,
                                        committeedb: AU
                                            ? AUstr
                                            : UNODC
                                                ? UNODCstr
                                                : POIINC || POIBR
                                                    ? POIstr
                                                    : TMO
                                                        ? TMOstr
                                                        : SPECPOLstr,
                                      )));
                        } else {
                          Fluttertoast.showToast(msg: "Committee not picked");
                        }
                      },
                      child: const Text(
                        'Confirm',
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                    ),
                  )
                ],
              ),
              Align(
                alignment: Alignment.bottomLeft,
                child: IconButton(
                    padding: EdgeInsets.fromLTRB(20, 0, 0, 40),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => DelegateInfo(
                                  name: widget.name, email: widget.email)));
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
