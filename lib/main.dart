import 'package:flutter/material.dart';
import 'package:home_rent_app/models/homeStay.dart';
import 'package:home_rent_app/views/detailHomeStay.dart';
import 'package:home_rent_app/views/homeScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Home Rent',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: HomeScreen(),
      routes: {
        '/detailHomeStay': (context) {
          HomeStay homeStay = ModalRoute.of(context)!.settings.arguments as HomeStay;
          return DetailHomeStay(homeStay: homeStay);
        }
      },
    );
  }
}
