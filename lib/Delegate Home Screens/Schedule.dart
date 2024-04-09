import 'package:flutter/material.dart';

class Schedule extends StatefulWidget {
  const Schedule({super.key});

  @override
  State<StatefulWidget> createState() => _Schedule();
}

class _Schedule extends State<Schedule> {
  bool first = true;
  bool second = false;
  bool third = false;
  @override
  Widget build(BuildContext context) {
    return ListView(
        physics: const ScrollPhysics(),
        shrinkWrap: true,
        children: [
          Container(
            height: MediaQuery.of(context).size.height / 10,
            child: Center(
              child: Text("Schedule",
                  style: TextStyle(color: Colors.white, fontSize: 28)),
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height / 40,
          ),
          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            SizedBox(width: MediaQuery.of(context).size.width / 15),
            GestureDetector(
              onTap: (() {
                setState(() {
                  first = true;
                  second = third = false;
                });
              }),
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                width: MediaQuery.of(context).size.width / 6,
                decoration: BoxDecoration(
                  color: first
                      ? Colors.yellow[700]?.withOpacity(0.6)
                      : Colors.transparent,
                  borderRadius: BorderRadius.circular(25),
                  border: Border.all(
                    color: Colors.white,
                    width: 0.2,
                  ),
                ),
                child: Column(
                  children: [
                    Center(
                      child: Text("19",
                          style: TextStyle(
                              color:
                                  first ? Colors.blueGrey[900] : Colors.white,
                              fontSize: 18,
                              fontWeight:
                                  first ? FontWeight.bold : FontWeight.normal,
                              fontFamily: 'CrimsonText')),
                    ),
                    Center(
                      child: Text("Fri",
                          style: TextStyle(
                              color:
                                  first ? Colors.blueGrey[900] : Colors.white,
                              fontSize: 18,
                              fontWeight:
                                  first ? FontWeight.bold : FontWeight.normal,
                              fontFamily: 'CrimsonText')),
                    ),
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: (() {
                setState(() {
                  second = true;
                  first = third = false;
                });
              }),
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                width: MediaQuery.of(context).size.width / 6,
                decoration: BoxDecoration(
                  color: second
                      ? Colors.yellow[700]?.withOpacity(0.6)
                      : Colors.transparent,
                  borderRadius: BorderRadius.circular(25),
                  border: Border.all(
                    color: Colors.white,
                    width: 0.2,
                  ),
                ),
                child: Column(
                  children: [
                    Center(
                      child: Text("20",
                          style: TextStyle(
                              color:
                                  second ? Colors.blueGrey[900] : Colors.white,
                              fontSize: 18,
                              fontWeight:
                                  second ? FontWeight.bold : FontWeight.normal,
                              fontFamily: 'CrimsonText')),
                    ),
                    Center(
                      child: Text("Sat",
                          style: TextStyle(
                              color:
                                  second ? Colors.blueGrey[900] : Colors.white,
                              fontSize: 18,
                              fontWeight:
                                  second ? FontWeight.bold : FontWeight.normal,
                              fontFamily: 'CrimsonText')),
                    ),
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: (() {
                setState(() {
                  third = true;
                  first = second = false;
                });
              }),
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                width: MediaQuery.of(context).size.width / 6,
                decoration: BoxDecoration(
                  color: third
                      ? Colors.yellow[700]?.withOpacity(0.6)
                      : Colors.transparent,
                  borderRadius: BorderRadius.circular(25),
                  border: Border.all(
                    color: Colors.white,
                    width: 0.2,
                  ),
                ),
                child: Column(
                  children: [
                    Center(
                      child: Text("21",
                          style: TextStyle(
                              color:
                                  third ? Colors.blueGrey[900] : Colors.white,
                              fontSize: 18,
                              fontWeight:
                                  third ? FontWeight.bold : FontWeight.normal,
                              fontFamily: 'CrimsonText')),
                    ),
                    Center(
                      child: Text("Sun",
                          style: TextStyle(
                              color:
                                  third ? Colors.blueGrey[900] : Colors.white,
                              fontSize: 18,
                              fontWeight:
                                  third ? FontWeight.bold : FontWeight.normal,
                              fontFamily: 'CrimsonText')),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(width: MediaQuery.of(context).size.width / 15),
          ]),
          Container(
            height: MediaQuery.of(context).size.height / 25,
          ),
          Stack(
            children: [
              AnimatedOpacity(
                opacity: first ? 1 : 0,
                duration: Duration(
                  milliseconds: 300,
                ),
                child: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 10,
                  ),
                  height: MediaQuery.of(context).size.height / 2.3,
                  decoration: BoxDecoration(
                    color: Colors.blueGrey[900],
                    borderRadius: BorderRadius.circular(25),
                  ),
                  margin: EdgeInsets.symmetric(
                    horizontal: 30,
                  ),
                  child: ListView(
                      physics: const ScrollPhysics(),
                      shrinkWrap: true,
                      children: [
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            SizedBox(
                              width: 35,
                            ),
                            Container(
                              height: MediaQuery.of(context).size.height / 20,
                              child: Text(
                                "April 19th Friday",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontFamily: 'Lato'),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Center(
                          child: Text(
                            "Delegate Check-In",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontFamily: 'Lato'),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Center(
                          child: Text(
                            "3:00 PM- 6:00 PM",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontFamily: 'Lato'),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Divider(
                          color: Colors.white,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Center(
                          child: Text(
                            "Opening Ceremonies",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontFamily: 'Lato'),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Center(
                          child: Text(
                            "6:00 PM- 7:00 PM",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontFamily: 'Lato'),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Divider(
                          color: Colors.white,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Center(
                          child: Text(
                            "Committee Session I",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontFamily: 'Lato'),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Center(
                          child: Text(
                            "7:00 PM- 10:00 PM",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontFamily: 'Lato'),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                      ]),
                ),
              ),
              AnimatedOpacity(
                opacity: second ? 1 : 0,
                duration: Duration(
                  milliseconds: 300,
                ),
                child: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 10,
                  ),
                  height: MediaQuery.of(context).size.height / 1.55,
                  decoration: BoxDecoration(
                    color: Colors.blueGrey[900],
                    borderRadius: BorderRadius.circular(25),
                  ),
                  margin: EdgeInsets.symmetric(
                    horizontal: 30,
                  ),
                  child: ListView(
                      physics: const ScrollPhysics(),
                      shrinkWrap: true,
                      children: [
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            SizedBox(
                              width: 35,
                            ),
                            Container(
                              height: MediaQuery.of(context).size.height / 20,
                              child: Text(
                                "April 20th Saturday",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontFamily: 'Lato'),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Center(
                          child: Text(
                            "Committee Session II",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontFamily: 'Lato'),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Center(
                          child: Text(
                            "9:00 AM - 12:00 PM",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontFamily: 'Lato'),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Divider(
                          color: Colors.white,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Center(
                          child: Text(
                            "Lunch Break",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontFamily: 'Lato'),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Center(
                          child: Text(
                            "12:00 PM - 2:00 PM",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontFamily: 'Lato'),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Divider(
                          color: Colors.white,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Center(
                          child: Text(
                            "Committee Session III",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontFamily: 'Lato'),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Center(
                          child: Text(
                            "2:00 PM - 6:00 PM",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontFamily: 'Lato'),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Divider(
                          color: Colors.white,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Center(
                          child: Text(
                            "Dinner Break",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontFamily: 'Lato'),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Center(
                          child: Text(
                            "6:00 PM - 7:30 PM",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontFamily: 'Lato'),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Divider(
                          color: Colors.white,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Center(
                          child: Text(
                            "Committee Session IV",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontFamily: 'Lato'),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Center(
                          child: Text(
                            "7:30 PM - 10:00 PM",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontFamily: 'Lato'),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                      ]),
                ),
              ),
              AnimatedOpacity(
                opacity: third ? 1 : 0,
                duration: Duration(
                  milliseconds: 300,
                ),
                child: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 10,
                  ),
                  height: MediaQuery.of(context).size.height / 3,
                  decoration: BoxDecoration(
                    color: Colors.blueGrey[900],
                    borderRadius: BorderRadius.circular(25),
                  ),
                  margin: EdgeInsets.symmetric(
                    horizontal: 30,
                  ),
                  child: ListView(
                      physics: const ScrollPhysics(),
                      shrinkWrap: true,
                      children: [
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            SizedBox(
                              width: 35,
                            ),
                            Container(
                              height: MediaQuery.of(context).size.height / 20,
                              child: Text(
                                "April 21st Sunday",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontFamily: 'Lato'),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Center(
                          child: Text(
                            "Committee Session V",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontFamily: 'Lato'),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Center(
                          child: Text(
                            "10:00 AM - 11:30 AM",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontFamily: 'Lato'),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Divider(
                          color: Colors.white,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Center(
                          child: Text(
                            "Closing Ceremonies",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontFamily: 'Lato'),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Center(
                          child: Text(
                            "11:30 AM - 1:30 PM",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontFamily: 'Lato'),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                      ]),
                ),
              ),
            ],
          ),
        ]);
  }
}
