import 'package:bloc/bloc.dart';

class ButtonCubit extends Cubit<bool> {
  ButtonCubit() : super(false);

  void toggle() => emit(true);
}

