import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:fit_flow_flutter/models/graph_data_model.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../utils/app_colors.dart';

/// Represents a graph overview widget that displays a line chart with dropdown selection.
///
///authors: Jackie, Christoffer & Jakob
class GraphOverview extends StatefulWidget {
  final String title;
  final int goalWeight;
  final List<GraphData> graphData;

  const GraphOverview({
    Key? key,
    required this.title,
    required this.goalWeight,
    required this.graphData,
  }) : super(key: key);

  @override
  State<GraphOverview> createState() => _GraphOverviewState();
}

class _GraphOverviewState extends State<GraphOverview> {
  List<Color> gradientColors = [AppColors.yellowColor, AppColors.yellowColor];
  List<String> dropdownItems = ["Ugelig", "Månedlig", "Årlig"];
  String selectedValue = "Månedlig";

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 400,
      height: 250,
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
                  widget.title,
                  style: TextStyle(color: AppColors.textColor, fontSize: 12),
                ),
                DropdownButtonHideUnderline(
                  child: DropdownButton2(
                    items: dropdownItems
                        .map(
                          (item) => DropdownMenuItem(
                            value: item,
                            child: Text(
                              item,
                              style: TextStyle(
                                color: AppColors.textColor,
                                fontSize: 12,
                              ),
                            ),
                          ),
                        )
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
                  ),
                ),
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
                      color: Colors.transparent,
                      strokeWidth: 1,
                    );
                  },
                ),
                extraLinesData: ExtraLinesData(horizontalLines: [
                  HorizontalLine(
                    y: widget.goalWeight.toDouble(),
                    color: AppColors.greenColor,
                  ),
                ]),
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
                maxY: double.parse(
                    (widget.goalWeight + (widget.goalWeight * 0.1)).toString()),
                lineBarsData: [
                  LineChartBarData(
                    spots: List.generate(12, (index) {
                      int todayMonth = DateTime.now().month;
                      int adjustedMonth = todayMonth - index - 1;
                      int adjustedIndex = adjustedMonth >= 0
                          ? adjustedMonth
                          : 12 + adjustedMonth;
                      return FlSpot(index.toDouble(),
                          widget.graphData[adjustedIndex].maxWeight);
                    }),
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
                        return LineTooltipItem(
                          "${flSpot.y}",
                          TextStyle(color: AppColors.textColor),
                          children: [TextSpan(text: " kg")],
                        );
                      }).toList();
                    },
                  ),
                ),
              ),
              swapAnimationCurve: Curves.linear,
            ),
          ),
        ],
      ),
    );
  }

  /// Builds the widget for bottom titles on the graph.
  ///
  /// authors: Jackie, Christoffer & Jakob
  Widget bottomTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(
      color: AppColors.lightGreyColor,
      fontWeight: FontWeight.bold,
      fontSize: 12,
    );
    Widget text;

    DateTime now = DateTime.now();
    int currentMonth = now.month - 1;
    int monthIndex = (currentMonth - value.toInt()) % 12;
    if (monthIndex < 0) {
      monthIndex += 12;
    }

    String monthName = DateFormat.MMM().format(
      DateTime(now.year, monthIndex + 1, 1),
    );

    text = RotationTransition(
      turns: AlwaysStoppedAnimation(310 / 360),
      child: Text(monthName, style: style),
    );

    return SideTitleWidget(
      axisSide: meta.axisSide,
      child: text,
    );
  }

  /// Builds the widget for left titles on the graph.
  ///
  /// authors: Jackie, Christoffer & Jakob
  Widget leftTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(
      color: AppColors.lightGreyColor,
      fontWeight: FontWeight.bold,
      fontSize: 12,
    );
    String text;
    int maxWeight = widget
        .goalWeight; //TODO: Måske der skal laves noget dynamisk hvis max vægt er mere end målet
    int lowestWeight = (maxWeight * 0.1).toInt();

    final double spacing = (maxWeight - lowestWeight) / 4;
    final List<int> values = [
      lowestWeight,
      for (int i = 1; i <= 3; i++) (lowestWeight + (spacing * i)).round(),
      maxWeight
    ];

    if (values.contains(value.toInt())) {
      text = '${value.toInt()}kg';
    } else {
      return Container();
    }

    return Text(text, style: style, textAlign: TextAlign.left);
  }
}
