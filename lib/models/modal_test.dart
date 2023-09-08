import 'package:flutter/material.dart';

class MyModal extends StatelessWidget {
  const MyModal({super.key});

  void _showDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('My Dialog'),
          content: const Text('Hello from Flutter!'),
          actions: [
            TextButton(
              child: const Text('Close'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: const Text('Show Dialog'),
      onPressed: () => _showDialog(context),
    );
  }
}