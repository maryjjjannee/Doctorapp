import 'package:flutter/material.dart';

class UserModel extends ChangeNotifier{
  String? email;
  String? wrool;
  String? uid;
  String? firstname;
  String? lastname;
  String? age;
  

// receiving data
  UserModel({this.uid, this.email, this.wrool, this.firstname, this.lastname,this.age});
  factory UserModel.fromMap(map) {
    return UserModel(
      uid: map['uid'],
      email: map['email'],
      firstname: map['firstname'],
      lastname: map['lastname'],
      age: map['age'],
      wrool: map['wrool'],
    );
  }
// sending data
  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'email': email,
      'firstname': firstname,
      'lastname': lastname,
      'age': age,
      'wrool': wrool,
    };
  }
}

class Queue {
  String queueId;
  UserModel user;
  DateTime dateTime;
  String doctor;
  String status;
  int queueNumber;
  bool cancelled;

  Queue({
    required this.queueId,
    required this.user,
    required this.dateTime,
    required this.doctor,
    required this.status,
    required this.queueNumber,
    required this.cancelled,
  });

  Map<String, dynamic> toMap() {
    return {
      'queueID': queueId,
      'user': user,
      'dateTime': dateTime,
      'doctor': doctor,
      'status': status,
      'queueNumber': queueNumber,
      'cancelled':cancelled,
    };
  }
}

