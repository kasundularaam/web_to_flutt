part of 'landing_cubit.dart';

abstract class LandingState extends Equatable {
  const LandingState();

  @override
  List<Object> get props => [];
}

class LandingLoading extends LandingState {}

class LandingLoaded extends LandingState {}
