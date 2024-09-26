import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../../../utils/constants/colors.dart';

class SmallEarningsWidget extends StatelessWidget {
  final String title;
  final String price;
  final String discount;
  final String since;
  final VoidCallback onTap;
  const SmallEarningsWidget({
    super.key, required this.title, required this.price, required this.discount, required this.since, required this.onTap,
  });

  @override
  Widget build(BuildContext context) {

    //TODO: format number should be used
    String formatNumber(double number) {
      final formatter = NumberFormat('#,##0.00');
      return formatter.format(number);
    }

    return InkWell(
      borderRadius: BorderRadius.circular(20),
      onTap: onTap,
      child: Ink(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: TColors.white,
            boxShadow: const [
              BoxShadow(
                color: TColors.grey,
                blurRadius: 5,
                offset: Offset(0, 5),
              )
            ]),
        child:  Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title,
                style: const TextStyle(
                    color: TColors.textA3A,
                    fontSize: 14,
                    fontWeight: FontWeight.w700)),
            Text(price,
                style: const TextStyle(
                    color: TColors.text2B3,
                    fontSize: 23,
                    fontWeight: FontWeight.w700)),
            Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                      text: discount,
                      style: const TextStyle(
                          color: TColors.text05C,
                          fontSize: 11,
                          fontWeight: FontWeight.w700)),
                  TextSpan(
                      text: " $since",
                      style: const TextStyle(
                          color: TColors.textA3A,
                          fontSize: 11,
                          fontWeight: FontWeight.w400)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
