import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../../utils/constants/colors.dart';
import '../../../../cubit/info_form_cubit.dart';

class NextFormButton extends StatelessWidget {
  final String title;
  const NextFormButton({
    super.key, required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: BlocBuilder<FormCubit, bool>(
        builder: (context, state) {
          return FilledButton(
            style: FilledButton.styleFrom(
              backgroundColor: TColors.text006,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(2.0),
              ),
              padding: const EdgeInsets.symmetric(
                horizontal: 25,
                vertical: 20,
              ),
            ),
            onPressed: () {
                context.read<FormCubit>().toggleForm();
            },
            child: Text(
              title,
              style: const TextStyle(fontSize: 18),
            ),
          );
        },
      ),
    );
  }
}
