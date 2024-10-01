import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tergov/app.dart';
import 'package:tergov/utils/observers/bloc_observer.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:tergov/utils/constants/app_config_template.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(url: AppConfig.supabaseUrl, anonKey: AppConfig.supabaseAnonKey);
  Bloc.observer = MyBlocObserver();
  
  runApp(const App());
}

final supabase = Supabase.instance.client;
