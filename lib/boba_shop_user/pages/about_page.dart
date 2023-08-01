import 'package:flutter/material.dart';
import '../constants/const.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: const Text('About'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'This app was designed and coded by Shray Tripathi',
              style: TextStyle(color: Colors.grey[700]),
            ),
            const SizedBox(height: 25),
            Text(
              'HEYY',
              style: TextStyle(
                  color: Colors.grey[800], fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
