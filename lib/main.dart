import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:pollingapp/Providers/db_provider.dart';
import 'package:provider/provider.dart';
import 'package:pollingapp/Providers/auth_provider.dart';
import 'package:pollingapp/Providers/bottom_nav_provider.dart';
import 'package:pollingapp/Screens/splash_sreeen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context)=>AuthProvider()),
        ChangeNotifierProvider(create: (context)=>BottomNavProvider()),
        ChangeNotifierProvider(create: (context)=>DbProvider()),

        // Add any necessary providers here
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SplashScreen(),
      ),
    );
  }
}

