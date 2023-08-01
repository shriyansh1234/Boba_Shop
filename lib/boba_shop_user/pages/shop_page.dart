import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../components/drink_tile.dart';
import '../models/drink.dart';
import '../models/shop.dart';
import 'order_page.dart';
import 'package:go_router/go_router.dart'; 

class ShopPage extends StatefulWidget {
  const ShopPage();

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  // go to order page
  void goToOrderPage(Drink drink) {
  Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => OrderPage(
          drink: drink,
        ),
      ),
    );
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
              "Bubble Tea Shop",
              style: TextStyle(
                fontSize: 20,
                color: Colors.white,
              ),
            ),

            const SizedBox(height: 25),

            // list of drinks for sale
            Expanded(
              child: ListView.builder(
                itemCount: value.shop.length,
                itemBuilder: (context, index) {
                  // get individual drink from shop
                  Drink individualDrink = value.shop[index];

                  // return drink as a list tile
                  return DrinkTile(
                    drink: individualDrink,
                    onTap: () => goToOrderPage(individualDrink),
                    icon: const Icon(Icons.arrow_forward),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
