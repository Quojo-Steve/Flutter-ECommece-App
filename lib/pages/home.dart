import 'package:e_commerce_app/Components/bottom_nav_bar.dart';
import 'package:e_commerce_app/pages/cart.dart';
import 'package:e_commerce_app/pages/shopPage.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedIndex = 0;

  void navigateBottomBar(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  final List<Widget> pages = [const ShopPage(), const Cart()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple[100],
      bottomNavigationBar: BottomNav(
        onTabChange: (index) => navigateBottomBar(index),
      ),
      body: pages[selectedIndex],
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Builder(
            builder: (context) => IconButton(
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
                icon: const Padding(
                  padding: EdgeInsets.only(left: 16.0),
                  child: Icon(
                    Icons.menu,
                    color: Colors.black,
                  ),
                ))),
      ),
      drawer: Drawer(
          backgroundColor: Colors.purple[500],
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  DrawerHeader(
                      child: Image.asset(
                    "nike.png",
                    color: Colors.white,
                  )),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 25.0),
                    child: Divider(
                      color: Colors.grey,
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 25.0),
                    child: ListTile(
                      leading: Icon(
                        Icons.home,
                        color: Colors.white,
                      ),
                      title: Text(
                        "Shop",
                        style: TextStyle(
                            fontFamily: "Poppins", color: Colors.white),
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 25.0),
                    child: ListTile(
                      leading: Icon(
                        Icons.info,
                        color: Colors.white,
                      ),
                      title: Text(
                        "About",
                        style: TextStyle(
                            fontFamily: "Poppins", color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
              const Padding(
                padding: EdgeInsets.only(left: 25.0, bottom: 25),
                child: ListTile(
                  leading: Icon(
                    Icons.logout,
                    color: Colors.white,
                  ),
                  title: Text(
                    "Logout",
                    style:
                        TextStyle(fontFamily: "Poppins", color: Colors.white),
                  ),
                ),
              ),
            ],
          )),
    );
  }
}
