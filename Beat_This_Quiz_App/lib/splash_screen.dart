import 'dart:io';

import 'package:flutter/material.dart';

import 'main.dart';
import 'no_internet_connection.dart';

class splashScreen extends StatefulWidget {
  const splashScreen({Key? key}) : super(key: key);

  @override
  _splashScreenState createState() => _splashScreenState();
}

class _splashScreenState extends State<splashScreen> {
  @override
  void initState() {
    super.initState();
    TriggerSplashScreen();
  }

  void TriggerSplashScreen() async {
    await Future.delayed(Duration(milliseconds: 500));

    try {
      final result = await InternetAddress.lookup('Google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        print('connected');
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => myQuizApp(),
          ),
        );
      }
    } on SocketException catch (_) {
      print('No Internet Connection');
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => NoInternetConnection(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(0),
        child: AppBar(
          backgroundColor: Colors.amber,
        ),
      ),
      body: Container(
        color: Colors.amber,
        child: const Center(
          child: Padding(
            padding: EdgeInsets.only(top:10),
            child: Text(
              'Loading...',
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 15,
                fontFamily: 'Comfortaa',
                fontStyle: FontStyle.italic,
              ),
            ),
          ),
        ),
      ),
    );
    // return Scaffold();
  }
}