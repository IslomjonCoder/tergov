import 'package:dartz/dartz.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:tergov/common/failure/failures.dart';
import 'package:tergov/features/dashboard/data/data_sources/participant_data_source.dart';
import 'package:tergov/features/dashboard/data/models/participant_model.dart';
import 'package:tergov/features/dashboard/data/models/participant_roles.dart';

class ParticipantRepository {
  final ParticipantDataSource _participantDataSource;

  ParticipantRepository(this._participantDataSource);

  Future<Either<Failure, Participant>> getParticipantById(int id) async {
    try {
      final participant = await _participantDataSource.getParticipantById(id);
      return Right(participant);
    } on PostgrestException catch (e) {

      return Left(Failure(e.message));

    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }

  Future<Either<Failure, List<Participant>>> getAllParticipants() async {
    try {
      final participants = await _participantDataSource.getAllParticipants();
      return Right(participants);
    } on PostgrestException catch (e) {
      return Left(Failure(e.message));
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }

  Future<Either<Failure, Participant>> uploadParticipant(Participant participant) async {
    try {
      await _participantDataSource.uploadParticipant(participant);
      return Right(participant);
    } on PostgrestException catch (e) {
      return Left(Failure(e.message));
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }

  Future<Either<Failure, List<ParticipantRole>>> getParticipantRoles() async {
    try {
      final participantRoles = await _participantDataSource.getParticipantRoles();
      return Right(participantRoles);
    } on PostgrestException catch (e) {
      return Left(Failure(e.message));
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }
}
