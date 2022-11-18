import 'package:flutter_bloc/flutter_bloc.dart';

part 'web_view_state.dart';

class WebViewCubit extends Cubit<WebViewState> {
  WebViewCubit() : super(const WebViewState(url: 'http://critssl.com/oreema/'));

  loadWebView({required String url}) => emit(WebViewState(url: url));
}
