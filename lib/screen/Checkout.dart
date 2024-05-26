import 'package:exercise_06/provider/shoppingcart_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Checkout extends StatelessWidget {
  const Checkout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Checkout",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.lightBlue,
      ),
      body: Consumer<ShoppingCart>(
        builder: (context, prov, child) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Item Details",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                prov.cart.isEmpty
                      ? const Text("No items to checkout!")           // Display message if cart is empty
                      : ListView.builder(
                          shrinkWrap: true,                           // Allow ListView to occupy only the space it needs
                          itemCount: prov.cart.length,
                          itemBuilder: (context, index) {
                            return ListTile(
                              leading: const Icon(Icons.star),
                              title: Text(prov.cart[index].name),                 // Name of the item
                              trailing: Text(
                                "\$${prov.cart[index].price.toStringAsFixed(2)}", // Price of the item
                              ),
                            );
                          },
                        ),
                SizedBox(height: 10),
                Text(
                  "Total Cost to Pay: \$${prov.getTotal().toStringAsFixed(2)}",   // Display total cost to pay
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10),
                if (prov.cart.isNotEmpty)                                         // Show Pay Now button only if cart is not empty
                  ElevatedButton(
                    onPressed: () {
                      prov.removeAll();                                           // Remove all items from cart
                      Navigator.pushNamed(context, "/");                          // Navigate back to catalog screen
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("Payment Successful!"),                   // Show payment success message
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(vertical: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),                  // Pay now button design
                      ),
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.lightBlue,
                    ),
                    child: const Text("Pay Now!"),
                  ),
              ],
            ),
          );
        },
      ),
    );
  }
}
