
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:major_project1/login.dart';
import 'package:major_project1/pages/home.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: FirebaseOptions(
      apiKey: "AIzaSyDcLcJMDdx2zn4O8rrJiwKMueIdQ12r-JY",
      projectId: "webproject-7ddb1",
      messagingSenderId: "472005492671",
      appId: "1:472005492671:web:5c0494e46dc318e8cbab0a",
    ),
  );

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Web',
      theme: ThemeData(visualDensity: VisualDensity.adaptivePlatformDensity),
      home: LoginPage(),
    );
  }
}

  


