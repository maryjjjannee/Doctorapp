// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:qhos/screen/booking.dart';
import 'package:qhos/util/doctor_card.dart';

class DocList extends StatefulWidget {
  const DocList({super.key});

  @override
  State<DocList> createState() => _DocListState();
}

class _DocListState extends State<DocList> {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Scaffold(
          
          backgroundColor: Colors.grey[300],
          appBar: AppBar(
            backgroundColor: Colors.black,
            title: Text(
              'Doctor List',
              style: TextStyle(color: Colors.white),
            ),
          ),
          body: SafeArea(
            child: SingleChildScrollView(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                  Container(
                    width: 1000,
                    child: Card(
                      elevation: 10,
                      color: Colors.blue[100],
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Image.asset(
                              'lib/images/doctor1.png',
                              height: 150,
                            ),
                            SizedBox(height: 20),
                            Text(
                              'Dr.Lee Do-Hyun',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 18),
                            ),
                            SizedBox(height: 20),
                            Text(
                              'Therapist ' + '7 y.e ',
                            ),
                           
                          
                            SizedBox(height: 50),
                            Image.asset(
                              'lib/images/doctor2.png',
                              height: 150,
                            ),
                            SizedBox(height: 20),
                            Text(
                              'Dr.Yoo Yeon-Seok',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 18),
                            ),
                            SizedBox(height: 20),
                            Text('Psychologist ' + '7 y.e '),
                          
                            SizedBox(height: 50),
                            Image.asset(
                              'lib/images/doctor3.png',
                              height: 150,
                            ),
                            SizedBox(height: 20),
                            Text(
                              'Dr.Lee Jong-Suk',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 18),
                            ),
                            SizedBox(height: 20),
                            Text('Surgeon ' + '7 y.e '),
                          
                            SizedBox(height: 50),
                            Image.asset(
                              'lib/images/doctor4.png',
                              height: 150,
                            ),
                            SizedBox(height: 20),
                            Text(
                              'Dr.Seo Hyun-Jin ',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 18),
                            ),
                            SizedBox(height: 20),
                            Text('Dermatologist ' + '7 y.e '),

                            SizedBox(height: 50),
                            Image.asset(
                              'lib/images/doctor5.png',
                              height: 150,
                            ),
                            SizedBox(height: 20),
                            Text(
                              'Dr.Kim Ro-jue ',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 18),
                            ),
                            SizedBox(height: 20),
                            Text('Pediatrician ' + '7 y.e '),
                            SizedBox(height: 50),
                              Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                MaterialButton(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(20.0),
                                    ),
                                  ),
                                  elevation: 5.0,
                                  height: 40,
                                  onPressed: () {
                                    CircularProgressIndicator();
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => BookAppointment(),
                                      ),
                                    );
                                    SizedBox(
                                      height: 20,
                                    );
                                  },
                                  child: Container(
                                    padding: EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    child: Text(
                                      "Appointment",
                                      style: TextStyle(
                                        fontSize: 18,
                                      ),
                                    ),
                                  ),
                                  color: Colors.grey,
                                ),
                                
                              ],
                            ),
                             SizedBox(
                                      height: 30,
                                    ),
                           
                          ],
                        ),
                      ),
                      // ignore: sort_child_properties_last
                    ),
                  ),
                ])),
          ),
        ));
        
  }

}
