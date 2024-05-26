import "package:flutter/material.dart";
import "package:provider/provider.dart";
import "../provider/shoppingcart_provider.dart";

class MyCart extends StatelessWidget {
  const MyCart({Key? key});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "My Cart",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.lightBlue,
      ),
      body: Center(
        child: Consumer<ShoppingCart>(
          builder: (context, prov, child) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: prov.cart.isEmpty 
                  ? const Text("No Products Yet")
                  : ListView.builder(
                    itemCount: prov.cart.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        leading: const Icon(Icons.food_bank),
                        title: Text(prov.cart[index].name),
                        trailing: IconButton(
                          icon: const Icon(Icons.delete),
                          onPressed: () {
                            context.read<ShoppingCart>().removeItem(prov.cart[index]);
                          }
                        ),
                      );
                    }
                  )
                ),
                Text(
                  "Total: ${prov.getTotal()}",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          prov.removeAll();
                        },
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.symmetric(vertical: 8),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          foregroundColor: Colors.white, backgroundColor: Colors.lightBlue,
                        ),
                        child: const Text("Reset"),
                      ),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pushNamed(context, "/checkout");
                        },
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.symmetric(vertical: 8),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          foregroundColor: Colors.white, backgroundColor: Colors.lightBlue,
                        ),
                        child: const Text("Checkout"),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                TextButton(
                  child: const Text("Go back to Product Catalog"),
                  onPressed: () {
                    Navigator.pushNamed(context, "/products");
                  },
                ),
              ],
            );
          },
        )
      ),
    );
  }
}
