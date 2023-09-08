import 'package:flutter/material.dart';

class SecondScreen extends StatelessWidget {
  const SecondScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Second Screen'),
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Go back!'),
            ),
            const SizedBox(width: 8),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/list');
              },
              child: const Text('go List'),
            ),
          ],
        ),
      ),
    );
  }
}