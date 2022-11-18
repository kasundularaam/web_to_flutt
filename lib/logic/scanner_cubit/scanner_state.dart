part of 'scanner_cubit.dart';

abstract class ScannerState extends Equatable {
  const ScannerState();

  @override
  List<Object> get props => [];
}

class ScannerInitial extends ScannerState {}

class ScannerScanning extends ScannerState {}

class ScannerSucceed extends ScannerState {
  final String result;
  const ScannerSucceed({
    required this.result,
  });

  @override
  List<Object> get props => [result];

  @override
  String toString() => 'ScannerSucceed(deviceId: $result)';
}

class ScannerFailed extends ScannerState {
  final String errorMsg;
  const ScannerFailed({
    required this.errorMsg,
  });

  @override
  List<Object> get props => [errorMsg];

  @override
  String toString() => 'ScannerFailed(errorMsg: $errorMsg)';
}
