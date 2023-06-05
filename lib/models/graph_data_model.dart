/// Represents a data point for a graph in a training program.
///
/// The [month] represents the month associated with the data point.
/// The [maxWeight] represents the maximum weight achieved in the training program.
/// The [minWeight] represents the minimum weight targeted in the training program.
/// The [trainingCount] represents the number of training sessions completed.
///
/// Authors: Jackie
class GraphData {
  int month;
  double maxWeight;
  int minWeight;
  int trainingCount;

  GraphData(
      {required this.month,
      required this.maxWeight,
      required this.minWeight,
      required this.trainingCount});
}
