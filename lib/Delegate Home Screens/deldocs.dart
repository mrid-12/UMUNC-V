import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

import '../Staff Home Screens/docs.dart';

class deldocs extends StatefulWidget {
  final String committeename;
  deldocs({super.key, required this.committeename});

  @override
  State<StatefulWidget> createState() => _deldocs();
}

class _deldocs extends State<deldocs> {
  late Stream<QuerySnapshot> _imgStream = FirebaseFirestore.instance
      .collection('zDocuments')
      .doc('Users')
      .collection(widget.committeename)
      .snapshots();
  final Stream<QuerySnapshot> _ALLimgStream = FirebaseFirestore.instance
      .collection('zDocuments')
      .doc('Users')
      .collection('ALL Delegates')
      .snapshots();
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: ListView(
          physics: const ScrollPhysics(),
          shrinkWrap: true,
          children: [
            StreamBuilder<QuerySnapshot>(
              stream: _imgStream,
              builder: (BuildContext context,
                  AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.hasError) {
                  return const Text('Something went wrong',
                      style: TextStyle(fontSize: 30, color: Colors.white));
                }

                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Container(child: const CircularProgressIndicator());
                }

                return ListView(
                  physics: const ScrollPhysics(),
                  shrinkWrap: true,
                  children: [
                    SizedBox(
                      height: 30,
                    ),
                    snapshot.data!.docs.length > 1
                        ? Center(
                            child: Text(
                              widget.committeename + "\n Documents",
                              style: TextStyle(
                                  fontSize: 28,
                                  color: Colors.white,
                                  fontFamily: 'CrimsonText'),
                            ),
                          )
                        : SizedBox(),
                    SizedBox(
                      height: 30,
                    ),
                    ListView(
                        physics: const ScrollPhysics(),
                        shrinkWrap: true,
                        children: snapshot.data!.docs
                            .map((DocumentSnapshot document) {
                          return document['isDocument']
                              ? Column(
                                  children: [
                                    GestureDetector(
                                      onTap: (() {
                                        downloadFile(
                                            document['download'], document.id);
                                      }),
                                      child: Container(
                                        padding: EdgeInsets.symmetric(
                                          vertical: 5,
                                        ),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          border: Border.all(
                                            color: Colors.white,
                                            width: 0.2,
                                          ),
                                        ),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Container(
                                              width: MediaQuery.of(context)
                                                          .size
                                                          .width /
                                                      2 -
                                                  40,
                                              child: Text(
                                                document.id,
                                                style: TextStyle(
                                                    fontSize: 20,
                                                    color: Colors.white,
                                                    fontFamily: 'CrimsonText'),
                                              ),
                                            ),
                                            Container(
                                              height: MediaQuery.of(context)
                                                          .size
                                                          .height /
                                                      6 -
                                                  40,
                                              width: MediaQuery.of(context)
                                                          .size
                                                          .width /
                                                      2.5 -
                                                  40,
                                              child: document['download']
                                                          .contains('.jpg?') ||
                                                      document['download']
                                                          .contains('.png?') ||
                                                      document['download']
                                                          .contains('.jpeg?') ||
                                                      document['download']
                                                          .contains('.heic?')
                                                  ? Image(
                                                      image: NetworkImage(
                                                          document['download']),
                                                      fit: BoxFit.contain,
                                                    )
                                                  : document['download']
                                                          .contains('.pdf?')
                                                      ? Stack(
                                                          children: [
                                                            Center(
                                                              child: Container(
                                                                height: MediaQuery.of(context)
                                                                            .size
                                                                            .height /
                                                                        7 -
                                                                    40,
                                                                width: MediaQuery.of(context)
                                                                            .size
                                                                            .width /
                                                                        2.5 -
                                                                    40,
                                                                child: Image(
                                                                  image: AssetImage(
                                                                      'assets/PDF_file_icon.svg.png'),
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        )
                                                      : document['download']
                                                              .contains('.svg?')
                                                          ? Stack(
                                                              children: [
                                                                Container(
                                                                  height: MediaQuery.of(context)
                                                                              .size
                                                                              .height /
                                                                          6 -
                                                                      40,
                                                                  width: MediaQuery.of(context)
                                                                              .size
                                                                              .width /
                                                                          2.5 -
                                                                      40,
                                                                  child: Image(
                                                                    image: AssetImage(
                                                                        'assets/svg.png'),
                                                                  ),
                                                                ),
                                                              ],
                                                            )
                                                          : document['download']
                                                                      .contains(
                                                                          '.ppt?') ||
                                                                  document[
                                                                          'download']
                                                                      .contains(
                                                                          '.pptx?')
                                                              ? Stack(
                                                                  children: [
                                                                    Center(
                                                                      child:
                                                                          Container(
                                                                        height:
                                                                            MediaQuery.of(context).size.height / 7 -
                                                                                40,
                                                                        width: MediaQuery.of(context).size.width /
                                                                                2.5 -
                                                                            40,
                                                                        child:
                                                                            Image(
                                                                          image:
                                                                              AssetImage('assets/PPTLogo.png'),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                )
                                                              : Container(
                                                                  height: MediaQuery.of(context)
                                                                              .size
                                                                              .height /
                                                                          6 -
                                                                      40,
                                                                  width: MediaQuery.of(context)
                                                                              .size
                                                                              .width /
                                                                          2.5 -
                                                                      40,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: Colors
                                                                        .white
                                                                        .withOpacity(
                                                                            0.4),
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            10),
                                                                  ),
                                                                  child: Center(
                                                                      child:
                                                                          Text(
                                                                    'Download this \nmedia',
                                                                    textAlign:
                                                                        TextAlign
                                                                            .center,
                                                                  )),
                                                                ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                  ],
                                )
                              : SizedBox(height: 0, width: 0);
                        }).toList()),
                  ],
                );
              },
            ),
            StreamBuilder<QuerySnapshot>(
              stream: _ALLimgStream,
              builder: (BuildContext context,
                  AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.hasError) {
                  return const Text('Something went wrong',
                      style: TextStyle(fontSize: 30, color: Colors.white));
                }

                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Container(child: const CircularProgressIndicator());
                }

                return ListView(
                    physics: const ScrollPhysics(),
                    shrinkWrap: true,
                    children: [
                      SizedBox(
                        height: 30,
                      ),
                      snapshot.data!.docs.length > 1
                          ? Center(
                              child: Text(
                                "Other Documents",
                                style: TextStyle(
                                    fontSize: 28,
                                    color: Colors.white,
                                    fontFamily: 'CrimsonText'),
                              ),
                            )
                          : SizedBox(),
                      SizedBox(
                        height: 30,
                      ),
                      ListView(
                          physics: const ScrollPhysics(),
                          shrinkWrap: true,
                          children: snapshot.data!.docs
                              .map((DocumentSnapshot document) {
                            return document['isDocument']
                                ? Column(
                                    children: [
                                      GestureDetector(
                                        onTap: (() {
                                          downloadFile(document['download'],
                                              document.id);
                                        }),
                                        child: Container(
                                          padding: EdgeInsets.symmetric(
                                            vertical: 5,
                                          ),
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(15),
                                            border: Border.all(
                                              color: Colors.white,
                                              width: 0.2,
                                            ),
                                          ),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              Container(
                                                width: MediaQuery.of(context)
                                                            .size
                                                            .width /
                                                        2 -
                                                    40,
                                                child: Text(
                                                  document.id,
                                                  style: TextStyle(
                                                      fontSize: 20,
                                                      color: Colors.white,
                                                      fontFamily:
                                                          'CrimsonText'),
                                                ),
                                              ),
                                              GestureDetector(
                                                onTap: (() {
                                                  downloadFile(
                                                      document['download'],
                                                      document.id);
                                                }),
                                                child: Container(
                                                  height: MediaQuery.of(context)
                                                              .size
                                                              .height /
                                                          6 -
                                                      40,
                                                  width: MediaQuery.of(context)
                                                              .size
                                                              .width /
                                                          2.5 -
                                                      40,
                                                  child: document['download']
                                                              .contains(
                                                                  '.jpg?') ||
                                                          document['download']
                                                              .contains(
                                                                  '.png?') ||
                                                          document['download']
                                                              .contains(
                                                                  '.jpeg?') ||
                                                          document['download']
                                                              .contains(
                                                                  '.heic?')
                                                      ? Image(
                                                          image: NetworkImage(
                                                              document[
                                                                  'download']),
                                                          fit: BoxFit.cover,
                                                        )
                                                      : document['download']
                                                              .contains('.pdf?')
                                                          ? Stack(
                                                              children: [
                                                                Center(
                                                                  child:
                                                                      Container(
                                                                    height:
                                                                        MediaQuery.of(context).size.height /
                                                                                7 -
                                                                            40,
                                                                    width: MediaQuery.of(context).size.width /
                                                                            2.5 -
                                                                        40,
                                                                    child:
                                                                        Image(
                                                                      image: AssetImage(
                                                                          'assets/PDF_file_icon.svg.png'),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ],
                                                            )
                                                          : document['download']
                                                                      .contains(
                                                                          '.ppt?') ||
                                                                  document['download']
                                                                      .contains(
                                                                          '.pptx?')
                                                              ? Stack(
                                                                  children: [
                                                                    Center(
                                                                      child:
                                                                          Container(
                                                                        height:
                                                                            MediaQuery.of(context).size.height / 7 -
                                                                                40,
                                                                        width: MediaQuery.of(context).size.width /
                                                                                2.5 -
                                                                            40,
                                                                        child:
                                                                            Image(
                                                                          image:
                                                                              AssetImage('assets/PPTLogo.png'),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                )
                                                              : document['download']
                                                                      .contains(
                                                                          '.svg?')
                                                                  ? Stack(
                                                                      children: [
                                                                        Container(
                                                                          height:
                                                                              MediaQuery.of(context).size.height / 6 - 40,
                                                                          width:
                                                                              MediaQuery.of(context).size.width / 2.5 - 40,
                                                                          child:
                                                                              Image(
                                                                            image:
                                                                                AssetImage('assets/svg.png'),
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    )
                                                                  : Container(
                                                                      height:
                                                                          MediaQuery.of(context).size.height / 6 -
                                                                              40,
                                                                      width: MediaQuery.of(context).size.width /
                                                                              2.5 -
                                                                          40,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: Colors
                                                                            .white
                                                                            .withOpacity(0.4),
                                                                        borderRadius:
                                                                            BorderRadius.circular(10),
                                                                      ),
                                                                      child: Center(
                                                                          child: Text(
                                                                        'Download this \nmedia',
                                                                        textAlign:
                                                                            TextAlign.center,
                                                                      )),
                                                                    ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                    ],
                                  )
                                : SizedBox(height: 0, width: 0);
                          }).toList()),
                    ]);
              },
            )
          ]),
    );
  }
}
