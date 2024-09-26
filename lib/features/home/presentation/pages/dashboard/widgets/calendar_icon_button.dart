import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tergov/features/home/presentation/cubit/date_cubit.dart';

class CalendarIconButton extends StatelessWidget {
  const CalendarIconButton({super.key});

  Future<void> _openDatePicker(BuildContext context) async {
    final DateCubit dateCubit = context.read<DateCubit>();

    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: dateCubit.state ?? DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );

    if (pickedDate != null) {
      dateCubit.pickDate(pickedDate);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DateCubit, DateTime?>(
      builder: (context, selectedDate) {
        return Column(
          children: [
            IconButton(
              onPressed: () {
                _openDatePicker(context);
              },
              icon: SvgPicture.asset(
                "assets/icons/calendar.svg",
                color: Colors.grey,
                width: 40,
              ),
            ),
            // if (selectedDate != null)
            //   Text(
            //     'Selected Date: ${selectedDate.toLocal()}',
            //     style: const TextStyle(fontSize: 16),
            //   ),
          ],
        );
      },
    );
  }
}
