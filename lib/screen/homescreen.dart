// ignore_for_file: prefer_const_constructors, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:lottie/lottie.dart';
import 'package:qhos/screen/doclist.dart';

import 'package:qhos/screen/patientpanel.dart';
import 'package:qhos/screen/report.dart';
import 'package:qhos/util/category_card.dart';
import 'package:qhos/util/doctor_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String? id;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      bottomNavigationBar: GNav(
        gap: 8,
        // ignore: prefer_const_literals_to_create_immutables
        tabs: [
          GButton(
            icon: Icons.home,
            text: 'Home',
          ),
          GButton(
            icon: Icons.search,
            text: 'Booking',
            onPressed: () {
              CircularProgressIndicator();
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DocList(),
                ),
              );
            },
          ),
          GButton(
            icon: Icons.favorite_border,
            text: 'Report',
             onPressed: () {
              CircularProgressIndicator();
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AppointmentQueue(),
                ),
              );
            },
          ),
          GButton(
            icon: Icons.person,
            text: 'Profile',
            onPressed: () {
              CircularProgressIndicator();
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Patient(id: id),
                ),
              );
            },
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    // ignore: prefer_const_literals_to_create_immutables
                    children: [
                      Text(
                        "Hello ,",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Text(
                        "Mary Jane ",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                    ],
                  ),
                  Container(
                      padding: EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Colors.blue[100],
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Icon(
                        Icons.person,
                      )),
                ],
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 25),
              child: Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.pink[100],
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(children: [
                  Container(
                    height: 100,
                    width: 100,
                    child: Lottie.network(
                        'https://assets1.lottiefiles.com/packages/lf20_42B8LS.json'),
                    color: Colors.blue[100],
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'How do you feel?',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          'Fill out your medical card right now',
                          style: TextStyle(fontSize: 14),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Container(
                          padding: EdgeInsets.all(12),
                          decoration: BoxDecoration(
                              color: Colors.blue[300],
                              borderRadius: BorderRadius.circular(12)),
                          child: Center(
                              child: Text(
                            'Get Started',
                            style: TextStyle(color: Colors.white),
                          )),
                        )
                      ],
                    ),
                  )
                ]),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Container(
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                    color: Colors.blue[100],
                    borderRadius: BorderRadius.circular(12)),
                child: TextField(
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.search),
                    border: InputBorder.none,
                    hintText: 'How can we help you?',
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              height: 70,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  CategoryCard(
                    CategoryName: 'Dentist',
                    iconImagePath: 'lib/icon/tooth.png',
                  ),
                  CategoryCard(
                    CategoryName: 'Acne',
                    iconImagePath: 'lib/icon/acne.png',
                  ),
                  CategoryCard(
                    CategoryName: 'Surgeon',
                    iconImagePath: 'lib/icon/surgeon.png',
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 22),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  Text(
                    'Doctor list',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      CircularProgressIndicator();
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DocList(),
                        ),
                      );
                    },
                    child: Text(
                      'See all',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey[500],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Expanded(
              child: Container(
                height: 80,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    DoctorCard(
                      doctorImagePath: 'lib/images/doctor1.png',
                      rating: '4.9',
                      doctorName: 'Dr.Lee Do-Hyun',
                      doctorProfression: 'Therapist',
                    ),
                    DoctorCard(
                      doctorImagePath: 'lib/images/doctor2.png',
                      rating: '4.4',
                      doctorName: 'Dr.Yoo Yeon-Seok',
                      doctorProfression: 'Psychologist',
                    ),
                    DoctorCard(
                      doctorImagePath: 'lib/images/doctor3.png',
                      rating: '5.0',
                      doctorName: 'Dr.Lee Jong-Suk',
                      doctorProfression: 'Surgeon',
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
