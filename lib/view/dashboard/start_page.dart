import 'package:fit_flow_flutter/utils/app_colors.dart';
import 'package:fit_flow_flutter/utils/components/graph_activity.dart';
import 'package:flutter/material.dart';
import '../../utils/components/graph_overview.dart';
import '../../utils/components/header_widget.dart';
import '../../utils/components/latest_workout_card.dart';

class StartPage extends StatelessWidget {
  StartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
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
          LatesWorkoutsWidget(),
        ],
      ),
    );
  }
}

class LatesWorkoutsWidget extends StatefulWidget {
  const LatesWorkoutsWidget({
    super.key,
  });

  @override
  State<LatesWorkoutsWidget> createState() => _LatesWorkoutsWidgetState();
}

class _LatesWorkoutsWidgetState extends State<LatesWorkoutsWidget> {
  ScrollController _scrollController = ScrollController();
  double _offset = 0;
  bool _showNextButton = true;
  bool _showBackButton = false;

  @override
  void initState() {
    _scrollController.addListener(_scrollListener);
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.removeListener(_scrollListener);
    super.dispose();
  }

  void _scrollListener() {
    setState(() {
      _showNextButton = _scrollController.offset <= _scrollController.position.maxScrollExtent - 1;
      _showBackButton = _scrollController.offset >= _scrollController.position.minScrollExtent + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SingleChildScrollView(
          controller: _scrollController,
          scrollDirection: Axis.horizontal,
          child: Wrap(
            spacing: 20,
            children: [
              LatestWorkoutCard(
                title: "Træning 24-06/23",
                workouts: [
                  "Bænkpres",
                  "Incline bænkpres",
                  "Dips",
                  "Flyers",
                  "Triceps pulldown",
                  "Dips",
                  "Flyers",
                  "Triceps pulldown"
                ],
              ),
              LatestWorkoutCard(
                title: "Træning 24-06/23",
                workouts: [
                  "Bænkpres",
                  "Incline bænkpres",
                  "Dips",
                  "Flyers",
                  "Triceps pulldown",
                  "Dips",
                  "Flyers",
                ],
              ),
              LatestWorkoutCard(
                title: "Træning 24-06/23",
                workouts: [
                  "Bænkpres",
                  "Incline bænkpres",
                  "Dips",
                  "Flyers",
                  "Triceps pulldown",
                  "Dips",
                  "Flyers",
                  "Triceps pulldown",
                  "Dips",
                  "Flyers",
                ],
              ),
              LatestWorkoutCard(
                title: "Træning 24-06/23",
                workouts: [
                  "Bænkpres",
                  "Incline bænkpres",
                  "Dips",
                  "Flyers",
                  "Triceps pulldown"
                ],
              ),
              LatestWorkoutCard(
                title: "Træning 24-06/23",
                workouts: [
                  "Bænkpres",
                  "Incline bænkpres",
                  "Dips",
                  "Flyers",
                  "Triceps pulldown",
                  "Dips",
                  "Flyers",
                  "Triceps pulldown"
                ],
              ),
              LatestWorkoutCard(
                title: "Træning 24-06/23",
                workouts: [
                  "Bænkpres",
                  "Incline bænkpres",
                  "Dips",
                  "Flyers",
                  "Triceps pulldown",
                  "Dips",
                ],
              ),
              LatestWorkoutCard(
                title: "Træning 24-06/23",
                workouts: [
                  "Bænkpres",
                  "Incline bænkpres",
                  "Dips",
                  "Flyers",
                  "Triceps pulldown"
                ],
              ),
              LatestWorkoutCard(
                title: "Træning 24-06/23",
                workouts: [
                  "Bænkpres",
                  "Incline bænkpres",
                  "Dips",
                  "Flyers",
                  "Triceps pulldown"
                ],
              ),
              LatestWorkoutCard(
                title: "Træning 24-06/23",
                workouts: [
                  "Bænkpres",
                  "Incline bænkpres",
                  "Dips",
                  "Flyers",
                  "Triceps pulldown",
                  "Dips",
                  "Flyers",
                  "Triceps pulldown"
                ],
              ),
              LatestWorkoutCard(
                title: "Træning 24-06/23",
                workouts: [
                  "Bænkpres",
                  "Incline bænkpres",
                  "Dips",
                  "Flyers",
                  "Triceps pulldown",
                  "Dips",
                  "Flyers",
                  "Triceps pulldown",
                  "Dips",
                  "Flyers",
                  "Triceps pulldown"
                ],
              ),
            ],
          ),
        ),
        Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _showBackButton ? ElevatedButton(
                  onPressed: () {
                    _offset = _scrollController.offset - 230;
                    _scrollController.animateTo(_offset,
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.easeInOut);
                  },
                  child: const Text("-")) : Container(),
              _showNextButton ? ElevatedButton(
                onPressed: () {
                  _offset = _scrollController.offset + 230;
                  _scrollController.animateTo(_offset,
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.easeInOut);
                },
                child: const Text("+"),
              ) : Container(),
            ],
          ),
        ),
      ],
    );
  }
}
