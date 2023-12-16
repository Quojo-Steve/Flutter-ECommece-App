import 'package:e_commerce_app/utils/maincart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class Items extends StatefulWidget {
  final String img;
  final int id;
  final int price;
  final String name;
  final void Function(String itemName, int itemPrice) addToCart;

  Items({
    Key? key,
    required this.id,
    required this.img,
    required this.price,
    required this.name,
    required this.addToCart,
  }) : super(key: key);

  @override
  State<Items> createState() => _ItemsState();
}

class _ItemsState extends State<Items> {

  void addToCart(String itemName, int itemPrice, int id, String img) {
    MainCart _cart = Provider.of<MainCart>(context, listen: false);
    // Check if the item with the given id is already in the list
    bool isItemAlreadyAdded = _cart.itemList().any((item) => item['id'] == id);

    if (isItemAlreadyAdded) {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text("Item already selected"),
            icon: const Icon(
              Icons.cancel,
              color: Colors.red,
              size: 50,
              weight: 30,
            ),
            content: Text("Check your cart! $itemName is already added"),
          );
        },
      );
    } else {
      _cart.addToList(itemName, itemPrice, id, img);
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text("Successfully Added "),
            icon: const Icon(
              Icons.verified,
              color: Colors.green,
              size: 50,
              weight: 30,
            ),
            content:
                Text("Check your cart! $itemName added for Ghc $itemPrice"),
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 10, left: 20),
      padding: EdgeInsets.only(left: 10, right: 10),
      width: 250,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(12)),
      child: Column(children: [
        Image.asset(
          widget.img,
          height: 200,
          width: 250,
        ),
        Text(
          widget.name,
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        Text(
          " Ghc ${widget.price.toString()}",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Colors.purple,
          ),
          child: IconButton(
            onPressed: () {
              addToCart(widget.name, widget.price, widget.id, widget.img);
            },
            icon: Icon(Icons.add),
            color: Colors.white,
          ),
        )
      ]),
    );
  }
}
