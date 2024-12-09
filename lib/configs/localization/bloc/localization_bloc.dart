import 'dart:async';
import 'dart:ui';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:magicminds_assignment/services/storage/local_storage.dart';

part 'localization_event.dart';
part 'localization_state.dart';

class LocalizationBloc extends Bloc<LocalizationEvent, LocalizationState> {
  LocalStorage storage;
  Locale locale;
  LocalizationBloc({required this.storage, required this.locale}) : super(LocalizationState(locale: locale)) {
    on<ChangeLanguageEvent>(_changeLanguage);
  }

  FutureOr<void> _changeLanguage(ChangeLanguageEvent event, Emitter<LocalizationState> emit) async {
    await storage.setLanguage(event.language);
    emit(state.copyWith(locale: Locale(event.language)));
  }
}
