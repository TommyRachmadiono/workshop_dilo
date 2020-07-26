import 'dart:async';

import 'package:flutter/material.dart';
import 'package:workshop_dilo/login_screen.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _timer();
  }

  void _timer() {
    Timer(Duration(seconds: 3), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => LoginScreen()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.network(
              'http://pngimg.com/uploads/cat/cat_PNG50534.png',
              width: 150,
            ),
            Container(
              child: Text(
                'Kucing',
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.indigo),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
