/// Represents a goal in the training program.
///
/// The [workout] is the name of the workout associated with the goal.
/// The [prWeight] is the personal record weight for the workout.
/// The [goalWeight] is the target weight for the workout.
///
/// Authors: Jackie, Christoffer & Jakob
class Goal {
  final String workout;
  String prWeight;
  String goalWeight;

  Goal(
      {required this.workout,
      required this.prWeight,
      required this.goalWeight});
}
