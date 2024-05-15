import 'dart:async';
import 'package:e_commerce/home/welcome/welcome.dart';
import 'package:flutter/material.dart';

class Splach extends StatefulWidget {
  const Splach({super.key});

  @override
  State<Splach> createState() => _SplachState();
}

class _SplachState extends State<Splach> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(
      Duration(seconds: 5),
      () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => WelcomeScreen(),
          ),
        );
      },
    );
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF007E6E),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Stack(
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.white,
                    child: Container(
                      height: 60,
                      child: Center(
                        child: Image.asset(
                          "assets/icons/coffee-cup.png",
                          color: Color(0xFF007E6E),
                        ),
                      ),
                    ),
                    radius: 40,
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 20),
          Text(
            "Coffee Shop",
            style: TextStyle(
                fontSize: 30,
                color: Color(0xFFf6f6f6),
                fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }
}
