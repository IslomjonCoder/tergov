import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:tergov/common/cubits/locale_cubit/locale_cubit.dart';
import 'package:tergov/features/authentication/data/data_sources/auth_datasource.dart';
import 'package:tergov/features/authentication/data/repositories/auth_repository.dart';
import 'package:tergov/features/dashboard/data/data_sources/participant_data_source.dart';
import 'package:tergov/features/dashboard/data/repositories/participant_repository.dart';
import 'package:tergov/features/redirect/manager/user_status.dart';
import 'package:tergov/generated/l10n.dart';
import 'package:tergov/utils/routes/app_router.dart';
import 'package:tergov/utils/theme/theme.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(create: (context) => ParticipantDataSource()),
        RepositoryProvider(create: (context) => ParticipantRepository(context.read<ParticipantDataSource>())),
        RepositoryProvider(create: (context) => AuthDataSource()),
        RepositoryProvider(create: (context) => AuthRepository(context.read<AuthDataSource>())),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => LocaleCubit()),
          BlocProvider(create: (context) => UserStatusCubit()),
        ],
        child: const MainApp(),
      ),
    );
  }
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: TAppTheme.lightTheme,
      darkTheme: TAppTheme.darkTheme,
      themeMode: ThemeMode.light,
      onGenerateRoute: AppRouter.onGenerateRoute,
      supportedLocales: S.delegate.supportedLocales,
      locale: context.watch<LocaleCubit>().state,
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
    );
  }
}
