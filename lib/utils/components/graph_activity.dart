import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import '../app_colors.dart';

/**
 * @authors Jackie, Christoffer & Jackie
 */
class GraphActivity extends StatefulWidget {
  final String yTitle;
  const GraphActivity({Key? key, required this.yTitle}) : super(key: key);

  @override
  State<GraphActivity> createState() => _GraphActivityState();
}

class _GraphActivityState extends State<GraphActivity> {
  List<Color> gradientColors = [
    AppColors.yellowColor,
    AppColors.yellowColor,
  ];

  List<String> dropdownitems = ["Ugelig", "Månedlig", "Årlig"];
  String selectedValue = "Månedlig";

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 800,
      height: 400,
      decoration: BoxDecoration(
        color: AppColors.darkGreyColor,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(
              left: 20,
              right: 20,
              top: 20,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  widget.yTitle,
                  style: TextStyle(color: AppColors.textColor, fontSize: 12),
                ),
                DropdownButtonHideUnderline(
                    child: DropdownButton2(
                  items: dropdownitems
                      .map((item) => DropdownMenuItem(
                            value: item,
                            child: Text(
                              item,
                              style: TextStyle(
                                  color: AppColors.textColor, fontSize: 12),
                            ),
                          ))
                      .toList(),
                  value: selectedValue,
                  onChanged: (value) {
                    setState(() {
                      selectedValue = value as String;
                    });
                  },
                  dropdownStyleData: DropdownStyleData(
                    decoration: BoxDecoration(
                      color: AppColors.darkGreyColor,
                    ),
                  ),
                  buttonStyleData: ButtonStyleData(width: 90, height: 20),
                  menuItemStyleData: MenuItemStyleData(height: 20),
                ))
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 20,
              right: 20,
              bottom: 20,
              top: 40,
            ),
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
                  maxY: 11,
                  lineBarsData: [
                    LineChartBarData(
                      spots: const [
                        FlSpot(0, 25/3), // (måned, antal træning / 3)
                        FlSpot(1, 17/3),
                        FlSpot(2, 30/3),
                        FlSpot(3, 24/3),
                        FlSpot(4, 12/3),
                        FlSpot(5, 16/3),
                        FlSpot(6, 24/3),
                        FlSpot(7, 17/3),
                        FlSpot(8, 20/3),
                        FlSpot(9, 21/3),
                        FlSpot(10, 22/3),
                        FlSpot(11, 23/3),
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
                  lineTouchData: LineTouchData(
                      touchTooltipData: LineTouchTooltipData(
                    tooltipBgColor: AppColors.darkGreyColor,
                    getTooltipItems: (List<LineBarSpot> touchedBarSpots) {
                      return touchedBarSpots.map((barSpot) {
                        final flSpot = barSpot;
                        if (flSpot.x == -1 || flSpot.x == 12) {
                          return null;
                        }
                        return LineTooltipItem("${flSpot.y*3}",
                            TextStyle(color: AppColors.textColor),
                            children: [TextSpan(text: " ")]);
                      }).toList();
                    },
                  ))),
              swapAnimationCurve: Curves.linear,
            ),
          ),
        ],
      ),
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
        text = '3';
        break;
      case 2:
        text = '6';
        break;
      case 3:
        text = '9';
        break;
      case 4:
        text = '12';
        break;
      case 5:
        text = '15';
        break;
      case 6:
        text = '18';
        break;
      case 7:
        text = '21';
        break;
      case 8:
        text = '24';
        break;
      case 9:
        text = '27';
        break;
      case 10:
        text = '30';
        break;
      default:
        return Container();
    }

    return Text(text, style: style, textAlign: TextAlign.left);
  }
}