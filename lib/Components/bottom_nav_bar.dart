// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class BottomNav extends StatelessWidget {
  void Function(int)? onTabChange;
  BottomNav({super.key, required this.onTabChange});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20.0),
        child: GNav(
            color: Colors.purple[300],
            activeColor: Colors.purple[700],
            tabActiveBorder: Border.all(color: Colors.white),
            tabBackgroundColor: Colors.grey.shade100,
            mainAxisAlignment: MainAxisAlignment.center,
            tabBorderRadius: 16,
            onTabChange: (value) => onTabChange!(value),
            tabs: [
              GButton(
                icon: Icons.home,
                text: "Shop",
              ),
              GButton(icon: Icons.shopping_bag, text: "Cart")
            ]),
      ),
    );
  }
}
