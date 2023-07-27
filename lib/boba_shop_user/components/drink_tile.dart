import 'package:flutter/material.dart';
import '../constants/const.dart';
import '../models/drink.dart';

class DrinkTile extends StatelessWidget {
  final Drink drink;
  final Widget icon;
  void Function()? onTap;
  DrinkTile({
    super.key,
    required this.drink,
    required this.onTap,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: lightBackgroundColor,
        ),
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: ListTile(
          leading: Image.asset(drink.imagePath),
          title: Text(
            drink.name,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
              color: Colors.grey[800],
            ),
          ),
          subtitle: Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Text('\$${drink.price}'),
          ),
          trailing: Padding(
            padding: EdgeInsets.only(right: 10.0),
            child: icon,
          ),
        ),
      ),
    );
  }
}
