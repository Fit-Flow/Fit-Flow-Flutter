import 'package:flutter/material.dart';

/// The [GoalPage] class represents the goal page in the FitFlow app.
///
/// This page displays the user's goals and objectives.
///
///authors: Jackie, Christoffer & Jakob
class GoalPage extends StatelessWidget {
  const GoalPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        'Målsetnings Siden',
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}
