import 'package:awesome_extensions/awesome_extensions.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:iconsax/iconsax.dart';
import 'package:tergov/features/dashboard/presentation/manager/users_table/users_list_cubit.dart';
import 'package:tergov/utils/constants/colors.dart';
import 'package:tergov/utils/constants/sizes.dart';
class ProfileDesktop extends StatelessWidget {
  const ProfileDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(30.0),
      child: Center(
        child: Column(
          children: [
            SearchField(),
            Gap(TSizes.spaceBtwSections),
            Expanded(child: UsersDataTable()),
          ],
        ),
      ),
    );
  }
}


class SearchField extends StatelessWidget {
  const SearchField({super.key});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: (value) => context.read<UsersListCubit>().search(value),
      decoration: const InputDecoration(
        prefixIcon: Icon(Iconsax.search_normal),
        hintText: 'Search',
      ),
    );
  }
}

class UsersDataTable extends StatelessWidget {
  const UsersDataTable({super.key});

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: context.theme.copyWith(cardTheme: const CardTheme(color: TColors.white, elevation: 0)),
      child: PaginatedDataTable2(
        columnSpacing: 12,
        dividerThickness: 0,
        minWidth: 786,
        horizontalMargin: 12,
        dataRowHeight: 56,
        headingTextStyle: context.titleMedium,
        headingRowColor: WidgetStateProperty.resolveWith((state) => TColors.primaryBackground),
        headingRowDecoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(TSizes.borderRadiusMd),
            topRight: Radius.circular(TSizes.borderRadiusMd),
          ),
        ),
        showCheckboxColumn: true,
        showFirstLastButtons: true,
        onPageChanged: (page) {},
        renderEmptyRowsInTheEnd: false,
        onRowsPerPageChanged: (int? rowsPerPage) {},
        sortAscending: true,
        sortArrowBuilder: (ascending, sorted) {
          return Icon(
            sorted ? (ascending ? Iconsax.arrow_up_3 : Iconsax.arrow_down) : Iconsax.arrow_3,
            size: TSizes.iconSm,
          );
        },
        sortColumnIndex: context.watch<UsersListCubit>().state.selectedColumnIndex,
        columns:  [
          DataColumn2(label: const Text('Name'), size: ColumnSize.L, onSort: context.read<UsersListCubit>().sortById),
          DataColumn2(label: const Text('Status'), size: ColumnSize.S, onSort: context.read<UsersListCubit>().sortById),
          const DataColumn2(label: Text('Phone Number')),
          const DataColumn2(label: Text('Job')),
          const DataColumn2(label: Text('Address')),
          const DataColumn2(label: Text('Marital status'), size: ColumnSize.S),
        ],
        source: UsersDataSource(context: context),
      ),
    );
  }

}

class UsersDataSource extends DataTableSource {
  final BuildContext context;

  UsersDataSource({required this.context});

  @override
  DataRow? getRow(int index) {
    final usersListCubit = context.watch<UsersListCubit>();
    final user = usersListCubit.state.filteredUsers[index];
    return DataRow2(
      selected: false,
      onSelectChanged: (bool? value) {},
      cells: [
        DataCell(
          Row(
            children: [
              ClipOval(child: Image.network(user.image, width: 40, height: 40, fit: BoxFit.cover)),
              const Gap(TSizes.md),
              Expanded(child: Text(user.name).boldSubString(context.watch<UsersListCubit>().state.searchQuery)),
            ],
          ),
        ),
        DataCell(Text(user.status)),
        DataCell(Text(user.phoneNumber)),
        DataCell(Text(user.job)),
        DataCell(Text(user.address)),
        DataCell(Text(user.maritalStatus)),
      ],
    );
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => context.watch<UsersListCubit>().state.filteredUsers.length;

  @override
  int get selectedRowCount => 0;
}

extension BoldSubString on Text {
  Text boldSubString(String target) {
    final textSpans = List.empty(growable: true);
    final escapedTarget = RegExp.escape(target);
    final pattern = RegExp(escapedTarget, caseSensitive: false);
    final matches = pattern.allMatches(data!);

    int currentIndex = 0;
    for (final match in matches) {
      final beforeMatch = data!.substring(currentIndex, match.start);
      if (beforeMatch.isNotEmpty) {
        textSpans.add(TextSpan(text: beforeMatch));
      }

      final matchedText = data!.substring(match.start, match.end);
      textSpans.add(
        TextSpan(
          text: matchedText,
          style:  TextStyle(fontWeight: FontWeight.bold,background: Paint()..color = Colors.lightGreenAccent),

        ),
      );

      currentIndex = match.end;
    }

    if (currentIndex < data!.length) {
      final remainingText = data!.substring(currentIndex);
      textSpans.add(TextSpan(text: remainingText));
    }

    return Text.rich(
      TextSpan(children: <TextSpan>[...textSpans]),
    );
  }
}