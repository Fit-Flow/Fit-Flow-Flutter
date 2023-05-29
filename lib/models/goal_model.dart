/// Represents a goal in the training program.
///
/// The [workout] is the name of the workout associated with the goal.
/// The [prWeight] is the personal record weight for the workout.
/// The [goalDate] is the date set for when the goal is done.
/// The [goalWeight] is the target weight for the workout.
///
/// Authors: Jackie, Christoffer & Jakob
class Goal {
  final String workout;
  String goalDate;
  String prWeight;
  String goalWeight;

  Goal(
      {required this.workout,
      required this.goalDate,
      required this.prWeight,
      required this.goalWeight});
}
