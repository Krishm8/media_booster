// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:media_booster/controller/home_provider.dart';
import 'package:provider/provider.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  GlobalKey<FormState> skey = GlobalKey<FormState>();
  TextEditingController namecontroller = TextEditingController();
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController bodcontroller = TextEditingController();
  TextEditingController phonecontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10),
        child: SingleChildScrollView(
          child: Form(
            key: skey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 20,
                ),
                Text(
                  "SignIn",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text("Create an account to continue!"),
                SizedBox(
                  height: 30,
                ),
                TextFormField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Please Enter Full Name";
                    }
                  },
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.name,
                  controller: namecontroller,
                  decoration: InputDecoration(
                    hintText: "Full Name",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Please Enter Email";
                    } else if (!value.contains("@") || !value.contains(".com")) {
                      return "Please Enter Valid Email Address";
                    } else {
                    }
                  },
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.emailAddress,
                  controller: emailcontroller,
                  decoration: InputDecoration(
                    hintText: "Email",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  keyboardType: TextInputType.datetime,
                  textInputAction: TextInputAction.next,
                  controller: bodcontroller,
                  decoration: InputDecoration(
                    suffixIcon: Icon(Icons.calendar_month),
                    hintText: "Birth of date",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Please Enter Phone Number";
                    }
                  },
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.phone,
                  controller: phonecontroller,
                  decoration: InputDecoration(
                    hintText: "Phone Number",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Please Set Password";
                    }
                  },
                  keyboardType: TextInputType.visiblePassword,
                  controller: passwordcontroller,
                  decoration: InputDecoration(
                    suffixIcon: Icon(Icons.visibility),
                    hintText: "Set Password",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                InkWell(
                  onTap: () {
                    Provider.of<HomeProvider>(context, listen: false).addData(
                      name: namecontroller.text,
                      email: emailcontroller.text,
                      bod: bodcontroller.text,
                      phone: phonecontroller.text,
                      password: passwordcontroller.text,
                    );
                    var isVal=skey.currentState?.validate()??false;
                    if (isVal) {
                      Navigator.pushReplacementNamed(context, "login1");
                      } else {

                      }

                  },
                  child: Container(
                    width: 400,
                    height: 60,
                    decoration: BoxDecoration(
                      color: Colors.black54,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: Text(
                        "SignIn",
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 120),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Already have an account? ",
                        style: TextStyle(fontSize: 16),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.pushReplacementNamed(context, "login1");
                        },
                        child: Text(
                          "Login",
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.blue,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
