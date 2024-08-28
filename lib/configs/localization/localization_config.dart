import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

final GlobalKey navigatorKey = GlobalKey();

AppLocalizations get localization => AppLocalizations.of(navigatorKey.currentContext!)!;