import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:magicminds_assignment/main.dart';
import 'package:sizer/sizer.dart';

import '../configs/localization/bloc/localization_bloc.dart';
import '../configs/localization/localization_config.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../configs/routes/routes.dart';
import '../configs/themes/dark_theme.dart';
import '../configs/themes/light_theme.dart';

class WidgetTestHelper extends StatelessWidget {
  final Widget child;
  const WidgetTestHelper({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(
      builder: (p0, p1, p2) => MultiBlocProvider(
        providers: [BlocProvider(create: (_) => LocalizationBloc(storage: getIt(), locale: appLocale))],
        child: BlocBuilder<LocalizationBloc, LocalizationState>(
          buildWhen: (previous, current) {
            bool shouldRebuild = current.locale != previous.locale;
            if (shouldRebuild) rebuildAllChildren(context);
            return shouldRebuild;
          },
          builder: (context, state) {
            return MaterialApp(
              // Material app configuration
              title: 'Magicminds Assignment',
              themeMode: ThemeMode.system, // Setting theme mode to dark
              theme: lightTheme, // Setting light theme
              darkTheme: darkTheme, // Setting dark theme
              localizationsDelegates: AppLocalizations.localizationsDelegates,
              supportedLocales: AppLocalizations.supportedLocales,
              onGenerateRoute: Routes.generateRoute, // Generating routes
              builder: (context, child) => SizedBox(
                //Settings a parent widget with a key so that localization access can be achieved conveniently.
                key: navigatorKey,
                child: child,
              ),
              home: child,
            );
          },
        ),
      ),
    );
  }
}
