import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pollingapp/Screens/Authentication/auth_page.dart';
import 'package:pollingapp/Screens/main_activity_page.dart';
import 'package:pollingapp/Utils/router.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  User? user = FirebaseAuth.instance.currentUser;
  void navigate() {
    Future.delayed(Duration(seconds: 3), () {
      if (user == null) {
        // nextPageOnly(context, AuthPage());
        nextPageOnly(context, MainActivityPage());

      }
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    navigate();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FlutterLogo(),
      ),
    );
  }
}
