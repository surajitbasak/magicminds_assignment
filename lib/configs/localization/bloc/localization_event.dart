part of 'localization_bloc.dart';

abstract class LocalizationEvent extends Equatable {
  const LocalizationEvent();
  @override
  List<Object?> get props => [];
}

class ChangeLanguageEvent extends LocalizationEvent {
  final String language;
  const ChangeLanguageEvent({required this.language});

  @override
  List<Object?> get props => [language];
}
