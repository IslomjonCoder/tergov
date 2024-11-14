import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tergov/common/failure/failures.dart';
import 'package:tergov/features/dashboard/data/models/participant_roles.dart';
import 'package:tergov/features/dashboard/data/repositories/participant_repository.dart';

part 'participant_status_list_state.dart';

class ParticipantStatusListCubit extends Cubit<ParticipantStatusListState> {
  final ParticipantRepository _participantRepository;

  ParticipantStatusListCubit(this._participantRepository) : super(ParticipantStatusListInitial());

  Future<void> fetchParticipantRoles() async {
    emit(ParticipantStatusListLoading());
    final result = await _participantRepository.getParticipantRoles();
    result.fold(
      (failure) => emit(ParticipantStatusListError(failure: failure)),
      (participantRoles) => emit(ParticipantStatusListSuccess(participantRoles: participantRoles)),
    );
  }
}
