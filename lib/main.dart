// ignore_for_file: prefer_const_constructors, prefer_typing_uninitialized_variables, unused_import, unused_label, use_key_in_widget_constructors, sized_box_for_whitespace, must_be_immutable, unrelated_type_equality_checks, sort_child_properties_last, unused_local_variable, avoid_print, non_constant_identifier_names, body_might_complete_normally_catch_error

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qhos/auth/model.dart';
import 'package:qhos/screen/homescreen.dart';

import 'package:qhos/screen/welcome.dart';


  
void main() async {

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp( )); 
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
       home: WelcomeScreen(),
       theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
     
    );
  }
}




