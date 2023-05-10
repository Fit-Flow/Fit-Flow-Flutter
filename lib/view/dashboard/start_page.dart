import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:fit_flow_flutter/utils/app_colors.dart';
import 'package:fit_flow_flutter/utils/components/graph_activity.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import '../../utils/components/graph_overview.dart';

class StartPage extends StatelessWidget {
  StartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Expanded(
        child: CustomScrollView(
          scrollDirection: Axis.vertical,
          slivers: [
            SliverFillRemaining(
              hasScrollBody: false,
              child:  Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    child: Text(
                      'Oversigt',
                      style: TextStyle(color: AppColors.textColor, fontSize: 24, fontWeight: FontWeight.w900),
                    ),
                  ),
                  SizedBox(height: 10,),
                  Wrap(
                    spacing: 10,
                    runSpacing: 10,
                    children: [
                      GraphOverview(
                        title: "Bænkpres",
                        goalWeight: 80,
                      ),
                      GraphOverview(
                        title: "Dødløft",
                        goalWeight: 40,
                      ),
                      GraphOverview(
                        title: "Squat",
                        goalWeight: 75,
                      ),
                    ],
                  ),
                  SizedBox(height: 20,),
                  Container(
                    child: Text(
                      'Aktivitet',
                      style: TextStyle(color: AppColors.textColor, fontSize: 24, fontWeight: FontWeight.w900),
                    ),
                  ), GraphActivity(title: "Aktivitet",)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

