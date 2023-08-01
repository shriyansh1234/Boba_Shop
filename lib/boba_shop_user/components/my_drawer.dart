import 'package:flutter/material.dart';
import 'package:todo/_add/extra/util.dart';
import 'package:todo/boba_shop_user/pages/about_page.dart';
import '../constants/const.dart';
import 'package:go_router/go_router.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: backgroundColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              const SizedBox(height: 25),

              // logo
              Padding(
                padding: const EdgeInsets.all(50.0),
                child: Image.asset(
                  'lib/boba_shop_user/images/milk_tea.png',
                  height: 160,
                ),
              ),

              const Divider(),

              // shop tile
              GestureDetector(
                onTap: () {
                  // go to home page
                  context.pop();
                },
                child: const Padding(
                  padding: EdgeInsets.only(left: 25.0),
                  child: ListTile(
                    leading: Icon(
                      Icons.home,
                      color: Colors.white,
                    ),
                    title: Text(
                      'Home',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),

              // about tile
              GestureDetector(
                onTap: () {
                  // go to about page
                  context.pushNamed('AboutPage');
                },
                child: const Padding(
                  padding: EdgeInsets.only(left: 25.0),
                  child: ListTile(
                    leading: Icon(
                      Icons.info,
                      color: Colors.white,
                    ),
                    title: Text(
                      'About',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              )
            ],
          ),

          // logout tile
          GestureDetector(
            onTap: () {
              // go to login page
              context.pushNamed('SplashScreen');
            },
            child: const Padding(
              padding: EdgeInsets.only(left: 25.0, bottom: 25.0),
              child: ListTile(
                leading: Icon(
                  Icons.logout,
                  color: Colors.white,
                ),
                title: Text(
                  'Logout',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
