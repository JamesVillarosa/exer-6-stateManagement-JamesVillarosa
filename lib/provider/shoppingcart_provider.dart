import "package:flutter/material.dart";
import "../model/Item.dart";

class ShoppingCart extends ChangeNotifier {
  final List<Item> _shoppingList = [];
  double cartTotal=0;
  List<Item> get cart => _shoppingList;

  void addItem(Item item) {
    _shoppingList.add(item);
    cartTotal = cartTotal + item.price;
    notifyListeners();
  }
  
  void removeAll() {
    _shoppingList.clear();
    cartTotal = 0;
    notifyListeners();
  }

   void removeItem(Item item) {
    if (_shoppingList.contains(item)) {
      cartTotal -= item.price;
      _shoppingList.remove(item);
      notifyListeners();
    }
  }

  double getTotal() {
    double total = 0;
    for (int i = 0; i < _shoppingList.length;i++) {
      total = total + _shoppingList[i].price;
    }
    return total;
  }
}
