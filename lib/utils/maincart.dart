import 'package:provider/provider.dart';
import 'package:flutter/foundation.dart';

class MainCart extends ChangeNotifier{
  List Sales_item = [];
  List<Map<String, dynamic>> finalItemsList = [];

  void addToList(String itemName, int itemPrice, int id, String img) {
    finalItemsList.add({
      'id': id,
      'name': itemName,
      'price': itemPrice,
      'img': img,
    });
    notifyListeners();
  }

  dynamic itemList() {
    return finalItemsList;
  }

  dynamic cartItems() {
    return finalItemsList;
  }

  dynamic allItems() {
    return Sales_item = [
      ["Lebron.png", 200, "Lebron 1", 1],
      ["AirForce.png", 150, "Air Force 12", 2],
      ["Jordan.png", 230, "Air Jordan 1", 3],
      ["MARVEL.png", 250, "Nike & Marvel", 4]
    ];
  }

  void removeFromList(String itemName, int itemPrice, int id, String img) {}
}
