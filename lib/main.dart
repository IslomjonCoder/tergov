import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:tergov/app.dart';
import 'package:tergov/utils/constants/app_config_template.dart';
import 'package:tergov/utils/observers/bloc_observer.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  WidgetsFlutterBinding.ensureInitialized();
  HydratedBloc.storage = await HydratedStorage.build(storageDirectory: await getApplicationDocumentsDirectory());
  await Supabase.initialize(url: AppConfig.supabaseUrl, anonKey: AppConfig.supabaseAnonKey);
  Bloc.observer = MyBlocObserver();

  runApp(const App());
}

// ignore: document_ignores
// ignore: unreachable_from_main
final supabase = Supabase.instance.client;
