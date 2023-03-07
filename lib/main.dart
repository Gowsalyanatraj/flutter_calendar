// ignore_for_file: prefer_interpolation_to_compose_strings

import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  DateTime today = DateTime.now();

  void _onDaySelected(DateTime day, DateTime focusedDay) {
    setState(() {
      today = day;
    });
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      body: content(),
    );
  }

  @override
  Widget content() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(1000.0, 20.0, 0.0, 0.0),
          child: Text(
            "Selected day = " + today.toString().split(" ")[0],
            style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
                color: Colors.green),
          ),
        ),
        SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.fromLTRB(1000, 0, 100, 0),
          child: Container(
            decoration: BoxDecoration(
                color: Colors.purple.shade100,
                borderRadius: BorderRadius.circular(15)),
            height: 400,
            width: 500,
            //color: Colors.purple.shade50,
            child: TableCalendar(
              locale: "en_US",
              //rowHeight: 30,
              headerStyle:
                  HeaderStyle(formatButtonVisible: false, titleCentered: true),
              availableGestures: AvailableGestures.all,
              selectedDayPredicate: (day) => isSameDay(day, today),
              focusedDay: today,
              firstDay: DateTime.utc(2010, 10, 16),
              lastDay: DateTime.utc(2030, 3, 14),
              onDaySelected: _onDaySelected,
            ),
          ),
        ),
      ],
    );
  }
}

//void setState(Null Function() param0) {}
