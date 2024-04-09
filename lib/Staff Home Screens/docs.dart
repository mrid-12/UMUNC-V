import 'dart:io';
import 'dart:ui';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:enough_media/enough_media.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flowder/flowder.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:gallery_saver/gallery_saver.dart';
import 'package:path_provider/path_provider.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_tile/url_tile.dart';

import '../LoginPage/loginpage.dart';

class docs extends StatefulWidget {
  final String committeename;
  final String docname;
  final Stream<QuerySnapshot> stream;
  docs(
      {super.key,
      required this.docname,
      required this.stream,
      required this.committeename});

  @override
  State<StatefulWidget> createState() => _docs();
}

Future downloadFile(var refurl, String name) async {
  Uri url = Uri.parse(refurl);
  launchUrl(url, webOnlyWindowName: '__self');
  Fluttertoast.showToast(msg: 'Downloading your document');
  // final dir = Platform.isAndroid
  //     ? getExternalStorageDirectory()
  //     : Platform.isIOS
  //         ? getLibraryDirectory()
  //         : Fluttertoast.showToast(msg: 'Error');
  // final path = '$dir/UMUNC/';
  // DownloaderUtils options = DownloaderUtils(
  //   progressCallback: (current, total) {
  //     final progress = (current / total) * 100;
  //     print('Downloading: $progress');
  //   },
  //   file: File('$path/${name}'),
  //   progress: ProgressImplementation(),
  //   onDone: () => Fluttertoast.showToast(msg: 'File Downloaded'),
  //   deleteOnCancel: true,
  // );
  // await Flowder.download(refurl, options);

  // await Dio().download(refurl, path);
  //
  // if (refurl.contains('.mp4')) {
  //   await GallerySaver.saveVideo(path, toDcim: true);
  // } else if (refurl.contains('.jpg') ||
  //     refurl.contains('.png') ||
  //     refurl.contains('.jpeg') ||
  //     refurl.contains('.svg')) {
  //   await GallerySaver.saveImage(path, toDcim: true);
}

class _docs extends State<docs> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const ScrollPhysics(),
      shrinkWrap: true,
      children: [
        SizedBox(
          height: 30,
        ),
        Text(widget.committeename,
            style: TextStyle(
                fontSize: 30, color: Colors.white, fontFamily: 'CrimsonText')),
        SizedBox(
          height: 20,
        ),
        StreamBuilder<QuerySnapshot>(
          stream: widget.stream,
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
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
                children: snapshot.data!.docs.map((DocumentSnapshot document) {
                  return document['isDocument']
                      ? Column(
                          children: [
                            Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Container(
                                    width: MediaQuery.of(context).size.width /
                                            2.5 -
                                        40,
                                    child: Text(
                                      document.id,
                                      style: TextStyle(
                                          fontSize: 20,
                                          color: Colors.white,
                                          fontFamily: 'CrimsonText'),
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: (() {
                                      downloadFile(
                                          document['download'], document.id);
                                    }),
                                    child: Container(
                                      height:
                                          MediaQuery.of(context).size.height /
                                                  6 -
                                              40,
                                      width: MediaQuery.of(context).size.width /
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
                                              fit: BoxFit.cover,
                                            )
                                          : document['download']
                                                  .contains('.pdf?')
                                              ? Column(
                                                  children: [
                                                    Stack(
                                                      children: [
                                                        GestureDetector(
                                                          onTap: (() {
                                                            downloadFile(
                                                                document[
                                                                    'download'],
                                                                document.id);
                                                          }),
                                                          child: Container(
                                                            height: MediaQuery.of(
                                                                            context)
                                                                        .size
                                                                        .height /
                                                                    6.5 -
                                                                40,
                                                            width: MediaQuery.of(
                                                                            context)
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
                                                    ),
                                                  ],
                                                )
                                              : document['download']
                                                          .contains('.ppt?') ||
                                                      document['download']
                                                          .contains('.pptx?')
                                                  ? Stack(
                                                      children: [
                                                        GestureDetector(
                                                          onTap: (() {
                                                            downloadFile(
                                                                document[
                                                                    'download'],
                                                                document.id);
                                                          }),
                                                          child: Container(
                                                            height: MediaQuery.of(
                                                                            context)
                                                                        .size
                                                                        .height /
                                                                    6 -
                                                                40,
                                                            width: MediaQuery.of(
                                                                            context)
                                                                        .size
                                                                        .width /
                                                                    2.5 -
                                                                40,
                                                            child: Image(
                                                              image: AssetImage(
                                                                  'assets/PPTLogo.png'),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    )
                                                  : Container(
                                                      height:
                                                          MediaQuery.of(context)
                                                                      .size
                                                                      .height /
                                                                  6 -
                                                              40,
                                                      width:
                                                          MediaQuery.of(context)
                                                                      .size
                                                                      .width /
                                                                  2.5 -
                                                              40,
                                                      decoration: BoxDecoration(
                                                        color: Colors.white
                                                            .withOpacity(0.4),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
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
                                  IconButton(
                                    onPressed: () {
                                      FirebaseFirestore.instance
                                          .collection('zDocuments')
                                          .doc('Users')
                                          .collection(widget.committeename)
                                          .doc(document.id)
                                          .delete();
                                      // FirebaseStorage.instance
                                      //     .ref()
                                      //     .child(document['title'])
                                      //     .delete();
                                    },
                                    icon:
                                        Icon(Icons.minimize, color: Colors.red),
                                  ),
                                ]),
                            SizedBox(height: 30),
                          ],
                        )
                      : SizedBox(height: 0, width: 0);
                }).toList());
          },
        ),
      ],
    );
  }
}
