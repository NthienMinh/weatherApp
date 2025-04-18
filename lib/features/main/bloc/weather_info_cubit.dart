import 'package:weather/blocs/base_cubit.dart';

enum WeatherInfoLoadingState{
  loading, success, error
}

class WeatherInfoCubit extends BaseCubit<int>{
  WeatherInfoCubit():super(0){
    firstLoading();
  }

  WeatherInfoLoadingState mainState = WeatherInfoLoadingState.loading;

  firstLoading()async{
    await Future.delayed(const Duration(milliseconds: 1000));
    mainState = WeatherInfoLoadingState.error;
    baseEmit(state+1);
  }

  reload()async{
    mainState = WeatherInfoLoadingState.loading;
    baseEmit(state+1);
    await Future.delayed(const Duration(milliseconds: 1000));
    mainState = WeatherInfoLoadingState.success;
    baseEmit(state+1);
  }

}