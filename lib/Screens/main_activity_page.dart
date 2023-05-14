import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pollingapp/Providers/auth_provider.dart';
import 'package:pollingapp/Providers/bottom_nav_provider.dart';
import 'package:pollingapp/Screens/BottomNavPages/Account/account_page.dart';
import 'package:pollingapp/Screens/BottomNavPages/MyPoll/my_poll_page.dart';
import 'package:pollingapp/Screens/BottomNavPages/home/home_page.dart';

class MainActivityPage extends StatefulWidget {
  const MainActivityPage({Key? key}) : super(key: key);

  @override
  State<MainActivityPage> createState() => _MainActivityPageState();
}

class _MainActivityPageState extends State<MainActivityPage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<BottomNavProvider>(
        builder:(
        context,nav,child
    ){
        return Scaffold(
          body: _pages[nav.currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            items: _items,
            currentIndex: nav.currentIndex,
            onTap: (value) {
             nav.changeIndex=value;
            },
          ),
        );
      }
    );
  }

  List<Widget> _pages = [HomePage(), MyPoll(), AccountPage()];
  List<BottomNavigationBarItem> _items = [
    BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
    BottomNavigationBarItem(icon: Icon(Icons.poll), label: 'My Polls'),
    BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Accounts'),
  ];
}
