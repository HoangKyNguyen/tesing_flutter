import 'package:flutter/material.dart';
import 'package:first_app/bloc/bloc_test.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ButtonChecked extends StatelessWidget {
  const ButtonChecked({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ButtonCubit(),
      child: BlocBuilder<ButtonCubit, bool>(
        builder: (context, state) {
          return ElevatedButton(
            style: ElevatedButton.styleFrom(
              elevation: state ? 0 : 2,
            ),
            onPressed: () => context.read<ButtonCubit>().toggle(),
            child: state ? const Icon(Icons.check) : const Text('Check me'),
          );
        },
      ),
    );
  }
}
