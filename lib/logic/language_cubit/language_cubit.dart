import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/shared/shared_language.dart';

part 'language_state.dart';

class LanguageCubit extends Cubit<LanguageState> {
  LanguageCubit() : super(const LanguageState(language: "en")) {
    setLanguage();
  }

  void changeLanguage({required String language}) async {
    await SharedLanguage.setLanguage(language: language);
    setLanguage();
  }

  void setLanguage() async {
    final String language = await SharedLanguage.getLanguage();
    emit(LanguageState(language: language));
  }
}
