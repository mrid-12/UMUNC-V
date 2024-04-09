import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_project_ideas/Delegate%20Home%20Screens/separator.dart';
import 'package:flutter_project_ideas/Staff%20Home%20Screens/docs.dart';
import 'package:flutter_project_ideas/Staff%20Home%20Screens/peopleView.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import '../Delegate Home Screens/HomePage.dart';
import '../Delegate Home Screens/logo.dart';
import 'StaffAnnouncements.dart';

class StaffFramework extends StatefulWidget {
  const StaffFramework({super.key});

  @override
  State<StatefulWidget> createState() => _StaffFramework();
}

class _StaffFramework extends State<StaffFramework> {
  int _selectedIndex = 0;
  late final PageController _pageController = PageController(initialPage: 0);
  PlatformFile? pickedFile;
  UploadTask? uploadTask;
  TextEditingController filename = TextEditingController();
  TextEditingController publishto = TextEditingController();

  TextEditingController title = TextEditingController();
  TextEditingController subtitle = TextEditingController();
  TextEditingController body = TextEditingController();
  TextEditingController deltitle = TextEditingController();
  static const List<String> choicelist = <String>[
    'Partition of India: Indian National Congress',
    'Partition of India: British Raj',
    'Trouble on Mt. Olympus',
    'United Nations Office on Drugs and Crime',
    'Special Political and Decolonization Committee',
    'African Union',
    'The Warren Commission',
    'ALL Delegates',
  ];

  Future uploadFile() async {
    final path = 'files/${pickedFile?.name}';
    final file = File(pickedFile!.path!);

    final storageref = FirebaseStorage.instance.ref().child(path);
    final firestoreref = FirebaseFirestore.instance
        .collection('zDocuments')
        .doc('Users')
        .collection(publishto.text);

    setState(() {
      uploadTask = storageref.putFile(file);
    });

    final snapshot = await uploadTask!.whenComplete(() {});
    final urlDownload = await storageref.getDownloadURL();

    firestoreref
        .doc(filename.text)
        .set({'title': path, 'download': urlDownload, 'isDocument': true});

    setState(
      () {
        uploadTask = null;
      },
    );
    Fluttertoast.showToast(
        msg: 'Uploaded file ${filename.text}',
        timeInSecForIosWeb: 5,
        toastLength: Toast.LENGTH_LONG);
  }

  Future selectFile() async {
    final result = await FilePicker.platform.pickFiles();
    if (result == null) return;
    setState(
      () {
        pickedFile = result.files.first;
      },
    );
  }

  final Stream<QuerySnapshot> _AUimgStream = FirebaseFirestore.instance
      .collection('zDocuments')
      .doc('Users')
      .collection('African Union')
      .snapshots();
  final Stream<QuerySnapshot> _TWCimgStream = FirebaseFirestore.instance
      .collection('zDocuments')
      .doc('Users')
      .collection('The Warren Commission')
      .snapshots();
  final Stream<QuerySnapshot> _UNODCimgStream = FirebaseFirestore.instance
      .collection('zDocuments')
      .doc('Users')
      .collection('United Nations Office on Drugs and Crime')
      .snapshots();
  final Stream<QuerySnapshot> _SPECPOLimgStream = FirebaseFirestore.instance
      .collection('zDocuments')
      .doc('Users')
      .collection('Special Political and Decolonization Committee')
      .snapshots();
  final Stream<QuerySnapshot> _TMOimgStream = FirebaseFirestore.instance
      .collection('zDocuments')
      .doc('Users')
      .collection('Trouble on Mt. Olympus')
      .snapshots();
  final Stream<QuerySnapshot> _POIINCimgStream = FirebaseFirestore.instance
      .collection('zDocuments')
      .doc('Users')
      .collection('Partition of India: Indian National Congress')
      .snapshots();
  final Stream<QuerySnapshot> _POIBRimgStream = FirebaseFirestore.instance
      .collection('zDocuments')
      .doc('Users')
      .collection('Partition of India: British Raj')
      .snapshots();
  final Stream<QuerySnapshot> _ALLimgStream = FirebaseFirestore.instance
      .collection('zDocuments')
      .doc('Users')
      .collection('ALL Delegates')
      .snapshots();

  final Stream<QuerySnapshot> _TWCStream = FirebaseFirestore.instance
      .collection('Spec : The Warren Commission')
      .snapshots();
  final Stream<QuerySnapshot> _AUStream =
      FirebaseFirestore.instance.collection('Spec : African Union').snapshots();
  final Stream<QuerySnapshot> _UNODCStream =
      FirebaseFirestore.instance.collection('GA : UNODC').snapshots();
  final Stream<QuerySnapshot> _SPECPOLStream =
      FirebaseFirestore.instance.collection('GA : SPECPOL').snapshots();
  final dynamic _POIStream =
      FirebaseFirestore.instance.collection('Crisis : Partition of India');
  final Stream<QuerySnapshot> _TMOStream = FirebaseFirestore.instance
      .collection('Crisis : Trouble on Mt. Olympus')
      .snapshots();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
          child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.black12,
        body: SafeArea(
            child: PageView(
          controller: _pageController,
          onPageChanged: (index) {
            setState(() {
              _selectedIndex = index;
            });
          },
          children: [
            ListView(
              children: [
                logo(),
                Separator(),
                Padding(
                  padding: const EdgeInsets.fromLTRB(15.0, 10, 15, 5),
                  child: peopleView(
                    stream: _UNODCStream,
                    committee: 'United Nations Office \non Drugs and Crime',
                    image: 'assets/UNODC.jpg',
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(15.0, 10, 15, 5),
                  child: peopleView(
                    stream: _SPECPOLStream,
                    committee:
                        'Special Political and \nDecolonization Committee',
                    image: 'assets/SPECPOL.png',
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(15.0, 10, 15, 5),
                  child: peopleView(
                    stream: _AUStream,
                    committee: 'African Union',
                    image: 'assets/AUimage.jpg',
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(15.0, 10, 15, 5),
                  child: peopleView(
                    stream: _TWCStream,
                    committee: 'The Warren Commission',
                    image: 'assets/TWC.jpg',
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(15.0, 10, 15, 5),
                  child: peopleView(
                    stream: _POIStream,
                    committee: 'The Partition of India',
                    image: 'assets/INC.jpg',
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(15.0, 10, 15, 5),
                  child: peopleView(
                    stream: _TMOStream,
                    committee: 'Trouble on Mt. Olympus',
                    image: 'assets/TMO.png',
                  ),
                ),
              ],
            ),
            Scaffold(
              resizeToAvoidBottomInset: false,
              backgroundColor: Colors.black12,
              body: Stack(
                children: [
                  ListView(
                    children: [logo(), Separator(), StaffAnnouncements()],
                  ),
                ],
              ),
              floatingActionButton: Padding(
                padding: EdgeInsets.fromLTRB(40, 0, 10, 10),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    FloatingActionButton(
                      child: Icon(Icons.remove),
                      backgroundColor: Colors.red.withOpacity(0.7),
                      onPressed: () {
                        showModalBottomSheet(
                            isDismissible: true,
                            isScrollControlled: true,
                            enableDrag: true,
                            context: context,
                            builder: (BuildContext context) {
                              return Scaffold(
                                resizeToAvoidBottomInset: false,
                                body: ListView(
                                  children: [
                                    Center(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          SizedBox(
                                            height: 100,
                                          ),
                                          Align(
                                            alignment: Alignment.topRight,
                                            child: IconButton(
                                              iconSize: 30,
                                              style: ButtonStyle(
                                                backgroundColor:
                                                    MaterialStatePropertyAll<
                                                            Color>(
                                                        Colors.blueGrey[700]!),
                                              ),
                                              onPressed: () async {
                                                Navigator.pop(context);
                                              },
                                              icon: Icon(Icons.cancel_sharp,
                                                  color: Colors.grey),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 20,
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(15.0),
                                            child: Text(
                                              'Enter Announcement title you want to delete:',
                                              style: TextStyle(
                                                fontSize: 20,
                                                color: Colors.black,
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 20,
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: TextField(
                                              textAlign: TextAlign.center,
                                              controller: deltitle,
                                            ),
                                          ),
                                          SizedBox(
                                            height: 40,
                                          ),
                                          FilledButton(
                                            style: ButtonStyle(
                                              backgroundColor:
                                                  MaterialStatePropertyAll<
                                                      Color>(Colors.red[700]!),
                                            ),
                                            onPressed: () async {
                                              Navigator.pop(context);

                                              late int x;
                                              await FirebaseFirestore.instance
                                                  .collection('Announcements')
                                                  .doc(deltitle.text)
                                                  .delete();
                                            },
                                            child: const Text(
                                              'Delete Announcement',
                                              style: TextStyle(
                                                fontSize: 18,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            });
                        // uploadFile();
                      },
                    ),
                    Expanded(child: Container()),
                    FloatingActionButton(
                      child: Icon(Icons.add),
                      backgroundColor: Colors.green.withOpacity(0.7),
                      onPressed: () {
                        showModalBottomSheet(
                            isScrollControlled: true,
                            enableDrag: true,
                            context: context,
                            builder: (BuildContext context) {
                              return Scaffold(
                                resizeToAvoidBottomInset: false,
                                body: ListView(
                                  children: [
                                    Center(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          SizedBox(
                                            height: 100,
                                          ),
                                          Align(
                                            alignment: Alignment.topRight,
                                            child: IconButton(
                                              iconSize: 35,
                                              style: ButtonStyle(
                                                backgroundColor:
                                                    MaterialStatePropertyAll<
                                                            Color>(
                                                        Colors.blueGrey[700]!),
                                              ),
                                              onPressed: () async {
                                                Navigator.pop(context);
                                              },
                                              icon: Icon(Icons.cancel_sharp,
                                                  color: Colors.grey),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 20,
                                          ),
                                          Text(
                                            'Add a title for this announcement:',
                                            style: TextStyle(
                                              fontSize: 20,
                                              color: Colors.black,
                                            ),
                                          ),
                                          SizedBox(
                                            height: 20,
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: TextField(
                                              textAlign: TextAlign.center,
                                              controller: title,
                                            ),
                                          ),
                                          SizedBox(
                                            height: 30,
                                          ),
                                          Text(
                                            'Add a subtitle (ex: Logistics):',
                                            style: TextStyle(
                                              fontSize: 18,
                                              color: Colors.black,
                                            ),
                                          ),
                                          SizedBox(
                                            height: 20,
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Container(
                                              child: TextField(
                                                textAlign: TextAlign.center,
                                                controller: subtitle,
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 20,
                                          ),
                                          Text(
                                            'Add a body to this announcement:',
                                            style: TextStyle(
                                              fontSize: 18,
                                              color: Colors.black,
                                            ),
                                          ),
                                          SizedBox(
                                            height: 20,
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Container(
                                              height: 200,
                                              child: TextField(
                                                maxLines: null,
                                                expands: true,
                                                textAlign: TextAlign.center,
                                                controller: body,
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 40,
                                          ),
                                          FilledButton(
                                            style: ButtonStyle(
                                              backgroundColor:
                                                  MaterialStatePropertyAll<
                                                      Color>(Colors.red[700]!),
                                            ),
                                            onPressed: () async {
                                              Navigator.pop(context);

                                              late int x;
                                              await FirebaseFirestore.instance
                                                  .collection('Announcements')
                                                  .orderBy('number',
                                                      descending: true)
                                                  .limit(1)
                                                  .get()
                                                  .then(
                                                (query) {
                                                  for (var doc in query.docs) {
                                                    x = doc['number'];
                                                  }
                                                },
                                              );

                                              var info = {
                                                "subtitle": subtitle.text,
                                                "info": body.text,
                                                "number": (x + 1),
                                                "isAnnouncement": true
                                              };
                                              FirebaseFirestore.instance
                                                  .collection('Announcements')
                                                  .doc(title.text)
                                                  .set(info);
                                            },
                                            child: const Text(
                                              'Create Announcement',
                                              style: TextStyle(
                                                fontSize: 18,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            });
                        // uploadFile();
                      },
                    ),
                  ],
                ),
              ),
            ),
            Scaffold(
              resizeToAvoidBottomInset: false,
              backgroundColor: Colors.black12,
              body: ListView(
                children: [
                  logo(),
                  Separator(),
                  Align(
                    alignment: Alignment.topCenter,
                    child: StreamBuilder<TaskSnapshot>(
                        stream: uploadTask?.snapshotEvents,
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            final data = snapshot.data!;
                            double progress =
                                data.bytesTransferred / data.totalBytes;
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: SizedBox(
                                  height: 30,
                                  child: Stack(fit: StackFit.expand, children: [
                                    LinearProgressIndicator(
                                      value: progress,
                                      backgroundColor: Colors.grey,
                                      color: Colors.green,
                                    ),
                                    Center(
                                      child: Text(
                                          'Uploading file ${filename.text}: ${(100 * progress).roundToDouble().truncate()}%',
                                          style: const TextStyle(
                                              color: Colors.white)),
                                    )
                                  ])),
                            );
                          } else {
                            return const Center(
                                child: Text('No uploads taking place right now',
                                    style: TextStyle(
                                      color: Colors.white,
                                    )));
                          }
                        }),
                  ),
                  docs(
                      docname: filename.text,
                      stream: _ALLimgStream,
                      committeename: 'ALL Delegates'),
                  docs(
                      docname: filename.text,
                      stream: _AUimgStream,
                      committeename: 'African Union'),
                  docs(
                      docname: filename.text,
                      stream: _POIBRimgStream,
                      committeename: 'Partition of India: British Raj'),
                  docs(
                      docname: filename.text,
                      stream: _POIINCimgStream,
                      committeename:
                          'Partition of India: Indian National Congress'),
                  docs(
                      docname: filename.text,
                      stream: _SPECPOLimgStream,
                      committeename:
                          'Special Political and Decolonization Committee'),
                  docs(
                      docname: filename.text,
                      stream: _TMOimgStream,
                      committeename: 'Trouble on Mt. Olympus'),
                  docs(
                      docname: filename.text,
                      stream: _TWCimgStream,
                      committeename: 'The Warren Commission'),
                  docs(
                      docname: filename.text,
                      stream: _UNODCimgStream,
                      committeename:
                          'United Nations Office on Drugs and Crime'),
                ],
              ),
              floatingActionButton: Padding(
                padding: const EdgeInsets.all(10.0),
                child: FloatingActionButton(
                  child: Icon(Icons.add),
                  backgroundColor: Colors.green.withOpacity(0.7),
                  onPressed: () {
                    showModalBottomSheet(
                        context: context,
                        builder: (BuildContext context) {
                          return Scaffold(
                            resizeToAvoidBottomInset: false,
                            body: ListView(
                              children: [
                                Center(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      SizedBox(
                                        height: 50,
                                      ),
                                      Text(
                                        'Enter a name for this file:',
                                        style: TextStyle(
                                          fontSize: 20,
                                          color: Colors.black,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Padding(
                                        padding: EdgeInsets.fromLTRB(
                                            30,
                                            0,
                                            30,
                                            MediaQuery.of(context)
                                                    .viewInsets
                                                    .bottom +
                                                10),
                                        child: TextField(
                                          textAlign: TextAlign.center,
                                          controller: filename,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      DropdownMenu<String>(
                                        controller: publishto,
                                        label: Text('Committee'),
                                        dropdownMenuEntries: choicelist
                                            .map<DropdownMenuEntry<String>>(
                                                (String str) {
                                          return DropdownMenuEntry<String>(
                                            label: str,
                                            value: str,
                                          );
                                        }).toList(),
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      FilledButton(
                                        style: ButtonStyle(
                                          backgroundColor:
                                              MaterialStatePropertyAll<Color>(
                                                  Colors.red[700]!),
                                        ),
                                        onPressed: () async {
                                          Navigator.pop(context);
                                          await selectFile();
                                          await uploadFile();
                                        },
                                        child: const Text(
                                          'Upload file',
                                          style: TextStyle(
                                            fontSize: 18,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          );
                        });
                    // uploadFile();
                  },
                ),
              ),
            ),
            // Column(
            //   children: [
            //     logo(),
            //     Separator(),
            //     const Divider(
            //       color: Colors.grey,
            //     ),
            //   ],
            // ),
          ],
        )),
        bottomNavigationBar: GNav(
          selectedIndex: _selectedIndex,
          tabMargin: const EdgeInsets.only(bottom: 55),
//rippleColor: Colors.grey[800]!, // tab button ripple color when pressed
//hoverColor: Colors.grey[700]!, // tab button hover color
          haptic: true, // haptic feedback
          tabBorderRadius: 20,
          tabActiveBorder: Border.all(
              color: Colors.yellow[300]!, width: 1), // tab button border
          tabBorder:
              Border.all(color: Colors.grey, width: 1), // tab button border
          tabShadow: const [
            BoxShadow(color: Color.fromARGB(210, 227, 25, 51), blurRadius: 6)
          ], // tab button shadow
          curve: Curves.fastOutSlowIn, // tab animation curves
          duration: const Duration(milliseconds: 400), // tab animation duration
          gap: 8, // the tab button gap between icon and text
          color: Colors.white60, // unselected icon color
          activeColor: Colors.white, // selected icon and text color
          iconSize: 30, // tab button icon size
// tabBackgroundColor: Colors.yellow[900]!
//     .withOpacity(0.4), // selected tab background color
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
// navigation bar padding

          tabs: const [
            GButton(
              icon: Icons.person,
              text: 'People',
            ),
            GButton(
              icon: Icons.notification_important_sharp,
              text: 'Announcements',
            ),
            GButton(
              icon: Icons.file_copy_outlined,
              text: 'Docs',
            ),
          ],
          onTabChange: (index) {
            _pageController.jumpToPage(index);
          },
        ),
      )),
    );
  }
}
