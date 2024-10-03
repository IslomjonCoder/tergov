import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:tergov/features/user/home/presentation/pages/user_dashboard/widgets/text_field.dart';
import 'package:tergov/utils/constants/enums.dart';
import '../../../../../../../generated/l10n.dart';
import '../../../../../../../utils/constants/colors.dart';
import '../../../../cubit/info_form_first_cubit.dart';
import '../model/info_first_model.dart';

class InfoFormFirst extends StatelessWidget {
  const InfoFormFirst({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<InfoFormFirstCubit, InfoFormFirstModel>(
      builder: (context, state) {
        final List<Map<String, dynamic>> fields = [
          {
            "hintText": S.of(context).processParticipant,
            "keyboardType": TextInputType.text,
            "hasDropdown": false,
            "value": state.participantFullName,
            "onChanged": (String value) {
              context.read<InfoFormFirstCubit>().updateFullName(value);
            },
          },
          {
            "hintText": S.of(context).residence,
            "keyboardType": TextInputType.text,
            "hasDropdown": false,
            "value": state.placeOfResidence,
            "onChanged": (String value) {
              context.read<InfoFormFirstCubit>().updatePlaceOfResidence(value);
            },
          },
          {
            "hintText": S.of(context).phoneNumber,
            "keyboardType": TextInputType.phone,
            "hasDropdown": false,
            "value": state.phoneNumber,
            "onChanged": (String value) {
              context.read<InfoFormFirstCubit>().updatePhoneNumber(value);
            },
          },
          {
            "hintText": S.of(context).selectParticipantStatus,
            "hasDropdown": true,
            "readOnly": true,
            "options": [
              "Айбланувчи / Обвиняемый",
              "Қонуний вакил / Законный представитель",
              "Қариндош / Родственник",
              "Бошқа иштирокчи / Другой участник процесса"
            ],
            "value": state.participantStatus,
            "onChanged": (String value) {
              context.read<InfoFormFirstCubit>().updateParticipantStatus(value);
            },
          },
          {
            "hintText": S.of(context).interviewConducted,
            "hasDropdown": true,
            "readOnly": true,
            "options": [
              "Xa/Да",
              "Yo'q/Нет",
            ],
            "value": state.interviewConducted,
            "onChanged": (String value) {
              context.read<InfoFormFirstCubit>().updateInterviewConducted(value);
            },
          },
          {
            "hintText": S.of(context).chiefInvestigator,
            "value": state.investigatorFullName,
            "onChanged": (String value) {
              context.read<InfoFormFirstCubit>().updateInvestigatorFullName(value);
            },
          },
          {
            "hintText": S.of(context).employeeConductingInquiry,
            "value": state.officerFullName,
            "onChanged": (String value) {
              context.read<InfoFormFirstCubit>().updateOfficerFullName(value);
            },
          },
          {
            "hintText": S.of(context).articleExplanation,
            "hasDropdown": true,
            "readOnly": true,
            "options": [
              "Xa/Да",
              "Yo'q/Нет",
            ],
            "value": state.article211Explanation,
            "onChanged": (String value) {
              context.read<InfoFormFirstCubit>().updateArticle211Explanation(value);
            },
          },
          {
            "hintText": S.of(context).videoRecording,
            "hasDropdown": true,
            "readOnly": true,
            "options": [
              YesNo.yes.name,
              YesNo.no.name,
            ],
            "value": state.interviewRecorded,
            "onChanged": (String value) {
              context.read<InfoFormFirstCubit>().updateInterviewRecorded(value);
            },
          },
          {
            "hintText": S.of(context).interviewDate,
            "readOnly": true,
            "hasCalendar": true,
            "value": state.interviewStartDate,
            "onChanged": (String value) {
              context.read<InfoFormFirstCubit>().updateInterviewStartDate(value);
            },
          },
        ];

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              S.of(context).mainInfo,
              style: const TextStyle(
                fontSize: 32,
                color: TColors.text006,
                fontWeight: FontWeight.w600,
              ),
            ),
            const Gap(20),
            ...fields.map((field) {
            return GlobalTextField(
              hintText: field["hintText"],
              keyboardType: field["keyboardType"] ?? TextInputType.text,
              hasDropdown: field["hasDropdown"] ?? false,
              readOnly: field["readOnly"] ?? false,
              hasCalendar: field["hasCalendar"] ?? false,
              options: field["options"] ?? [],
              controller: TextEditingController(),
              onChanged: field["onChanged"],
            );
          }).toList(),]
        );
      },
    );
  }
}
