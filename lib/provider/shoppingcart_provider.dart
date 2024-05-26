import "package:flutter/material.dart";
import "../model/Item.dart";

class ShoppingCart extends ChangeNotifier {
  final List<Item> _shoppingList = [];                                  // Hold the list of items in the shopping cart
  double cartTotal=0;                                                   // Hold the total cost of items in the cart
  List<Item> get cart => _shoppingList;                                 // Getter method to access the shopping cart list

  void addItem(Item item) {                                             // Method to add an item to the shopping cart
    _shoppingList.add(item);
    cartTotal = cartTotal + item.price;
    notifyListeners();
  }
  
  void removeAll() {                                                     // Method to remove all items from the shopping cart
    _shoppingList.clear();
    cartTotal = 0;
    notifyListeners();
  }

   void removeItem(Item item) {                                         // Method to remove a specific item from the shopping cart
    if (_shoppingList.contains(item)) {                                 // Check if the item exists in the cart
      cartTotal -= item.price;
      _shoppingList.remove(item);
      notifyListeners();
    }
  }

  double getTotal() {                                             // Method to calculate the total cost of all items in the shopping cart
    double total = 0;
    for (int i = 0; i < _shoppingList.length;i++) {
      total = total + _shoppingList[i].price;
    }
    return total;
  }
}
