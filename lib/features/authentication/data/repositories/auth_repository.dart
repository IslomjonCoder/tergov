import 'package:dartz/dartz.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:tergov/common/failure/failures.dart';
import 'package:tergov/features/authentication/data/data_sources/auth_datasource.dart';

class AuthRepository {
  final AuthDataSource _authDataSource;

  AuthRepository(this._authDataSource);

  Future<Either<Failure, void>> login(String email, String password) async {
    try {
      await _authDataSource.login(email, password);
      return const Right(null);
    } on PostgrestException catch (e) {
      return Left(Failure(e.message));
    } on AuthApiException catch (e) {
      return Left(Failure(e.message));
    } on AuthWeakPasswordException catch (e) {
      return Left(Failure(e.message));
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }

  Future<Either<Failure, void>> register(String email, String password, Map<String, dynamic> data) async {
    try {
      await _authDataSource.register(email, password, data);
      return const Right(null);
    } on PostgrestException catch (e) {
      return Left(Failure(e.message));
    } on AuthApiException catch (e) {
      return Left(Failure(e.message));
    } on AuthWeakPasswordException catch (e) {
      return Left(Failure(e.message));
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }
}
