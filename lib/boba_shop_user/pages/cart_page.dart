import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../components/drink_tile.dart';
import '../components/my_button.dart';
import '../models/drink.dart';
import '../models/shop.dart';

/*

CART PAGE

  - User can check their cart and remove items if necessary
  - User can tap 'Pay now' button $

*/

class CartPage extends StatefulWidget {
  const CartPage();

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  // remove drink from cart
  void removeFromCart(Drink drink) {
    Provider.of<BubbleTeaShop>(context, listen: false).removeFromCart(drink);
  }

  // pay now button tapped
  void payNow() {
    /*

    integrate your payment services in this method

    */
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<BubbleTeaShop>(
      builder: (context, value, child) => Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // heading
            const Text(
              'Your Cart',
              style: TextStyle(
                fontSize: 20,
                color: Colors.white,
              ),
            ),

            const SizedBox(height: 25),

            // list of cart items
            Expanded(
                child: value.cart.isEmpty
                    ? Center(
                        child: Text(
                          'Empty Cart..',
                          style: TextStyle(
                            color: Colors.grey[700],
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      )
                    : ListView.builder(
                        itemCount: value.cart.length,
                        itemBuilder: (context, index) {
                          // get individual drink from cart list
                          Drink individualDrink = value.cart[index];

                          // return as a list tile
                          return DrinkTile(
                              drink: individualDrink,
                              onTap: () => removeFromCart(individualDrink),
                              icon: const Icon(Icons.delete));
                        },
                      )),

            // pay button
            MyButton(text: "Pay now", onTap: payNow)
          ],
        ),
      ),
    );
  }
}
