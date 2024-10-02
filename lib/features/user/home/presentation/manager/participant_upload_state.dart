part of 'participant_upload_cubit.dart';

class ParticipantUploadState {}

class ParticipantUploadInitial extends ParticipantUploadState {}

class ParticipantUploadLoading extends ParticipantUploadState {}

class ParticipantUploadSuccess extends ParticipantUploadState {}

class ParticipantUploadError extends ParticipantUploadState {
  final String message;

  ParticipantUploadError(this.message);
}
