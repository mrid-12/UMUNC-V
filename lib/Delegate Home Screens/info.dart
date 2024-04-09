import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../LoginPage/loginpage.dart';
import 'Committee.dart';

class DelegateInfo extends StatefulWidget {
  final String name;
  final String email;
  DelegateInfo({
    Key? key,
    required this.name,
    required this.email,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _DelegateInfo();
}

class _DelegateInfo extends State<DelegateInfo> {
  static const List<String> highschoollist = <String>[
    'Archbishop Curley High School',
    'Arundel High School',
    'Baltimore City College High School',
    'Baltimore Polytechnic Institute',
    'Battlefield High School',
    'Bethesda- Chevy Chase',
    'Bishop Ireton High School',
    'Blue Ridge Governors School',
    'Bowie High School',
    'Brooke Point High School',
    'Brookewood School',
    'Calvert Hall College',
    'Catonsville High School',
    'Centennial High School',
    'Centreville High School',
    'Chantilly High School',
    'Chopticon High School',
    'Colonial Forge High School',
    'Eleanor Roosevelt High School',
    'Edison High School (VA)',
    'Fairfax high School',
    'Falls Church High School',
    'Forest Park High School',
    'Foxcroft School',
    'Frederick High School',
    'George Washington Carver Center for A&T',
    'Gonzaga College High School',
    'Good Council High School',
    'Hereford High School',
    'Herndon High School',
    'High Point High School',
    'Howard High School',
    'James Hubert Blake High School',
    'John Champe High School',
    'JRT ModelUN',
    'Kettle Run High School',
    'Langley High School',
    'La Plata High School',
    'Laurel High School',
    'Lancaster Country Day School',
    'Loch Raven High School',
    'Long Reach High School',
    'Marshall High School',
    'McLean High School',
    'Mount de Sales',
    'Northwest High School',
    'Northwestern High School',
    'Oakton High School',
    'Osbourn Park High School',
    'Park View High School',
    'Poolesville High School',
    'Rachel Carson Middle School',
    'Richard Montgomery High School',
    'Rock Ridge High School',
    'Rockville High School',
    'Saint James School',
    'Severn School',
    'Severna Park High School',
    'South River High School',
    'St. Charles High School',
    'St. Johns College High School',
    'St. Vincent Pallotti HS',
    'Stone Bridge High School',
    'The Catholic High School of Baltimore',
    'Thomas Jefferson High School (VA)',
    'Thomas Jefferson Middle School',
    'Towson High School',
    'Tuscarora High School',
    'Urbana High School',
    'Walt Whitman High School',
    'Washington International School',
    'Wheaton High School',
    'Winston Churchill high School',
    'Wooton High School',
    'Yorktown High School',
    'Other (Type your school name below)'
  ];
  static const List<String> gradelist = <String>[
    'Freshman',
    'Sophomore',
    'Junior',
    'Senior',
    'Other',
  ];
  TextEditingController highschool = TextEditingController();
  TextEditingController newSchool = TextEditingController();
  bool isNewSchool = false;
  String gradeselection = gradelist.first;

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
        maintainBottomViewPadding: false,
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: Colors.grey[900],
          body: Stack(
            children: [
              Column(
                children: [
                  SizedBox(height: MediaQuery.of(context).size.height / 7),
                  const Text(
                    "Choose your High School",
                    style: TextStyle(
                      fontSize: 28,
                      color: Colors.white,
                      fontFamily: 'CrimsonText',
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height / 30),
                  Container(
                    margin: EdgeInsets.all(20),
                    child: DropdownMenu<String>(
                      controller: highschool,
                      menuHeight: MediaQuery.of(context).size.height / 3,
                      width: MediaQuery.of(context).size.width - 40,
                      label: const Text('High School',
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
                      dropdownMenuEntries: highschoollist
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
                                    MaterialStateProperty.resolveWith(getColor),
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Colors.grey[700]!),
                              ),
                            ),
                          )
                          .toList(),
                      onSelected: (String? s) {
                        if (s == 'Other (Type your school name below)') {
                          setState(
                            () {
                              isNewSchool = true;
                            },
                          );
                        } else {
                          setState(
                            () {
                              isNewSchool = false;
                            },
                          );
                        }
                      },
                    ),
                  ),
                  AnimatedOpacity(
                    opacity: isNewSchool ? 1 : 0,
                    duration: Duration(seconds: 1),
                    curve: Curves.linear,
                    child: Container(
                      margin: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Colors.grey[600]?.withOpacity(0.5),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: TextField(
                        controller: newSchool,
                        enabled: isNewSchool,
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
                          hintText: 'Other School: ',
                          prefixIcon:
                              Icon(Icons.school, size: 28, color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height / 18),
                  const Text(
                    "Choose your Grade",
                    style: TextStyle(
                      fontSize: 28,
                      color: Colors.white,
                      fontFamily: 'CrimsonText',
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height / 30),
                  Container(
                    margin: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.blueGrey.withOpacity(0.6),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: EdgeInsets.fromLTRB(18, 5, 18, 5),
                    child: DropdownButton<String>(
                      style: TextStyle(
                        color: Colors.white,
                      ),
                      dropdownColor: Colors.grey[700],
                      value: gradeselection,
                      onChanged: (String? f) {
                        setState(
                          () {
                            gradeselection = f!;
                          },
                        );
                      },
                      items: gradelist.map<DropdownMenuItem<String>>(
                        (String f) {
                          return DropdownMenuItem<String>(
                            value: f,
                            child: Text(f),
                          );
                        },
                      ).toList(),
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height / 18),
                  FilledButton(
                    onPressed: () {
                      if (highschool.text.isEmpty) {
                        Fluttertoast.showToast(
                            msg: 'Please select a highschool');
                      } else if (gradeselection.isEmpty) {
                        Fluttertoast.showToast(msg: 'Please select a grade');
                      } else if (isNewSchool && newSchool.text.isEmpty) {
                        Fluttertoast.showToast(
                            msg: 'Please type your school name');
                      } else {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Committee(
                              name: widget.name,
                              email: widget.email,
                              highschool: isNewSchool
                                  ? newSchool.text
                                  : highschool.text,
                              grade: gradeselection,
                            ),
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
                              builder: (context) => const WelcomeScreen()));
                    },
                    icon: const Icon(Icons.keyboard_double_arrow_left_sharp,
                        color: Colors.white, size: 45)),
              )
            ],
          ),
        ),
      ),
    );
  }
}
