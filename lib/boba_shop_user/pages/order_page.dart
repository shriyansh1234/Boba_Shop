import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../components/my_button.dart';
import '../constants/const.dart';
import '../models/drink.dart';
import '../models/shop.dart';

class OrderPage extends StatefulWidget {
  final Drink drink;
  const OrderPage({super.key, required this.drink});

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  // customize sweetness
  double sweetValue = 0.5;
  void customizeSweet(double newValue) {
    setState(() {
      sweetValue = newValue;
    });
  }

  // customize ice
  double iceValue = 0.5;
  void customizeIce(double newValue) {
    setState(() {
      iceValue = newValue;
    });
  }

  // customize pearls
  double pearlValue = 0.5;
  void customizePearls(double newValue) {
    setState(() {
      pearlValue = newValue;
    });
  }

  // add to cart
  void addToCart(Drink drink) {
    // add to cart first
    Provider.of<BubbleTeaShop>(context, listen: false).addToCart(drink);

    // direct user back to shop page
    Navigator.pop(context);
    // let user know it has been successfully added
    showDialog(
      context: context,
      builder: (context) => const AlertDialog(
        titleTextStyle: TextStyle(color: Colors.white, fontSize: 18),
        title: Text(
          'Successfully added to cart!',
        ),
        backgroundColor: Colors.brown,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      backgroundColor: backgroundColor,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(left: 25, right: 25, bottom: 25),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              // milk tea image
              Image.asset(
                widget.drink.imagePath,
                height: 250,
              ),

              const SizedBox(height: 50),

              // options to customize drink
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Column(
                  children: [
                    // sweetness
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: 100,
                          child: Text(
                            "Sweet",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: Colors.brown[800],
                            ),
                          ),
                        ),
                        Expanded(
                          child: Slider(
                            value: sweetValue,
                            divisions: 4,
                            label: sweetValue.toString(),
                            onChanged: (value) => customizeSweet(value),
                          ),
                        ),
                      ],
                    ),

                    // ice
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: 100,
                          child: Text(
                            "Ice",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: Colors.brown[800],
                            ),
                          ),
                        ),
                        Expanded(
                          child: Slider(
                            value: iceValue,
                            divisions: 4,
                            label: iceValue.toString(),
                            onChanged: (value) => customizeIce(value),
                          ),
                        ),
                      ],
                    ),

                    // pearls
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: 100,
                          child: Text(
                            "Pearls",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: Colors.brown[800],
                            ),
                          ),
                        ),
                        Expanded(
                          child: Slider(
                            value: pearlValue,
                            divisions: 4,
                            label: pearlValue.toString(),
                            onChanged: (value) => customizePearls(value),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              // add to cart button
              MyButton(
                text: 'Add to cart',
                onTap: () => addToCart(widget.drink),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
