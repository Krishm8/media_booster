import 'package:flutter/material.dart';
import 'package:media_booster/controller/home_provider.dart';
import 'package:media_booster/controller/theme_provider.dart';
import 'package:media_booster/view/detail.dart';
import 'package:media_booster/view/home.dart';
import 'package:media_booster/view/login.dart';
import 'package:media_booster/view/login1.dart';
import 'package:media_booster/view/signin.dart';
import 'package:provider/provider.dart';


void main() {
  runApp(
    MyApp(),
  );
}




class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      ChangeNotifierProvider(create: (context) => ThemeProvider(),),
      ChangeNotifierProvider(create: (context) => HomeProvider(),),
    ],
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          darkTheme: ThemeData.dark(),
          theme: ThemeData.light(),
          themeMode: Provider.of<ThemeProvider>(context).theme,
          initialRoute: "/",
          routes: {
            "/":(context) => LoginPage(),
            "login1":(context) => Login1(),
            "signin":(context) => SignInPage(),
            "home":(context) => HomePage(),
            "detail":(context) => DetailPage(),
          },
        );
      },
    );
  }
}
