// ignore_for_file: prefer_const_constructors, prefer_interpolation_to_compose_strings, sort_child_properties_last, use_key_in_widget_constructors, prefer_adjacent_string_concatenation, no_logic_in_create_state

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:qhos/screen/loginpage.dart';

import '../auth/model.dart';

class Doctor extends StatefulWidget {
  String? id;
  Doctor({required this.id});
  @override
  _DoctorState createState() => _DoctorState(id: id);
}


class _DoctorState extends State<Doctor> {
  String? id;
  var rooll;
  var emaill;
  UserModel loggedInUser = UserModel();

  _DoctorState({required this.id});
  @override

  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 4,
          child: Container(
            width: double.infinity,
            child: Column(
              children: const <Widget>[
                SizedBox(
                  height: 110,
                ),
                
                SizedBox(
                  height: 10,
                ),
                
                SizedBox(
                  height: 10,
                ),
                
              ],
            ),
          ),
        ),
      ],
    );
  }
}

Future<void> logout(BuildContext context) async {
  CircularProgressIndicator();
  await FirebaseAuth.instance.signOut();

  Navigator.of(context).pushReplacement(
    MaterialPageRoute(
      builder: (context) => LoginPage(),
    ),
  );
}
