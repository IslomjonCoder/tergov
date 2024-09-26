import 'package:flutter/material.dart';
import 'package:tergov/common/widgets/layouts/templates/site_layout.dart';
import 'package:tergov/utils/routes/app_router.dart';
import 'package:tergov/utils/theme/theme.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: TAppTheme.lightTheme,
      darkTheme: TAppTheme.darkTheme,
      themeMode: ThemeMode.light,
      // routerDelegate: AppRouter.router.routerDelegate,
      // routeInformationParser: AppRouter.router.routeInformationParser,

      onGenerateRoute: AppRouter.onGenerateRoute,
    );
  }
}

class ResponsiveDesignScreen extends StatelessWidget {
  const ResponsiveDesignScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const TSiteTemplate();
  }
}
