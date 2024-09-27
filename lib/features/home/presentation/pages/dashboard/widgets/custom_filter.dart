import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:tergov/features/home/presentation/cubit/date_cubit.dart';
import 'package:tergov/features/home/presentation/cubit/filter_cubit.dart';
import 'package:tergov/features/home/presentation/pages/dashboard/widgets/calendar_icon_button.dart';

import '../../../../../../utils/constants/colors.dart';

class CustomFilter extends StatelessWidget {
  const CustomFilter({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: [
          BlocProvider(
            create: (context) => DateCubit(),
            child: BlocBuilder<DateCubit, DateTime?>(
              builder: (context, state) {
                return const CalendarIconButton();
              },
            ),
          ),
          const Gap(10),
          BlocBuilder<FilterCubit, int>(
            builder: (context, selectedIndex) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildFilterButton(context, 0, "День", selectedIndex,
                      isFirst: true),
                  _buildFilterButton(context, 1, "Неделя", selectedIndex),
                  _buildFilterButton(context, 2, "Год", selectedIndex,
                      isLast: true),
                ],
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildFilterButton(BuildContext context, int index, String title,
      int selectedIndex,
      {bool isFirst = false, bool isLast = false}) {
    bool isSelected = index == selectedIndex;

    return GestureDetector(
      onTap: () {
        context.read<FilterCubit>().selectFilter(index);
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.horizontal(
            left: isFirst ? const Radius.circular(10.0) : Radius.zero,
            right: isLast ? const Radius.circular(10.0) : Radius.zero,
          ),
          border: Border(
            left: isFirst ? BorderSide.none : BorderSide(
                color: Colors.grey.shade300, width: 1),
            right: isLast ? BorderSide.none : BorderSide(
                color: Colors.grey.shade300, width: 1),
          ),
          boxShadow:
          [
            BoxShadow(
              color: isSelected ? TColors.text05C.withOpacity(0.3) : TColors
                  .black.withOpacity(0.1),
              blurRadius: 3,
              spreadRadius: 1,
              offset: const Offset(0, 3),
            )
          ],
        ),
        child: Text(
          title,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w700,
            color: isSelected ? TColors.primary : TColors.textA3A,
          ),
        ),
      ),
    );
  }
}
