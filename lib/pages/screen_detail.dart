import 'package:first_app/pages/list_user.dart';
import 'package:flutter/material.dart';
class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final user = ModalRoute.of(context)!.settings.arguments as User;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(user.login),
          backgroundColor: Colors.pink,
        ),
        body: Column(
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('get Back'),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Image.network(user.avatar),
            ),
          ],
        ),
      ),
    );
  }
}