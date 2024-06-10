// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 100,
          ),
          Image.asset("assets/images/p1.png"),
          SizedBox(
            height: 50,
          ),
          Text(
            "Welcome",
            style: TextStyle(fontSize: 25),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: Text(
              "Wevent arrived to revelutionize the way events are organized. if you work with event organization, Wevent is perfect for you !",
              textAlign: TextAlign.center,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 320, top: 110),
            child: InkWell(
              onTap: () {
                Navigator.pushReplacementNamed(context, "login1");
              },
              child: Text(
                "Next",
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
