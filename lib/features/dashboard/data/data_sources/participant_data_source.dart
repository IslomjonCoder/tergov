import 'package:tergov/features/dashboard/data/models/participant_model.dart';
import 'package:tergov/features/dashboard/data/models/participant_roles.dart';
import 'package:tergov/main.dart';

class ParticipantDataSource {
  Future<void> uploadParticipant(Participant participant) async {}

  Future<Participant> getParticipantById(int id) async {
    final response = await supabase.from('participants').select('*, participant_roles(*, translations(*))').eq('id', id).single();
    return Participant.fromJson(response);
  }

  Future<List<Participant>> getAllParticipants() async {
    final response = await supabase.from('participants').select('*, participant_roles(*, translations(*))');
    return (response as List).map((e) => Participant.fromJson(e)).toList();
  }

  Future<List<ParticipantRole>> getParticipantRoles() async {
    final response = await supabase.from('participant_roles').select('*, translations(*)');
    return (response as List).map((e) => ParticipantRole.fromJson(e)).toList();
  }
}
