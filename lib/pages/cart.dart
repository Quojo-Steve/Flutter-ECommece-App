import 'package:e_commerce_app/utils/maincart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Cart extends StatefulWidget {
  const Cart({super.key});

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    final MainCart _cart = Provider.of<MainCart>(context, listen: false);

    return Scaffold(
      backgroundColor: Colors.purple[100],
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const Text(
            "My Cart",
            style: TextStyle(
                fontFamily: "Poppins",
                fontSize: 30,
                fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 10,
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _cart.cartItems().length,
              itemBuilder: (context, index) => Container(
                decoration: BoxDecoration(
                  color: Colors.grey[100],
                  borderRadius: BorderRadius.circular(8.0),
                ),
                margin: EdgeInsets.only(bottom: 10),
                child: ListTile(
                  leading: Image.asset(
                    _cart.cartItems()[index]['img'],
                  ),
                  trailing: IconButton(
                    icon: Icon(Icons.delete),
                    color: Colors.red,
                    onPressed: () {},
                  ),
                  title: Text(_cart.cartItems()[index]['name']),
                  subtitle: Text("Ghc ${_cart.cartItems()[index]['price']}"),
                ),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
