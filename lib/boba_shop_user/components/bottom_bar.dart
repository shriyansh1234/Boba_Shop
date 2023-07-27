import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class MyBottomBar extends StatelessWidget {
  void Function(int)? onTabChange;
  MyBottomBar({super.key, required this.onTabChange});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 25.0),
      child: GNav(
        mainAxisAlignment: MainAxisAlignment.center,
        activeColor: Colors.white,
        color: Colors.grey[300],
        tabBorderRadius: 24,
        tabActiveBorder: Border.all(color: Colors.grey.shade300),
        onTabChange: (value) => onTabChange!(value),
        gap: 8,
        tabs: const [
          // shop tab
          GButton(
            icon: Icons.home,
            text: 'Shop',
          ),

          // cart tab
          GButton(
            icon: Icons.shopping_bag_outlined,
            text: 'Cart',
          ),
        ],
      ),
    );
  }
}
