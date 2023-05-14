import 'package:flutter/material.dart';
import 'package:pollingapp/Providers/auth_provider.dart';
import 'package:pollingapp/Screens/main_activity_page.dart';

import '../../Utils/message.dart';
import '../../Utils/router.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: GestureDetector(
          onTap: () {
            // AuthProvider().signInWithGoogle().then((value) => {
            //       if (value.user == null)
            //         {error(context, message: 'please try again')}
            //       else
            //         {
            //           nextPageOnly(context, MainActivityPage()),
            //         }
            //     }
            //     );

          },
          child: Container(
              height: 50,
              width: 100,
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(10),
              ),
              alignment: Alignment.center,
              child: Text('Login')),
        ),
      ),
    );
  }
}
