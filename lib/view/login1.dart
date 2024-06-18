// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:media_booster/controller/home_provider.dart';
import 'package:media_booster/view/home.dart';
import 'package:media_booster/view/login.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Login1 extends StatefulWidget {
  const Login1({super.key});

  @override
  State<Login1> createState() => _Login1State();
}

class _Login1State extends State<Login1> {
  GlobalKey<FormState> fkey = GlobalKey<FormState>();
  TextEditingController phonecontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  //
  // @override
  // void didChangeDependencies() {
  //   super.didChangeDependencies();
  //
  //   SharedPreferences.getInstance().then(
  //     (pref) {
  //       String isLogin = pref.getString("isLogin")??"";
  //       if (isLogin != null) {
  //         Navigator.pushReplacement(
  //           context,
  //           MaterialPageRoute(
  //             builder: (context) {
  //               return HomePage();
  //             },
  //           ),
  //         );
  //       }
  //     },
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [

          Icon(Icons.language_sharp),
          SizedBox(
            width: 10,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10),
        child: SingleChildScrollView(
          child: Form(
            key: fkey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Login",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Please login to continue using this application",
                ),
                SizedBox(
                  height: 30,
                ),
                TextFormField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Enter Valid Phone Number";
                    }
                  },
                  controller: phonecontroller,
                  keyboardType: TextInputType.phone,
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                    hintText: "Enter Phone Number",
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
                      return "Enter Valid Password";
                    }
                  },
                  controller: passwordcontroller,
                  keyboardType: TextInputType.visiblePassword,
                  decoration: InputDecoration(
                    suffixIcon: Icon(Icons.visibility),
                    hintText: "Enter Password",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "We'll call or text you to confirm your number. Standard message and data rates apply. Privacy Policy.",
                ),
                SizedBox(
                  height: 20,
                ),
                InkWell(
                  onTap: () async {
                    var isVal = fkey.currentState?.validate() ?? false;
                    if (phonecontroller.text ==
                            Provider.of<HomeProvider>(context, listen: false)
                                .phone &&
                        passwordcontroller.text ==
                            Provider.of<HomeProvider>(context, listen: false)
                                .password) {
                      Navigator.pushReplacementNamed(context, "home");
                      // var sv = await SharedPreferences.getInstance();
                      // sv.setString("isLogin", "${phonecontroller.text}");
                      // sv.setString("isLogin", "${passwordcontroller.text}");
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text("Invalid"),
                        ),
                      );
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
                        "Login",
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Divider(
                        endIndent: 20,
                      ),
                    ),
                    Text("OR"),
                    Expanded(
                      child: Divider(
                        indent: 20,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                InkWell(
                  onTap: () {
                    Navigator.pushReplacementNamed(context, "signin");
                  },
                  child: Container(
                    width: 400,
                    height: 60,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: Text(
                        "SignIn",
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                    ),
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
