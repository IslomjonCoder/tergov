import 'package:tergov/features/dashboard/data/models/participant_model.dart';
import 'package:tergov/main.dart';

class ParticipantDataSource {
  Future<void> uploadParticipant(Participant participant) async {}

  Future<Participant> getParticipantById(int id) async {
    final response = await supabase.from('participants').select('*, participant_roles(*, translations(*))').eq('id', id).single();
    return Participant.fromJson(response);
  }

  Future<List<Participant>> getAllParticipants() async {
    final response = await supabase.from('participants').select('*, participant_roles(*, translations(*))');
    print(response);
    return (response as List).map((e) => Participant.fromJson(e)).toList();
  }
}
