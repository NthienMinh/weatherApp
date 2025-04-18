import 'package:weather/blocs/base_cubit.dart';

enum MainState{
  loading, success, error
}

class MainCubit extends BaseCubit<int>{
  MainCubit():super(0);

  MainState mainState = MainState.loading;

  loading()async{
    await Future.delayed(const Duration(milliseconds: 1000));
    mainState = MainState.error;
    baseEmit(state+1);
  }

}