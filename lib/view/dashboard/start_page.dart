import 'package:fit_flow_flutter/utils/components/graph_activity.dart';
import 'package:fit_flow_flutter/view_model/graph_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/components/graph_overview.dart';
import '../../utils/components/header_widget.dart';
import '../../utils/components/latest_workouts_widget.dart';

/// The [StartPage] class represents the start page in the FitFlow app.
///
/// This page displays an overview of graphs, activity, and the latest workouts.
///
///authors: Jackie, Christoffer & Jakob
class StartPage extends StatelessWidget {
  StartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            HeaderWidget(
              title: "Oversigt",
            ),
            SizedBox(
              height: 15,
            ),
            OverviewGraphs(),
            SizedBox(
              height: 25,
            ),
            HeaderWidget(
              title: "Aktivitet",
            ),
            SizedBox(
              height: 15,
            ),
            GraphActivity(
              yTitle: "Dage",
            ),
            SizedBox(
              height: 25,
            ),
            HeaderWidget(
              title: "Seneste træninger",
            ),
            SizedBox(
              height: 15,
            ),
            LatestWorkoutsWidget(),
          ],
        ),
      ),
    );
  }
}

class OverviewGraphs extends StatefulWidget {
  const OverviewGraphs({
    super.key,
  });

  @override
  State<OverviewGraphs> createState() => _OverviewGraphsState();
}

class _OverviewGraphsState extends State<OverviewGraphs> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<GraphViewModel>(builder: (graphViewModel) {
      graphViewModel.getGoalFromName('Bænkpres', 1);
      graphViewModel.getTrainingData('Bænkpres', 1);
      graphViewModel.getGoalFromName('Squat', 2);
      graphViewModel.getTrainingData('Squat', 2);
      graphViewModel.getGoalFromName('Triceps Extension', 3);
      graphViewModel.getTrainingData('Triceps Extension', 3);

      return Wrap(
        spacing: 10,
        runSpacing: 10,
        children: [
          graphViewModel.goalOne == null
              ? Container()
              : GraphOverview(
                  title: "Bænkpres",
                  goalWeight: int.parse(graphViewModel.goalOne!.goalWeight),
                  graphData: graphViewModel.trainingsOne,
                ),
          graphViewModel.goalTwo == null
              ? Container()
              : GraphOverview(
                  title: "Dødløft",
                  goalWeight: int.parse(graphViewModel.goalTwo!.goalWeight),
                  graphData: graphViewModel.trainingsTwo,
                ),
          graphViewModel.goalThree == null
              ? Container()
              : GraphOverview(
                  title: "Squat",
                  goalWeight: int.parse(graphViewModel.goalThree!.goalWeight),
                  graphData: graphViewModel.trainingsThree,
                ),
        ],
      );
    });
  }
}
