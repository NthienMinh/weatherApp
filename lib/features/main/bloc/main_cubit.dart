import 'package:weather/blocs/base_cubit.dart';

enum MainState{
  loading, success, error
}

class MainCubit extends BaseCubit<int>{
  MainCubit():super(0){
    firstLoading();
  }

  MainState mainState = MainState.loading;

  firstLoading()async{
    await Future.delayed(const Duration(milliseconds: 1000));
    mainState = MainState.error;
    baseEmit(state+1);
  }

  reload()async{
    mainState = MainState.loading;
    baseEmit(state+1);
    await Future.delayed(const Duration(milliseconds: 1000));
    mainState = MainState.success;
    baseEmit(state+1);
  }

}