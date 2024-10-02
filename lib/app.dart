import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:tergov/generated/l10n.dart';
import 'package:tergov/locale_cubit/locale_cubit.dart';
import 'package:tergov/utils/routes/app_router.dart';
import 'package:tergov/utils/theme/theme.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LocaleCubit(),
      child: BlocBuilder<LocaleCubit, Locale>(
        builder: (context, locale) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: TAppTheme.lightTheme,
            darkTheme: TAppTheme.darkTheme,
            themeMode: ThemeMode.light,
            onGenerateRoute: AppRouter.onGenerateRoute,
            supportedLocales: S.delegate.supportedLocales,
            locale: locale,
            localizationsDelegates: const [
              S.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
          );
        },
      ),
    );
  }
}
