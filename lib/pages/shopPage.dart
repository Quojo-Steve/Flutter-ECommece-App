import 'package:e_commerce_app/Components/items.dart';
import 'package:e_commerce_app/utils/maincart.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({Key? key}) : super(key: key);

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  MainCart _mainCart = MainCart();
  

  void addToCart(String itemName, int itemPrice) {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple[100],
      // search part
      body: ClipRect(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              margin: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(12)),
              child: Container(
                // Wrap the Row with a Container
                constraints: BoxConstraints(
                    maxWidth: double.infinity), // Add constraints
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          border:
                              OutlineInputBorder(borderSide: BorderSide.none),
                          hintText: "Search...",
                        ),
                      ),
                    ),
                    Icon(Icons.search),
                  ],
                ),
              ),
            ),
            //first text
            const Text(
              "Everyone flies... some longer than others",
              style: TextStyle(
                  fontSize: 15, color: Color.fromARGB(255, 59, 58, 58)),
            ),
            //second text
            const Padding(
              padding: EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Hot Picks",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "See more",
                    style: TextStyle(color: Colors.blue),
                  )
                ],
              ),
            ),
            //items
            Container(
                margin: const EdgeInsets.symmetric(horizontal: 10),
                constraints:
                    BoxConstraints(maxWidth: double.infinity, maxHeight: 320),
                child: ListView.builder(
                  itemCount: _mainCart.allItems().length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) => Items(
                    id: _mainCart.allItems()[index][3],
                    img: _mainCart.allItems()[index][0],
                    price: _mainCart.allItems()[index][1],
                    name: _mainCart.allItems()[index][2],
                    addToCart: addToCart, // Pass the callback function
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
