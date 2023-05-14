import 'package:flutter/material.dart';
import 'package:pollingapp/Providers/auth_provider.dart';
import 'package:pollingapp/Screens/Authentication/auth_page.dart';
import 'package:pollingapp/Screens/main_activity_page.dart';

import '../../../Utils/message.dart';
import '../../../Utils/router.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({Key? key}) : super(key: key);

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: GestureDetector(
          onTap: () {
            // AuthProvider().logOut().then((value) => {
            //       if (value == false)
            //         {error(context, message: 'please try again')}
            //       else
            //         {
            //           nextPageOnly(context, MainActivityPage()),
            //         }
            //     });

            Navigator.push(context, MaterialPageRoute(builder: (_)=>MainActivityPage()));
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
