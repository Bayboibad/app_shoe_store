import 'package:flutter_bloc/flutter_bloc.dart';

enum LoadingState { showing, hiding }

class LoadingBloc extends Cubit<LoadingState> {
  LoadingBloc() : super(LoadingState.hiding);

  void showLoading() => emit(LoadingState.showing);
  void hideLoading() => emit(LoadingState.hiding);
}
