import 'package:equatable/equatable.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'scanner_state.dart';

class ScannerCubit extends Cubit<ScannerState> {
  ScannerCubit() : super(ScannerInitial());

  Future scanQRcode() async {
    try {
      emit(ScannerScanning());
      String result = await FlutterBarcodeScanner.scanBarcode(
          '#ff6666', 'Cancel', true, ScanMode.QR);
      emit(ScannerSucceed(result: result));
    } on PlatformException {
      emit(const ScannerFailed(errorMsg: "Failed to get platform version."));
    } catch (e) {
      emit(ScannerFailed(errorMsg: e.toString()));
    }
  }
}
