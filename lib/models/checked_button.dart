import 'package:flutter/material.dart';
import 'package:first_app/provider/provider_test.dart';
import 'package:provider/provider.dart';
class MyCustomButton extends StatefulWidget {
  const MyCustomButton({Key? key}) : super(key: key);

  @override
  _MyCustomButtonState createState() => _MyCustomButtonState();
}

class _MyCustomButtonState extends State<MyCustomButton> {
  @override
  Widget build(BuildContext context) {
    final buttonModel = Provider.of<ButtonModel>(context);
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        elevation: buttonModel.isChecked ? 0 : 2,
      ),
      onPressed: () {
        setState(() {
          buttonModel.toggle();
        });
      },
      child: buttonModel.isChecked ? const Icon(Icons.check) : const Text('Check me'),
    );
  }
}