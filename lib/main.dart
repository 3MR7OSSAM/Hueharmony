
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sams_web/HomeView/HomeView.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:sams_web/firebase_options.dart';

void main()async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
      return MaterialApp(
        theme: ThemeData(
          fontFamily: 'Poppins',
        ),

        debugShowCheckedModeBanner: false,
        home:  HomeView(),
      );

  }
}
