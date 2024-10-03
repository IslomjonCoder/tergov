import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:tergov/features/user/home/presentation/pages/user_dashboard/widgets/warning_container.dart';

import '../../../../../../../generated/l10n.dart';
import '../../../../cubit/info_form_cubit.dart';
import 'next_form_button.dart';

class WarningMessage extends StatelessWidget {
  final bool padding;

  const WarningMessage({super.key, this.padding = true,});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FormCubit, bool>(
      builder: (context, state) {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: padding ? 150 : 0),
          child: Column(
            children: [
              WarningContainer(
                margin: padding,
                title: state
                    ?
                S.of(context).warning_message_1
                    :
                S.of(context).warning_message_2,
              ),
              const Gap(50),
              NextFormButton(title: state? S.of(context).next : S.of(context).submit,),
            ],
          ),
        );
      },
    );
  }
}
