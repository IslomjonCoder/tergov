part of 'participant_status_list_cubit.dart';

class ParticipantStatusListState {
  List<ParticipantRole> participantRoles;

  ParticipantStatusListState({this.participantRoles = const []});
}

class ParticipantStatusListInitial extends ParticipantStatusListState {}

class ParticipantStatusListLoading extends ParticipantStatusListState {}

class ParticipantStatusListError extends ParticipantStatusListState {
  final Failure failure;

  ParticipantStatusListError({required this.failure});
}

class ParticipantStatusListSuccess extends ParticipantStatusListState {
  ParticipantStatusListSuccess({required super.participantRoles});
}
