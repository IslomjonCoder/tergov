import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:tergov/features/user/home/presentation/pages/user_dashboard/widgets/warning_container.dart';

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
                "Мне разъяснено о том, что дача взятки, то есть заведомо незаконное предоставление должностному лицу государственного органа, организации с государственным участием или органа самоуправления граждан лично или через посредника материальных ценностей или имущественной выгоды за выполнение или невыполнение в интересах давшего взятку определенного действия, которое должностное лицо должно было или могло совершить с использованием своего служебного положения, предусматривает уголовное наказание в виде лишения свободы от пяти до пятнадцати лет."
                    :
                "Если Вас не устраивают доследственная проверка, дознание или предварительное следствие проведенных следственными подразделениями органов внутренних дел, а также несвоевременное рассмотрение Ваших обращений, Вы можете напрямую связаться с руководителями Следственного управления при УВД Наманганской области и его территориальных подразделений по следующим телефонам:Заместитель начальника УВД Наманганской области – начальник Следственного управления Ибодов Жаҳонгир Насулло ўғли:Тел: 998 95-318-04-00, 998 69-210-30-04",
              ),
              Gap(50),
              NextFormButton(title: state? "Далее" : "Отправить",),
            ],
          ),
        );
      },
    );
  }
}
