import 'package:flutter_bloc/flutter_bloc.dart';

abstract class BaseCubit<T> extends Cubit<T> {
  BaseCubit(super.initialState);

  baseEmit(T value) {
    if (isClosed) return;
    emit(value);
  }
}
