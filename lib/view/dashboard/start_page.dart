import 'package:fit_flow_flutter/utils/app_colors.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class StartPage extends StatelessWidget {
  StartPage({Key? key}) : super(key: key);

  List<Color> gradientColors = [
    AppColors.yellowColor,
    AppColors.blueColor,
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          child: Text(
            'Start Siden',
            style: TextStyle(color: Colors.white),
          ),
        ),
        Container(
          width: 400,
          height: 200,
          decoration: BoxDecoration(
            color: AppColors.darkGreyColor,
            borderRadius: BorderRadius.circular(30),
          ),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: LineChart(
              LineChartData(
                gridData: FlGridData(
                  show: true,
                  drawVerticalLine: true,
                  horizontalInterval: 1,
                  verticalInterval: 1,
                  getDrawingVerticalLine: (value) {
                    return FlLine(
                      color: AppColors.lightGreyColor,
                      strokeWidth: 1,
                    );
                  },
                  getDrawingHorizontalLine: (value) {
                    return FlLine(
                      color: AppColors.lightGreyColor,
                      strokeWidth: 1,
                    );
                  },
                ),
                titlesData: FlTitlesData(
                  show: true,
                  rightTitles: AxisTitles(
                    sideTitles: SideTitles(showTitles: false),
                  ),
                  topTitles: AxisTitles(
                    sideTitles: SideTitles(showTitles: false),
                  ),
                  bottomTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      reservedSize: 30,
                      interval: 1,
                      getTitlesWidget: bottomTitleWidgets,
                    ),
                  ),
                  leftTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      interval: 1,
                      getTitlesWidget: leftTitleWidgets,
                      reservedSize: 42,
                    ),
                  ),
                ),
                borderData: FlBorderData(
                  show: true,
                  border: Border.all(color: const Color(0xff37434d)),
                ),
                minX: 0,
                maxX: 11,
                minY: 0,
                maxY: 10,
                lineBarsData: [
                  LineChartBarData(
                    spots: const [
                      FlSpot(0, 7), // (måned, kg/10)
                      FlSpot(1, 2),
                      FlSpot(2, 5),
                      FlSpot(3, 3.1),
                      FlSpot(4, 4),
                      FlSpot(5, 3),
                      FlSpot(6, 4),
                      FlSpot(7, 3),
                      FlSpot(8, 2),
                      FlSpot(9, 5),
                      FlSpot(10, 3.1),
                      FlSpot(11, 4),
                      
                    ],
                    isCurved: true,
                    gradient: LinearGradient(
                      colors: gradientColors,
                    ),
                    barWidth: 5,
                    isStrokeCapRound: true,
                    dotData: FlDotData(
                      show: false,
                    ),
                    belowBarData: BarAreaData(
                      show: true,
                      gradient: LinearGradient(
                        colors: gradientColors
                            .map((color) => color.withOpacity(0.3))
                            .toList(),
                      ),
                    ),
                  ),
                ],
              ),
              swapAnimationCurve: Curves.linear,
            ),
          ),
        )
      ],
    );
  }

  Widget bottomTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(
      color: AppColors.lightGreyColor,
      fontWeight: FontWeight.bold,
      fontSize: 12,
    );
    Widget text;
    switch (value.toInt()) {
      case 0:
        text = RotationTransition(
            turns: AlwaysStoppedAnimation(310 / 360),
            child: const Text('JAN', style: style));
        break;
      case 1:
        text = RotationTransition(
            turns: AlwaysStoppedAnimation(310 / 360),
            child: const Text('FEB', style: style));
        break;
      case 2:
        text = RotationTransition(
            turns: AlwaysStoppedAnimation(310 / 360),
            child: const Text('MAR', style: style));
        break;
      case 3:
        text = RotationTransition(
            turns: AlwaysStoppedAnimation(310 / 360),
            child: const Text('APR', style: style));
        break;
      case 4:
        text = RotationTransition(
            turns: AlwaysStoppedAnimation(310 / 360),
            child: const Text('MAY', style: style));
        break;
      case 5:
        text = RotationTransition(
            turns: AlwaysStoppedAnimation(310 / 360),
            child: const Text('JUN', style: style));
        break;
      case 6:
        text = RotationTransition(
            turns: AlwaysStoppedAnimation(310 / 360),
            child: const Text('JUL', style: style));
        break;
      case 7:
        text = RotationTransition(
            turns: AlwaysStoppedAnimation(310 / 360),
            child: const Text('AUG', style: style));
        break;
      case 8:
        text = RotationTransition(
            turns: AlwaysStoppedAnimation(310 / 360),
            child: const Text('SEP', style: style));
        break;
      case 9:
        text = RotationTransition(
            turns: AlwaysStoppedAnimation(310 / 360),
            child: const Text('OCT', style: style));
        break;
      case 10:
        text = RotationTransition(
            turns: AlwaysStoppedAnimation(310 / 360),
            child: const Text('NOV', style: style));
        break;
      case 11:
        text = RotationTransition(
            turns: AlwaysStoppedAnimation(310 / 360),
            child: const Text('DEC', style: style));
        break;
      default:
        text = const Text('', style: style);
        break;
    }

    return SideTitleWidget(
      axisSide: meta.axisSide,
      child: text,
    );
  }

  Widget leftTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(
      color: AppColors.lightGreyColor,
      fontWeight: FontWeight.bold,
      fontSize: 12,
    );
    String text;
    switch (value.toInt()) {
      case 1:
        text = '10kg';
        break;
      case 3:
        text = '30kg';
        break;
      case 5:
        text = '50kg';
        break;
      case 7:
        text = '70kg';
        break;
      case 9:
        text = '90kg';
        break;
      default:
        return Container();
    }

    return Text(text, style: style, textAlign: TextAlign.left);
  }
}
