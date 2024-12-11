import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:tergov/common/cubits/locale_cubit/locale_cubit.dart';
import 'package:tergov/features/dashboard/data/models/participant_roles.dart';
import 'package:tergov/features/user/home/cubit/info_form_first_cubit.dart';
import 'package:tergov/features/user/home/cubit/participant_status/participant_status_list_cubit.dart';
import 'package:tergov/features/user/home/presentation/pages/user_dashboard/model/info_first_model.dart';
import 'package:tergov/generated/l10n.dart';
import 'package:tergov/utils/constants/enums.dart';
import 'package:tergov/utils/constants/sizes.dart';
import 'package:tergov/utils/validators/validators.dart';

class InfoFormFirst extends StatelessWidget {
  const InfoFormFirst({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<InfoFormFirstCubit, InfoFormFirstModel>(
      builder: (context, state) {
        // final List<Map<String, dynamic>> fields = [
        //   {
        //     "hintText": "Участник(ца) процесса, прошедший(ая) беседу: ФИО",
        //     "keyboardType": TextInputType.text,
        //     "hasDropdown": false,
        //     "value": state.participantFullName,
        //     "onChanged": (String value) {
        //     },
        //   },
        //   {
        //     "hintText": "Место проживания",
        //     "keyboardType": TextInputType.text,
        //     "hasDropdown": false,
        //     "value": state.placeOfResidence,
        //     "onChanged": (String value) {
        //     },
        //   },
        //   {
        //     "hintText": "Номер телефона",
        //     "keyboardType": TextInputType.phone,
        //     "hasDropdown": false,
        //     "value": state.phoneNumber,
        //     "onChanged": (String value) {
        //     },
        //   },
        //   {
        //     "hintText": "Выберите Статус участника(цы) процесса",
        //     "hasDropdown": true,
        //     "readOnly": true,
        //     "options": [
        //       "Айбланувчи / Обвиняемый",
        //       "Қонуний вакил / Законный представитель",
        //       "Қариндош / Родственник",
        //       "Бошқа иштирокчи / Другой участник процесса",
        //     ],
        //     "value": state.participantRole?.roleName,
        //     "onChanged": (ParticipantRole value) {
        //       context.read<InfoFormFirstCubit>().updateParticipantStatus(value);
        //     },
        //   },
        //   {
        //     "hintText": "Беседа проведена",
        //     "hasDropdown": true,
        //     "readOnly": true,
        //     "options": [
        //       "Xa/Да",
        //       "Yo'q/Нет",
        //     ],
        //     "value": state.interviewConducted,
        //     "onChanged": (String value) {
        //     },
        //   },
        //   {
        //     "hintText": "Начальник следственного отделения,проводивший беседу: ФИО",
        //     "value": state.investigatorFullName,
        //     "onChanged": (String value) {
        //     },
        //   },
        //   {
        //     "hintText": "Сотрудник, проводивший доследственную проверку,дознание или расследование: ФИО",
        //     "value": state.officerFullName,
        //     "onChanged": (String value) {
        //     },
        //   },
        //   {
        //     "hintText": "В ходе беседы разъяснено содержание статьи 211Уголовного кодекса Республики Узбекистан",
        //     "hasDropdown": true,
        //     "readOnly": true,
        //     "options": [
        //       "Xa/Да",
        //       "Yo'q/Нет",
        //     ],
        //     "value": state.article211Explanation,
        //     "onChanged": (String value) {
        //     },
        //   },
        //   {
        //     "hintText": "Процесс собеседования видеозаписью",
        //     "hasDropdown": true,
        //     "readOnly": true,
        //     "options": [
        //       YesNo.yes.name,
        //       YesNo.no.name,
        //     ],
        //     "value": state.interviewRecorded,
        //     "onChanged": (String value) {
        //     },
        //   },
        //   {
        //     "hintText": "Дата беседы",
        //     "readOnly": true,
        //     "hasCalendar": true,
        //     "value": state.interviewStartDate,
        //     "onChanged": (String value) {
        //       // context.read<InfoFormFirstCubit>().updateInterviewStartDate(value);
        //     },
        //   },
        // ];
        final infoFormFirstCubit = context.read<InfoFormFirstCubit>();
        return Form(
          key: infoFormFirstCubit.formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.next,
                validator: (value) => AppValidators.validateEmpty(value, fieldName: S.of(context).full_name_field),
                decoration: InputDecoration(labelText: S.of(context).full_name_hint),
                textCapitalization: TextCapitalization.sentences,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                controller: infoFormFirstCubit.fullNameController,
              ),
              const Gap(TSizes.spaceBtwItems),
              TextFormField(
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.next,
                validator: (value) => AppValidators.validateEmpty(value, fieldName: S.of(context).residence_field),
                decoration: InputDecoration(labelText: S.of(context).residence_hint),
                textCapitalization: TextCapitalization.sentences,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                controller: infoFormFirstCubit.placeOfResidenceController,
              ),
              const Gap(TSizes.spaceBtwItems),
              TextFormField(
                keyboardType: TextInputType.phone,
                inputFormatters: [infoFormFirstCubit.maskFormatter],
                textInputAction: TextInputAction.next,
                validator: (value) {
                  if (infoFormFirstCubit.maskFormatter.isFill()) {
                    return AppValidators.validateEmpty(value, fieldName: S.of(context).phone_number_field);
                  } else if (value == null || value.isEmpty) {
                    return AppValidators.validateEmpty(value, fieldName: S.of(context).phone_number_field);
                  }
                  return null;
                },
                decoration: InputDecoration(labelText: S.of(context).phone_number_hint),
                autovalidateMode: AutovalidateMode.onUserInteraction,
                controller: infoFormFirstCubit.phoneNumberController,
              ),
              const Gap(TSizes.spaceBtwItems),

              DropdownButtonFormField<ParticipantRole>(
                items: context.watch<ParticipantStatusListCubit>().state.participantRoles.map((role) {
                  return DropdownMenuItem(
                    value: role,
                    child: BlocBuilder<LocaleCubit, Locale>(
                      builder: (context, locale) {
                        return Text(role.translations.firstOrNull?.getTranslatedRoleName(locale.languageCode) ?? role.roleName);
                      },
                    ),
                  );
                }).toList(),
                autovalidateMode: AutovalidateMode.onUserInteraction,
                decoration: InputDecoration(
                  labelText: S.of(context).interview_conducted_hint,
                ),
                hint: context.watch<ParticipantStatusListCubit>().state is ParticipantStatusListError ?Text((context.watch<ParticipantStatusListCubit>().state as ParticipantStatusListError).failure.message):null,
                // validator: (value) => AppValidators.validateEmpty(value?.roleName, fieldName: S.of(context).participant_status_field),
                validator: (value) =>
                    AppValidators.validateType<ParticipantRole>(value, fieldName: S.of(context).interview_conducted_field),
                onChanged: context.read<InfoFormFirstCubit>().updateParticipantStatus,
              ),
              const Gap(TSizes.spaceBtwItems),
              TextFormField(
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(labelText: S.of(context).investigator_full_name_hint),
                validator: (value) => AppValidators.validateEmpty(value, fieldName: S.of(context).investigator_full_name_field),
                autovalidateMode: AutovalidateMode.onUserInteraction,
                controller: infoFormFirstCubit.investigatorFullNameController,
                textCapitalization: TextCapitalization.sentences,
              ),
              const Gap(TSizes.spaceBtwItems),
              TextFormField(
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(labelText: S.of(context).officer_full_name_hint),
                validator: (value) => AppValidators.validateEmpty(value, fieldName: S.of(context).officer_full_name_field),
                autovalidateMode: AutovalidateMode.onUserInteraction,
                controller: infoFormFirstCubit.officerFullNameController,
                textCapitalization: TextCapitalization.sentences,
              ),
              const Gap(TSizes.spaceBtwItems),
              DropdownButtonFormField<YesNo>(
                items: YesNo.values
                    .map(
                      (value) =>
                          DropdownMenuItem(value: value, child: Text(value == YesNo.yes ? S.of(context).yes : S.of(context).no)),
                    )
                    .toList(),
                autovalidateMode: AutovalidateMode.onUserInteraction,
                decoration: InputDecoration(labelText: S.of(context).article_211_explanation_hint),
                validator: (value) =>
                    AppValidators.validateType<YesNo>(value, fieldName: S.of(context).article_211_explanation_field),
                onChanged: infoFormFirstCubit.updateArticle211Explanation,
              ),
              const Gap(TSizes.spaceBtwItems),
              DropdownButtonFormField<RecordType>(
                items: [
                  DropdownMenuItem(value: RecordType.recorded, child: Text(S.of(context).fixed)),
                  DropdownMenuItem(value: RecordType.notRecorded, child: Text(S.of(context).notFixed)),
                ],
                autovalidateMode: AutovalidateMode.onUserInteraction,
                decoration: InputDecoration(labelText: S.of(context).interview_recorded_hint),
                validator: (value) =>
                    AppValidators.validateType<RecordType>(value, fieldName: S.of(context).interview_recorded_field),
                onChanged: (value) {},
              ),
              const Gap(TSizes.spaceBtwItems),
              TextFormField(
                onTap: () async {
                  final pickedDate = await showDatePicker(
                    context: context,
                    firstDate: DateTime(2000),
                    lastDate: DateTime.now(),
                    initialDate: DateTime.now(),
                  );

                  if (pickedDate != null) {
                    if (!context.mounted) return;
                    context.read<InfoFormFirstCubit>().updateInterviewStartDate(pickedDate);
                  }
                },
                keyboardType: TextInputType.datetime,
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(
                  labelText: S.of(context).interview_start_date_hint,
                  suffixIcon: const Icon(Icons.calendar_month),
                ),
                validator: (value) => AppValidators.validateEmpty(value, fieldName: S.of(context).interview_start_date_field),
                autovalidateMode: AutovalidateMode.onUserInteraction,
                controller: context.watch<InfoFormFirstCubit>().interviewStartDate,
                readOnly: true,
              ),
            ],
          ),
        );
      },
    );
  }
}
