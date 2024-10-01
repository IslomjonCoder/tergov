import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:tergov/features/home/presentation/cubit/filter_cubit.dart';
import 'package:tergov/features/home/presentation/pages/dashboard/widgets/chart.dart';
import 'package:tergov/features/home/presentation/pages/dashboard/widgets/custom_filter.dart';
import 'package:tergov/features/home/presentation/pages/dashboard/widgets/small_earnings_widget.dart';
import 'package:tergov/utils/constants/colors.dart';

import '../../../../../../generated/l10n.dart';


class DashboardMobile extends StatelessWidget {
  const DashboardMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SmallEarningsWidget(
                title: S.of(context).victim,
                price: '\$40000',
                discount: '%23',
                since: 'since last month',
                onTap: () {}),
            const Gap(10),
            SmallEarningsWidget(
                title: S.of(context).accused,
                price: '\$57434',
                discount: '%20',
                since: 'since last year',
                onTap: () {}),
            const Gap(10),
            SmallEarningsWidget(
                title: S.of(context).suspect,
                price: '\$67700',
                discount: '%36',
                since: 'since last weak',
                onTap: () {}),
            const Gap(10),
            SmallEarningsWidget(
                title: S.of(context).legalRepresentative,
                price: '\$87600',
                discount: '%27',
                since: 'since last year',
                onTap: () {}),
            const Gap(30),
            BlocProvider(
              create: (context) => FilterCubit(),
              child: BlocBuilder<FilterCubit, int>(
                builder: (context, state) {
                  return const CustomFilter(isMobile: true,);
                },
              ),
            ),
            Column(
               crossAxisAlignment: CrossAxisAlignment.start,

              children: [
                Text(S.of(context).totalStats,
                    style: const TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 22,
                        color: TColors.text2B3)),
                const Chart()
              ],
            )
          ],
        ),
      ),
    );
  }
}
