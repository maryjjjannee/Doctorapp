// ignore_for_file: prefer_const_constructors, unused_field, prefer_final_fields, use_build_context_synchronously

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class BookAppointment extends StatefulWidget {
  @override
  _BookAppointmentState createState() => _BookAppointmentState();
}

class _BookAppointmentState extends State<BookAppointment> {
  List<String> appointmentQueue = [];
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = new TextEditingController();
  final TextEditingController _firstnameController =
      new TextEditingController();
  final TextEditingController _lastnameController = new TextEditingController();
  final TextEditingController _ageController = new TextEditingController();
  final TextEditingController _symController = new TextEditingController();
  final List<String> _doctorList = [
    'Dr. Lee Do-Hyun',
    'Dr. Yoo Yeon-Seok',
    'Dr. Lee Jong-Suk',
    'Dr. Seo Hyun-Jin',
    'Dr.Kim Ro-jue'
  ];

  String? _selectedDoctor;
  DateTime? _selectedDateTime;
  
  List<String> _appointmentQueue = [];

  void bookAppointment(
      String doctorName, String date, String time, String status) {
    String appointmentDetails = 'Dr. $doctorName - $date, $time ($status)';
    appointmentQueue.add(appointmentDetails);
  }

  void _bookAppointment() async {
    if (_formKey.currentState!.validate()) {
      try {
        final FirebaseFirestore firestore = FirebaseFirestore.instance;
        final CollectionReference appointments =
            firestore.collection('appointments');
        await appointments.add({
          'firstname': _firstnameController.text.trim(),
          'lastname': _lastnameController.text.trim(),
          'email': _emailController.text.trim(),
          'age': _ageController.text.trim(),
          'symptoms': _symController.text.trim(),
          'doctor': _selectedDoctor,
          'datetime': Timestamp.fromDate(_selectedDateTime!),
          'status': 'pending',
        });
        bookAppointment(
          _selectedDoctor!,
          DateFormat.yMd().format(_selectedDateTime!),
          DateFormat.Hm().format(_selectedDateTime!),
          'pending',
        );
        showDialog(
          context: context,
          builder: (BuildContext context) => AlertDialog(
            title: Text('Appointment Booked'),
            content: Text('Your appointment has been successfully booked.'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  Navigator.of(context).pop({'booked': true});
                },
                child: Text('OK'),
              ),
            ],
          ),
        );
      } catch (e) {
        print('Error: $e');
        showDialog(
          context: context,
          builder: (BuildContext context) => AlertDialog(
            title: Text('Error'),
            content: Text('An error occurred while booking your appointment.'),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: Text('OK'),
              ),
            ],
          ),
        );
      }
    }
  }

  Future<void> _selectDateTime() async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(DateTime.now().year + 1),
    );
    if (picked != null) {
      final TimeOfDay? selectedTime = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.now(),
      );
      if (selectedTime != null) {
        setState(() {
          _selectedDateTime = DateTime(
            picked.year,
            picked.month,
            picked.day,
            selectedTime.hour,
            selectedTime.minute,
          );
        });
      }
    }
  }

  void _selectDoctor(String doctor) {
    setState(() {
      _selectedDoctor = doctor;
    });
    _selectDateTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          'Book Appointment',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ListView.builder(
                shrinkWrap: true,
                itemCount: appointmentQueue.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    title: Text(appointmentQueue[index]),
                  );
                },
              ),
              TextFormField(
                controller: _firstnameController,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your firstname';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  labelText: 'Firstname',
                ),
              ),
              SizedBox(height: 16.0),
              TextFormField(
                controller: _lastnameController,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your lastname';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  labelText: 'Lastname',
                ),
              ),
              SizedBox(height: 16.0),
              TextFormField(
                controller: _emailController,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enteremail';
                  }
                  if (!value.contains('@')) {
                    return 'Please enter a valid email address';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  labelText: 'Email',
                ),
              ),
              SizedBox(height: 16.0),
              TextFormField(
                controller: _ageController,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your age';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  labelText: 'Age',
                ),
              ),
              SizedBox(height: 16.0),
              TextFormField(
                controller: _symController,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your intial symptoms';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  labelText: 'Initial Symptoms',
                ),
              ),
              SizedBox(height: 16.0),
              DropdownButtonFormField(
                value: _selectedDoctor,
                validator: (value) {
                  if (value == null) {
                    return 'Please select a doctor';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  labelText: 'Doctor',
                ),
                items: _doctorList.map((doctor) {
                  return DropdownMenuItem(
                    value: doctor,
                    child: Text(doctor),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    _selectedDoctor = value;
                  });
                },
              ),
              SizedBox(height: 16.0),
              GestureDetector(
                onTap: _selectDateTime,
                child: AbsorbPointer(
                  child: TextFormField(
                    validator: (value) {
                      if (_selectedDateTime == null) {
                        return 'Please select a date and time';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      labelText: 'Date & Time',
                      suffixIcon: Icon(Icons.calendar_today),
                    ),
                    controller: _selectedDateTime == null
                        ? null
                        : TextEditingController(
                            text: DateFormat("EEE, MMM d, yy")
                                .format(_selectedDateTime!),
                          ),
                  ),
                ),
              ),
              SizedBox(height: 32.0),
              ElevatedButton(
                onPressed: _bookAppointment,
                child: Text('Book Appointment'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


