import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:tergov/app.dart';
import 'package:tergov/utils/constants/app_config_template.dart';

Future<void> main() async {
  await Supabase.initialize(url: AppConfig.supabaseUrl, anonKey: AppConfig.supabaseAnonKey);
  runApp(const App());
}

final supabase = Supabase.instance.client;
