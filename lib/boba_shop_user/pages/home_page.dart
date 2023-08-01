import 'package:flutter/material.dart';
import '../components/bottom_bar.dart';
import '../components/my_drawer.dart';
import '../constants/const.dart';
import 'cart_page.dart';
import 'shop_page.dart';

class Boba_Home_Page extends StatefulWidget {
  const Boba_Home_Page({super.key});

  @override
  State<Boba_Home_Page> createState() => _HomePageState();
}

class _HomePageState extends State<Boba_Home_Page> {

  
  // navigate bottom bar
  int _selectedIndex = 0;
  void navigateBottomBar(int newIndex) {
    setState(() {
      _selectedIndex = newIndex;
    });
  }

  // pages
  final List<Widget> _pages = [
    // shop page
    const ShopPage(),

    // cart page
    const CartPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      backgroundColor: backgroundColor,
      bottomNavigationBar: MyBottomBar(
        onTabChange: (index) => navigateBottomBar(index),
      ),
      // add drawer again
      drawer: MyDrawer(),
      body: _pages[_selectedIndex],
    );
  }
}
