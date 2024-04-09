import 'package:flutter/material.dart';
import 'package:flutter_project_ideas/Delegate%20Home%20Screens/separator.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'HomePage.dart';
import 'Schedule.dart';
import 'SettingsPage.dart';
import 'deldocs.dart';
import 'logo.dart';

class Framework extends StatefulWidget {
  final String name;
  final String email;
  final String committee;
  final String position;
  //final String position;
  const Framework({
    super.key,
    required this.name,
    required this.email,
    required this.committee,
    required this.position,
    //required this.position
  });

  @override
  State<StatefulWidget> createState() => _Framework();
}

class _Framework extends State<Framework> {
  int _selectedIndex = 0;
  late final PageController _pageController = PageController(initialPage: 0);
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: MaterialApp(
        home: SafeArea(
            child: Scaffold(
          appBar: AppBar(
            title: logo(),
            backgroundColor: Colors.black26,
          ),
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
                  const Divider(
                    color: Colors.grey,
                  ),
                  HomePage(
                    name: widget.name,
                    email: widget.email,
                  ),
                ],
              ),
              ListView(
                children: [
                  const Divider(
                    color: Colors.grey,
                  ),
                  Schedule(),
                ],
              ),
              ListView(
                children: [
                  const Divider(
                    color: Colors.grey,
                  ),
                  deldocs(
                    committeename: widget.committee,
                  ),
                ],
              ),
              ListView(
                children: [
                  const Divider(
                    color: Colors.grey,
                  ),
                  SettingsPage(
                    name: widget.name,
                    email: widget.email,
                    committee: widget.committee,
                    position: widget.position,
                  ),
                ],
              ),
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
            duration:
                const Duration(milliseconds: 400), // tab animation duration
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
                icon: Icons.home,
                text: 'Home',
              ),
              GButton(
                icon: Icons.list_alt,
                text: 'Itinerary',
              ),
              GButton(
                icon: Icons.file_copy_outlined,
                text: 'Docs',
              ),
              GButton(
                icon: Icons.settings,
                text: 'Settings',
              )
            ],
            onTabChange: (index) {
              _pageController.jumpToPage(index);
            },
          ),
        )),
      ),
    );
  }
}
