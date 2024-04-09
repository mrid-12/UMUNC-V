import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class peopleView extends StatefulWidget {
  final dynamic stream;
  final String committee;
  final String image;
  const peopleView(
      {super.key,
      required this.stream,
      required this.committee,
      required this.image});

  @override
  State<StatefulWidget> createState() => _peopleView();
}

class _peopleView extends State<peopleView> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        image: DecorationImage(
          image: AssetImage(widget.image),
          colorFilter: ColorFilter.mode(Colors.black54, BlendMode.darken),
          fit: BoxFit.cover,
        ),
      ),
      child: ExpansionTile(
          backgroundColor: Colors.blueGrey[700],
          collapsedShape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          title: Stack(children: [
            Center(
              child: Text(widget.committee,
                  style: TextStyle(
                      fontSize: 25,
                      color: Colors.white,
                      fontFamily: 'CrimsonText')),
            ),
          ]),
          children: [
            widget.stream is Stream<QuerySnapshot<Object?>>
                ? StreamBuilder<QuerySnapshot>(
                    stream: widget.stream,
                    builder: (BuildContext context,
                        AsyncSnapshot<QuerySnapshot> snapshot) {
                      if (snapshot.hasError) {
                        return const Text('Something went wrong',
                            style:
                                TextStyle(fontSize: 30, color: Colors.white));
                      }

                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Container(
                            child: const CircularProgressIndicator());
                      }

                      return ListView(
                        physics: const ScrollPhysics(),
                        shrinkWrap: true,
                        children: snapshot.data!.docs
                            .map((DocumentSnapshot document) {
                          return ListTile(
                            dense: true,
                            leading: Icon(
                              Icons.person,
                              color: document['registered']
                                  ? Colors.white
                                  : Colors.red,
                              size: 25,
                            ),
                            title: ExpansionTile(
                                title: Center(
                                  child: Text(
                                    document.id,
                                    style: TextStyle(
                                        fontSize: 18,
                                        color: document['registered']
                                            ? Colors.white
                                            : Colors.red[200]),
                                  ),
                                ),
                                children: [
                                  Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        //document.get('Unregistered') != ""?
                                        Container(
                                          margin: EdgeInsets.only(top: 10),
                                          child: document['registered']
                                              ? Text(
                                                  'Name: ${document['name']}\n'
                                                  'Email: ${document['email']}\n'
                                                  'High School: ${document['high school']}\n'
                                                  'Grade: ${document['grade']}\n',
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 18,
                                                  ),
                                                )
                                              : Container(
                                                  margin: EdgeInsets.all(20),
                                                  child: Text(
                                                    'Not Registered',
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 18,
                                                    ),
                                                  ),
                                                ),
                                        )
                                      ]),
                                ]),
                          );
                        }).toList(),
                      );
                    },
                  )
                : ListView(
                    physics: const ScrollPhysics(),
                    shrinkWrap: true,
                    children: [
                        ExpansionTile(
                          backgroundColor: Colors.blueGrey[700],
                          title: Text('Indian National Congress',
                              style:
                                  TextStyle(fontSize: 18, color: Colors.white)),
                          children: [
                            StreamBuilder<QuerySnapshot>(
                              stream: widget.stream
                                  .doc('Users')
                                  .collection('Indian National Congress')
                                  .snapshots(),
                              builder: (BuildContext context,
                                  AsyncSnapshot<QuerySnapshot> snapshot) {
                                if (snapshot.hasError) {
                                  return const Text('Something went wrong',
                                      style: TextStyle(
                                          fontSize: 30, color: Colors.white));
                                }

                                if (snapshot.connectionState ==
                                    ConnectionState.waiting) {
                                  return Container(
                                      child: const CircularProgressIndicator());
                                }

                                return ListView(
                                  physics: ScrollPhysics(),
                                  shrinkWrap: true,
                                  children: snapshot.data!.docs
                                      .map((DocumentSnapshot document) {
                                    return ListTile(
                                      dense: true,
                                      leading: Icon(
                                        Icons.person,
                                        color: document['registered']
                                            ? Colors.white
                                            : Colors.red,
                                        size: 25,
                                      ),
                                      title: ExpansionTile(
                                          title: Center(
                                            child: Text(
                                              document.id,
                                              style: TextStyle(
                                                fontSize: 18,
                                                color: document['registered']
                                                    ? Colors.white
                                                    : Colors.red[200],
                                              ),
                                            ),
                                          ),
                                          children: [
                                            Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  //document.get('Unregistered') != ""?
                                                  document['registered']
                                                      ? Container(
                                                          margin:
                                                              EdgeInsets.only(
                                                                  top: 10),
                                                          child: Text(
                                                            'Name: ${document['name']}\n'
                                                            'Email: ${document['email']}\n'
                                                            'High School: ${document['high school']}\n'
                                                            'Grade: ${document['grade']}\n',
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.white,
                                                              fontSize: 18,
                                                            ),
                                                          ),
                                                        )
                                                      : Container(
                                                          margin:
                                                              EdgeInsets.all(
                                                                  20),
                                                          child: Text(
                                                            'Not Registered',
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.white,
                                                              fontSize: 18,
                                                            ),
                                                          ),
                                                        ),
                                                ]),
                                          ]),
                                    );
                                  }).toList(),
                                );
                              },
                            ),
                          ],
                        ),
                        ExpansionTile(
                          backgroundColor: Colors.blueGrey[700],
                          title: Text('The British Raj',
                              style:
                                  TextStyle(fontSize: 18, color: Colors.white)),
                          children: [
                            StreamBuilder<QuerySnapshot>(
                              stream: widget.stream
                                  .doc('Users')
                                  .collection('British Raj')
                                  .snapshots(),
                              builder: (BuildContext context,
                                  AsyncSnapshot<QuerySnapshot> snapshot) {
                                if (snapshot.hasError) {
                                  return const Text('Something went wrong',
                                      style: TextStyle(
                                          fontSize: 30, color: Colors.white));
                                }

                                if (snapshot.connectionState ==
                                    ConnectionState.waiting) {
                                  return Container(
                                      child: const CircularProgressIndicator());
                                }

                                return ListView(
                                  physics: const ScrollPhysics(),
                                  shrinkWrap: true,
                                  children: snapshot.data!.docs
                                      .map((DocumentSnapshot document) {
                                    return ListTile(
                                      dense: true,
                                      leading: Icon(
                                        Icons.person,
                                        color: document['registered']
                                            ? Colors.white
                                            : Colors.red,
                                        size: 25,
                                      ),
                                      title: ExpansionTile(
                                          title: Center(
                                            child: Text(
                                              document.id,
                                              style: TextStyle(
                                                  fontSize: 18,
                                                  color: document['registered']
                                                      ? Colors.white
                                                      : Colors.red[200]),
                                            ),
                                          ),
                                          children: [
                                            Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  //document.get('Unregistered') != ""?
                                                  document['registered']
                                                      ? Container(
                                                          margin:
                                                              EdgeInsets.only(
                                                                  top: 10),
                                                          child: Text(
                                                            'Name: ${document['name']}\n'
                                                            'Email: ${document['email']}\n'
                                                            'High School: ${document['high school']}\n'
                                                            'Grade: ${document['grade']}\n',
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.white,
                                                              fontSize: 18,
                                                            ),
                                                          ),
                                                        )
                                                      : Container(
                                                          margin:
                                                              EdgeInsets.all(
                                                                  20),
                                                          child: Text(
                                                            'Not Registered',
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.white,
                                                              fontSize: 18,
                                                            ),
                                                          ),
                                                        ),
                                                ]),
                                          ]),
                                    );
                                  }).toList(),
                                );
                              },
                            ),
                          ],
                        ),
                      ]),
          ]),
    );
  }
}
