import 'package:flutter/cupertino.dart';
import '../../../../../../generated/l10n.dart';
import 'data_point.dart';
import 'line_chart.dart';

class Chart extends StatelessWidget {
  const Chart({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final xLabels = [S.of(context).mon, S.of(context).tue, S.of(context).wed, S.of(context).thu, S.of(context).fri, S.of(context).sat, S.of(context).sun];
    return LineChartGraphWidget(
      dataPoints: dataPoints,
      xLabels: xLabels,
      maxYValue: 25,
    );
  }
}
