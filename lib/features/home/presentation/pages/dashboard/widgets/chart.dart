import 'package:flutter/cupertino.dart';
import 'package:tergov/features/home/presentation/pages/dashboard/widgets/x_labels.dart';

import 'data_point.dart';
import 'line_chart.dart';

class Chart extends StatelessWidget {
  const Chart({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return LineChartGraphWidget(
      dataPoints: dataPoints,
      xLabels: xLabels,
      maxYValue: 25,
    );
  }
}
