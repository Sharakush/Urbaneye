

import 'package:flutter/material.dart';
import 'package:major_project1/helpers/style.dart'; // Corrected import for style.dart

Widget mobileTopBar(GlobalKey<ScaffoldState>? key) => AppBar(
  leading: IconButton(
    icon: Icon(Icons.menu, color: active), // Ensure active color is defined
    onPressed: () {
      if (key?.currentState != null) {
        key!.currentState!.openDrawer(); // Safely open the drawer
      }
    },
  ),
  title: Image.asset("assets/images/logo.png"), // Your logo image
  centerTitle: true,
  elevation: 0,
  backgroundColor: bgColor, // Ensure bgColor is defined
);
