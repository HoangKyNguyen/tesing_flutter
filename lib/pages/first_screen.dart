import 'package:flutter/material.dart';
import 'package:first_app/pages/modal_test.dart';

class FirstScreen extends StatelessWidget {
  const FirstScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('First Screen'),
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                // Navigate to the second screen using a named route.
                Navigator.pushNamed(context, '/second');
              },
              child: const Text('Launch screen'),
            ),
            SizedBox(width: 8), // Add some space between the buttons
            const MyModal()
          ],
        ),
      ),
    );
  }
}