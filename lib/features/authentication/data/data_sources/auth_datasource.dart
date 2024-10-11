import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:tergov/main.dart';
import 'package:tergov/utils/constants/app_config_template.dart';

class AuthDataSource {
  Future<void> login(String email, String password) async {
    await supabase.auth.signInWithPassword(email: email, password: password);
  }

  Future<void> register(String email, String password, Map<String, dynamic> data) async {
    final supabaseAdmin = SupabaseClient(AppConfig.supabaseUrl, AppConfig.supabaseSecretKey);
    await supabaseAdmin.auth.admin.createUser(AdminUserAttributes(email: email, password: password, data: data,emailConfirm: true));
  }
}
