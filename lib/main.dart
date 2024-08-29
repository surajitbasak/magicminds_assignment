import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart'; // Localization support
import 'package:get_it/get_it.dart'; // Package for dependency injection
import 'package:magicminds_assignment/configs/localization/bloc/localization_bloc.dart';
import 'package:magicminds_assignment/repository/product_api/product_repository.dart';
import 'package:magicminds_assignment/services/storage/local_storage.dart';
import 'package:sizer/sizer.dart';

import 'configs/localization/localization_config.dart';
import 'configs/routes/routes.dart'; // Custom routes
import 'configs/routes/routes_name.dart'; // Route names
import 'configs/themes/dark_theme.dart'; // Dark theme configuration
import 'configs/themes/light_theme.dart'; // Light theme configuration

// GetIt is a package used for service locator or to manage dependency injection
GetIt getIt = GetIt.instance;

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // Ensuring that Flutter bindings are initialized
  servicesLocator(); // Initializing service locator for dependency injection
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]); // Disabling the rotation
  String languageCode = await getIt<LocalStorage>().readLanguage(); // Get the language code
  appLocale = Locale(languageCode); // Set the current app locale for the whole project
  runApp(const MyApp()); // Running the application
}

void rebuildAllChildren(BuildContext context) {
  void rebuild(Element el) {
    el.markNeedsBuild();
    el.visitChildren(rebuild);
  }

  (context as Element).visitChildren(rebuild);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key}); // Constructor for MyApp widget

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(builder: (context, orientation, screenType) {
      return MultiBlocProvider(
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
              locale: state.locale, //set the locale for the app
              localizationsDelegates: AppLocalizations.localizationsDelegates,
              supportedLocales: AppLocalizations.supportedLocales,
              initialRoute: RoutesName.product, // Initial route
              onGenerateRoute: Routes.generateRoute, // Generating routes
              builder: (context, child) => SizedBox(
                //Settings a parent widget with a key so that localization access can be achieved conveniently.
                key: navigatorKey,
                child: child,
              ),
            );
          },
        ),
      );
    });
  }
}

// Function for initializing service locator
void servicesLocator() {
  getIt.registerLazySingleton<ProductApiRepository>(
      () => ProductHttpApiRepository()); // Registering ProductHttpApiRepository as a lazy singleton for ProductApiRepository
  getIt.registerLazySingleton<LocalStorage>(() => LocalStorage()); // Registering Local storage for local storage.
}
