import 'package:fit_flow_flutter/utils/components/graph_activity.dart';
import 'package:flutter/material.dart';

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
