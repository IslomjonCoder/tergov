import 'package:awesome_flutter_extensions/awesome_flutter_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:tergov/features/home/presentation/cubit/filter_cubit.dart';
import 'package:tergov/features/home/presentation/pages/dashboard/widgets/chart.dart';
import 'package:tergov/features/home/presentation/pages/dashboard/widgets/custom_filter.dart';
import 'package:tergov/features/home/presentation/pages/dashboard/widgets/small_earnings_widget.dart';
import 'package:tergov/utils/constants/colors.dart';

class DashboardDesktop extends StatelessWidget {
  const DashboardDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: SmallEarningsWidget(
                      title: 'Потерпевший', price: '\$40000', discount: '%23', since: 'since last month', onTap: () {}),
                ),
                Expanded(
                    child: SmallEarningsWidget(
                        title: 'Обвиняемый', price: '\$57434', discount: '%20', since: 'since last year', onTap: () {})),
                Expanded(
                  child: SmallEarningsWidget(
                      title: 'Подозреваемый', price: '\$67700', discount: '%36', since: 'since last weak', onTap: () {}),
                ),
                Expanded(
                  child: SmallEarningsWidget(
                      title: 'Законный представитель', price: '\$87600', discount: '%27', since: 'since last year', onTap: () {}),
                ),
              ].separatedBy(const Gap(20)),
            ),
            const Gap(30),
            BlocProvider(
              create: (context) => FilterCubit(),
              child: BlocBuilder<FilterCubit, int>(builder: (context, state) => const CustomFilter()),
            ),
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Общая статистика", style: TextStyle(fontWeight: FontWeight.w700, fontSize: 44, color: TColors.text2B3)),
                Gap(10),
                Chart()
              ],
            )
          ],
        ),
      ),
    );
  }
}
