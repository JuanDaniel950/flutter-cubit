import 'package:bloc/bloc.dart';
import 'package:personal/cubit/app_cubit_states.dart';
import 'package:personal/model/data_model.dart';
import 'package:personal/services/data_services.dart';

class AppCubits extends Cubit<CubitStates> {
  AppCubits({required this.data}) : super(InitialState()) {
    emit(WelcomeState());
  }

  final DataServices data;
  // ignore: prefer_typing_uninitialized_variables
  late final places;
  void getData() async {
    try {
      emit(LoadingState());
      places = await data.getInfo();
      emit(LoadedState(places));
    } catch (e) {
      // ignore: avoid_print
      print(e);
    }
  }

  detailPage(DataModel data) {
    emit(
      DetailsState(data),
    );
  }

  goHome() {
    emit(LoadedState(places));
  }
}
