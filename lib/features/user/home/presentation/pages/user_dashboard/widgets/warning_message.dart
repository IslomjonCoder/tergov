import 'package:flutter/material.dart';
import 'package:tergov/features/user/home/presentation/pages/user_dashboard/widgets/warning_container.dart';

class WarningMessage extends StatelessWidget {
  final bool padding;

  const WarningMessage({super.key, this.padding = true});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: padding ? 150: 0),
      child: WarningContainer(
        margin: padding,
        title:
        "Мне разъяснено о том, что дача взятки, то есть заведомо незаконное предоставление должностному лицу государственного органа, организации с государственным участием или органа самоуправления граждан лично или через посредника материальных ценностей или имущественной выгоды за выполнение или невыполнение в интересах давшего взятку определенного действия, которое должностное лицо должно было или могло совершить с использованием своего служебного положения, предусматривает уголовное наказание в виде лишения свободы от пяти до пятнадцати лет.",
      ),
    );
  }
}
