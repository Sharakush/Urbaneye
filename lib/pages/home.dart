


import 'package:flutter/material.dart';
import 'package:major_project1/helpers/responsive.dart';
import 'package:major_project1/helpers/style.dart';
import 'package:major_project1/pages/home/wigets/desktop.dart';
import 'package:major_project1/pages/home/wigets/mobile.dart';
import 'package:major_project1/widgets/navbar_desktop.dart';
import 'package:major_project1/widgets/drawer.dart';
import 'package:major_project1/widgets/mobile_navbar.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // Declare the GlobalKey as non-nullable
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    return Scaffold(
      key: scaffoldKey, // Pass the non-nullable scaffold key
      appBar: ResponsiveWidget.isSmallScreen(context)
          // For small screens, use the mobileTopBar wrapped in PreferredSize
          ? PreferredSize(
              preferredSize: Size(screenSize.width, 56), // Mobile app bar height
              child: mobileTopBar(scaffoldKey), // Mobile navbar
            )
          : PreferredSize(
              preferredSize: Size(screenSize.width, 100), // Desktop app bar height
              child: NavBar(), // Desktop navbar
            ),
     // drawer: MobileMenu(), // Mobile menu (drawer)
      backgroundColor: bgColor, // Background color from style
      body: ResponsiveWidget(
        largeScreen: DesktopScreen(), // Desktop screen widget
       // smallScreen: MobileScreen(), // Mobile screen widget
      ),
    );
  }
}
