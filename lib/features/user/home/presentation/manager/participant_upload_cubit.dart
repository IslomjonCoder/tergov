import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tergov/features/dashboard/data/models/participant_model.dart';
import 'package:tergov/features/dashboard/data/repositories/participant_repository.dart';

part 'participant_upload_state.dart';

class ParticipantUploadCubit extends Cubit<ParticipantUploadState> {
  final ParticipantRepository _participantRepository;

  ParticipantUploadCubit(this._participantRepository) : super(ParticipantUploadInitial());

  Future<void> uploadParticipant(Participant participant) async {
    emit(ParticipantUploadLoading());

    Future.delayed(const Duration(seconds: 2), () => emit(ParticipantUploadSuccess()));
    // final result = await _participantRepository.uploadParticipant(participant);
    // result.fold(
    //   (failure) => emit(ParticipantUploadError(failure.message)),
    //   (participant) => emit(ParticipantUploadSuccess()),
    // );
  }
}
