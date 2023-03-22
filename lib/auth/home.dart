// ignore_for_file: prefer_const_constructors, prefer_typing_uninitialized_variables

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:qhos/screen/docpanel.dart';
import 'package:qhos/screen/patientpanel.dart';

import 'model.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}


class _HomePageState extends State<HomePage> {
  _HomePageState();
  @override
  Widget build(BuildContext context) {
    return contro();
  }
  
}


class contro extends StatefulWidget {
  
  contro();
  
  

  @override
  _controState createState() => _controState();
  
}



class _controState extends State<contro> {
  @override
  void setState(VoidCallback fn) {
    if (mounted) {
      super.setState(fn);
    }
  }
  _controState();
  User? user = FirebaseAuth.instance.currentUser;
  UserModel loggedInUser = UserModel();
  var rooll;
  var emaill;
  var id;
  @override
  void initState() {
    super.initState();
    FirebaseFirestore.instance
        .collection("users") //.where('uid', isEqualTo: user!.uid)
        .doc(user!.uid)
        .get()
        .then((value) {
      this.loggedInUser = UserModel.fromMap(value.data());
    }).whenComplete(() {
      CircularProgressIndicator();
      if (mounted) setState(() {
          emaill = loggedInUser.email.toString();
          rooll = loggedInUser.wrool.toString();
          id = loggedInUser.uid.toString();
        });
      
    });
  }

  route() {
    if (rooll == 'Patient') {
      return Patient(
        id: id,
      );
    } else {
      return Doctor(
        id: id,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    CircularProgressIndicator();
    return route();
  }
}
