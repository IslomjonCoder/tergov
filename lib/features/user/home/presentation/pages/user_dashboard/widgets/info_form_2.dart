import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:tergov/features/user/home/cubit/info_form_second_cubit.dart';
import 'package:tergov/features/user/home/presentation/pages/user_dashboard/model/info_form_second_model.dart';
import 'package:tergov/generated/l10n.dart';
import 'package:tergov/utils/constants/colors.dart';
import 'package:tergov/utils/constants/enums.dart';
import 'package:tergov/utils/constants/sizes.dart';
import 'package:tergov/utils/validators/validators.dart';

class InfoFormSecond extends StatelessWidget {
  const InfoFormSecond({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<InfoFormSecondCubit, InfoFormSecondModel>(
      builder: (context, state) {
        final List<Map<String, dynamic>> fields = [
          {
            "hintText": "Имели ли место со стороны сотрудника следующие факты?",
            "hasDropdown": true,
            "value": state.employeeFacts,
            "onChanged": (String value) {
            },
          },
          {
            "hintText": "Длительные беспричинные ожидания",
            "hasDropdown": false,
            "value": state.longWaits,
            "onChanged": (String value) {
            },
          },
          {
            "hintText": "Грубое обращение",
            "hasDropdown": false,
            "value": state.rudeBehavior,
            "onChanged": (String value) {
            },
          },
          {
            "hintText": "Психологическое давление",
            "hasDropdown": false,
            "value": state.psychologicalPressure,
            "onChanged": (String value) {
            },
          },
          {
            "hintText": "Физическое давление",
            "hasDropdown": true,
            "readOnly": true,
            "options": ["Да", "Нет"],
            "value": state.physicalPressure,
            "onChanged": (String value) {
              // context.read<InfoFormSecondCubit>().updatePhysicalPressure(value);
            },
          },
          {
            "hintText": "Вымогательство незаконного вознаграждения",
            "hasDropdown": true,
            "readOnly": true,
            "options": ["Да", "Нет"],
            "value": state.extortion,
            "onChanged": (String value) {
              // context.read<InfoFormSecondCubit>().updateExtortion(value);
            },
          },
        ];
        final infoFormSecondCubit = context.read<InfoFormSecondCubit>();
        return Form(
          key: infoFormSecondCubit.formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Ваше соглашение",
                style: TextStyle(
                  fontSize: 32,
                  color: TColors.text006,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const Gap(TSizes.spaceBtwSections),
              TextFormField(
                keyboardType: TextInputType.multiline,
                textInputAction: TextInputAction.newline,
                decoration: InputDecoration(labelText: S.of(context).employee_facts_hint),
                textCapitalization: TextCapitalization.sentences,
                validator: (value) => AppValidators.validateEmpty(value, fieldName: S.of(context).employee_facts_field),
                autovalidateMode: AutovalidateMode.onUserInteraction,
                controller: infoFormSecondCubit.employeeFactsController,
              ),
              const Gap(TSizes.spaceBtwItems),
              TextFormField(
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(labelText: S.of(context).long_waits_hint),
                textCapitalization: TextCapitalization.sentences,
                validator: (value) => AppValidators.validateEmpty(value, fieldName: S.of(context).long_waits_field),
                autovalidateMode: AutovalidateMode.onUserInteraction,
                controller: infoFormSecondCubit.longWaitsController,
              ),
              const Gap(TSizes.spaceBtwItems),
              TextFormField(
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(labelText: S.of(context).rude_behavior_hint),
                textCapitalization: TextCapitalization.sentences,
                validator: (value) => AppValidators.validateEmpty(value, fieldName: S.of(context).rude_behavior_field),
                autovalidateMode: AutovalidateMode.onUserInteraction,
                controller: infoFormSecondCubit.rudeBehaviorController,
              ),
              const Gap(TSizes.spaceBtwItems),
              TextFormField(
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(labelText: S.of(context).psychological_pressure_hint),
                textCapitalization: TextCapitalization.sentences,
                validator: (value) => AppValidators.validateEmpty(value, fieldName: S.of(context).psychological_pressure_field),
                autovalidateMode: AutovalidateMode.onUserInteraction,
                controller: infoFormSecondCubit.psychologicalPressureController,
              ),
              const Gap(TSizes.spaceBtwItems),
              DropdownButtonFormField<YesNo>(
                items: YesNo.values.map((value) => DropdownMenuItem<YesNo>(value: value, child: Text(value == YesNo.yes ? S.of(context).yes : S.of(context).no))).toList(),
                onChanged: infoFormSecondCubit.updatePhysicalPressure,
                 decoration:  InputDecoration(labelText: S.of(context).physical_pressure_hint),
                validator: (value) => AppValidators.validateType<YesNo>(value, fieldName: S.of(context).physical_pressure_field),
              ),
              const Gap(TSizes.spaceBtwItems),
              DropdownButtonFormField<YesNo>(
                items: YesNo.values.map((value) => DropdownMenuItem<YesNo>(value: value, child: Text(value == YesNo.yes ? S.of(context).yes : S.of(context).no))).toList(),
                onChanged: infoFormSecondCubit.updateExtortion,
                 decoration:  InputDecoration(labelText: S.of(context).extortion_hint),
                validator: (value) => AppValidators.validateType<YesNo>(value, fieldName: S.of(context).extortion_field),
              ),

              // ...fields.map((field) {
              //   return GlobalTextField(
              //     hintText: field["hintText"],
              //     keyboardType: field["keyboardType"] ?? TextInputType.text,
              //     hasDropdown: field["hasDropdown"] ?? false,
              //     readOnly: field["readOnly"] ?? false,
              //     hasCalendar: field["hasCalendar"] ?? false,
              //     options: field["options"] ?? [],
              //     controller: TextEditingController(text: field["value"]),
              //     onChanged: field["onChanged"],
              //   );
              // }),
            ],
          ),
        );
      },
    );
  }
}
