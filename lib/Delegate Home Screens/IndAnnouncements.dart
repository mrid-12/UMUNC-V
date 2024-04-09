import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../LoginPage/loginpage.dart';
import 'Del_framework.dart';

class Announcements extends StatefulWidget {
  Announcements({super.key});

  @override
  State<StatefulWidget> createState() => _Announcements();
}

class _Announcements extends State<Announcements> {
  late Stream<QuerySnapshot> annStream = FirebaseFirestore.instance
      .collection('Announcements')
      .orderBy("number", descending: true)
      .snapshots();
  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const ScrollPhysics(),
      shrinkWrap: true,
      children: [
        StreamBuilder<QuerySnapshot>(
          stream: annStream,
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
              children: [
                SizedBox(
                  height: 20,
                ),
                ListView(
                    physics: const ScrollPhysics(),
                    shrinkWrap: true,
                    children:
                        snapshot.data!.docs.map((DocumentSnapshot document) {
                      return document['isAnnouncement']
                          ? Container(
                              margin: EdgeInsets.symmetric(
                                horizontal: 15,
                                vertical: 8,
                              ),
                              child: ExpansionTile(
                                collapsedBackgroundColor: Colors.brown[600],
                                backgroundColor: Colors.brown[400],
                                collapsedShape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                title: Text(document.id,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                    )),
                                subtitle: Text(
                                  document['subtitle'],
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                  ),
                                ),
                                childrenPadding: EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 15),
                                children: [
                                  Center(
                                    child: Column(children: [
                                      SizedBox(height: 8),
                                      Text(
                                        document['info'],
                                        style: TextStyle(
                                          color: Colors.white.withOpacity(0.85),
                                          fontSize: 16,
                                          fontFamily: 'CrimsonText',
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ]),
                                  )
                                ],
                              ),
                            )
                          : SizedBox(
                              height: 10,
                              width: 10,
                            );
                    }).toList()),
              ],
            );
          },
        ),
      ],
    );
  }
}
