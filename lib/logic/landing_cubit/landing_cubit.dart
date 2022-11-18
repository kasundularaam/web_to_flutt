import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'landing_state.dart';

class LandingCubit extends Cubit<LandingState> {
  LandingCubit() : super(LandingLoading());

  Future loadApp() => Future.delayed(const Duration(seconds: 2))
      .then((value) => emit(LandingLoaded()));
}
