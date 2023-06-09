import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fit_flow_flutter/models/graph_data_model.dart';
import 'package:get/get.dart';

import '../models/goal_model.dart';

/// Represents a view model for graph data.
///
/// This view model is responsible for managing the graph data used in the application.
/// It retrieves goals and training data from Firestore based on the user's ID and updates
/// the respective lists of [Goal] and [GraphData] objects. The [createGraphList] method
/// initializes the graph data lists with default values for each month. The [getGoalFromName]
/// method retrieves a specific goal based on its name and goal number. The [getTrainingData]
/// method retrieves training data for a specific workout and updates the corresponding
/// graph data list. The [setList] method sets the highest and lowest values in the graph
/// data list for a specific month and graph number. The [_findHighestValue] and [_findLowestValue]
/// methods are helper methods to find the highest and lowest values from a list of dynamic values.
///
/// Author: Jackie
class GraphViewModel extends GetxController implements GetxService {
  final _dbRefGoals = FirebaseFirestore.instance
      .collection('users')
      .doc(FirebaseAuth.instance.currentUser!.uid)
      .collection('goals');
  final _dbRefTrainings = FirebaseFirestore.instance
      .collection('users')
      .doc(FirebaseAuth.instance.currentUser!.uid)
      .collection('trainings');

  Goal? _goalOne;
  Goal? get goalOne => _goalOne;
  List<GraphData> _trainingsOne = [];
  List<GraphData> get trainingsOne => _trainingsOne;
  Goal? _goalTwo;
  Goal? get goalTwo => _goalTwo;
  List<GraphData> _trainingsTwo = [];
  List<GraphData> get trainingsTwo => _trainingsTwo;
  Goal? _goalThree;
  Goal? get goalThree => _goalThree;
  List<GraphData> _trainingsThree = [];
  List<GraphData> get trainingsThree => _trainingsThree;

  RxBool isDataOneLoaded = false.obs;
  RxBool isDataTwoLoaded = false.obs;
  RxBool isDataThreeLoaded = false.obs;

  @override
  void onInit() async {
    createGraphList();
    super.onInit();
  }

  /// Creates the initial graph data list.
  ///
  /// This method initializes the graph data lists [_trainingsOne], [_trainingsTwo],
  /// and [_trainingsThree] with default values for each month. It creates a [GraphData]
  /// object for each month from 1 to 12 and adds them to the respective lists.
  ///
  /// Author: Jackie
  void createGraphList() {
    for (int i = 1; i <= 12; i++) {
      GraphData graphData = GraphData(
        month: i,
        maxWeight: 0,
        minWeight: 0,
        trainingCount: 0,
      );

      _trainingsOne.add(graphData);

      GraphData graphDataCopy = GraphData(
        month: graphData.month,
        maxWeight: graphData.maxWeight,
        minWeight: graphData.minWeight,
        trainingCount: graphData.trainingCount,
      );
      _trainingsTwo.add(graphDataCopy);

      GraphData graphDataCopy2 = GraphData(
        month: graphData.month,
        maxWeight: graphData.maxWeight,
        minWeight: graphData.minWeight,
        trainingCount: graphData.trainingCount,
      );
      _trainingsThree.add(graphDataCopy2);
    }
  }

  /// Removes the data from the graph view model.
  ///
  /// This method clears the [_trainingsOne], [_trainingsTwo], and [_trainingsThree] lists,
  /// sets the [_goalOne], [_goalTwo], and [_goalThree] variables to `null`, and updates the
  /// `isDataOneLoaded`, `isDataTwoLoaded`, and `isDataThreeLoaded` flags to `false`. Finally,
  /// it triggers an update to notify the listeners of the changes.
  ///
  /// Author: Jackie
  void removeData() {
    _trainingsOne = [];
    _trainingsTwo = [];
    _trainingsThree = [];
    _goalOne = null;
    _goalTwo = null;
    _goalThree = null;
    isDataOneLoaded.value = false;
    isDataTwoLoaded.value = false;
    isDataThreeLoaded.value = false;
    update();
  }

  /// Retrieves a specific goal based on its name and goal number.
  ///
  /// This method retrieves goals from Firestore using the [_dbRefGoals] collection
  /// reference and the user's ID. It compares the workout name with the provided [name]
  /// and if a match is found, creates a [Goal] object and assigns it to [_goalOne],
  /// [_goalTwo], or [_goalThree] based on the [goalNumber].
  ///
  /// Author: Jackie
  void getGoalFromName(String name, int goalNumber) async {
    final DocumentReference documentRef =
        _dbRefGoals.doc(FirebaseAuth.instance.currentUser?.uid);

    DocumentSnapshot docSnapshot = await documentRef.get();

    if (docSnapshot.exists && docSnapshot.data() != null) {
      dynamic goalsData = docSnapshot.data();

      goalsData['goals'].forEach((data) async {
        String workout = data['workout'];
        String goalDate = data['goalDate'];
        String prWeight = data['prWeight'];
        String goalWeight = data['goalWeight'];

        if (workout == name) {
          Goal goal = Goal(
              workout: workout,
              prWeight: prWeight,
              goalWeight: goalWeight,
              goalDate: goalDate);
          switch (goalNumber) {
            case 1:
              _goalOne = goal;
              break;
            case 2:
              _goalTwo = goal;
              break;
            case 3:
              _goalThree = goal;
              break;
          }
        }
      });
    }
  }

  /// Retrieves training data for a specific workout and updates the corresponding graph data list.
  ///
  /// This method retrieves training data from Firestore using the [_dbRefTrainings] collection
  /// reference. It loops through each document in the retrieved snapshot, retrieves the set data
  /// for the provided [workoutName], and updates the corresponding graph data list based on the
  /// month of the training data. The highest and lowest values for each month are calculated using
  /// the [_findHighestValue] and [_findLowestValue] methods.
  ///
  /// Author: Jackie
  Future<void> getTrainingData(String workoutName, int graphNumber) async {
    QuerySnapshot snapshot = await _dbRefTrainings.get();

    snapshot.docs.forEach((DocumentSnapshot doc) async {
      var set = await doc.reference.collection('sets').doc(workoutName).get();

      if (set.exists && set.data() != null) {
        var data = set.data();
        var name = data?['name'];
        var workouts = data?['workouts'];

        Map<String, dynamic>? training = doc.data()
            as Map<String, dynamic>?; // Cast til Map<String, dynamic>

        if (training != null) {
          var timestamp = training['timestamp'];
          DateTime dateTime = timestamp.toDate();
          int month = dateTime.month;

          if (month >= 1 && month <= 12) {
            int highestValue = _findHighestValue(workouts);
            int lowestValue = _findLowestValue(workouts);
            setList(graphNumber, month, highestValue, lowestValue);
          }
        }
      }
    });
    print('Done');
  }

  /// Updates the graph data list with the highest and lowest values for a specific month and graph number.
  ///
  /// This method updates the graph data lists [_trainingsOne], [_trainingsTwo], or [_trainingsThree]
  /// based on the provided [graphNumber]. It compares the provided [highestValue] and [lowestValue]
  /// with the existing values in the graph data list for the corresponding month and updates them
  /// if necessary.
  ///
  /// Author: Jackie
  void setList(int graphNumber, int month, int highestValue, int lowestValue) {
    switch (graphNumber) {
      case 1:
        if (highestValue > _trainingsOne[month - 1].maxWeight) {
          _trainingsOne[month - 1].maxWeight = highestValue.toDouble();
        }
        if (lowestValue < _trainingsOne[month - 1].minWeight) {
          _trainingsOne[month - 1].minWeight = lowestValue;
        }
        isDataOneLoaded.value = true;
        break;
      case 2:
        if (highestValue > _trainingsTwo[month - 1].maxWeight) {
          _trainingsTwo[month - 1].maxWeight = highestValue.toDouble();
        }
        if (lowestValue < _trainingsTwo[month - 1].minWeight) {
          _trainingsTwo[month - 1].minWeight = lowestValue;
        }
        isDataTwoLoaded.value = true;
        break;
      case 3:
        if (highestValue > _trainingsThree[month - 1].maxWeight) {
          _trainingsThree[month - 1].maxWeight = highestValue.toDouble();
        }
        if (lowestValue < _trainingsThree[month - 1].minWeight) {
          _trainingsThree[month - 1].minWeight = lowestValue;
        }
        isDataThreeLoaded.value = true;
        break;
    }
  }

  /// Finds the highest value from a list of dynamic values.
  ///
  /// This method loops through the provided [values] and finds the highest integer value
  /// from the values. It ignores values that cannot be parsed as integers and returns 0 if
  /// no valid value is found.
  ///
  /// Author: Jackie
  int _findHighestValue(List<dynamic> values) {
    int highestValue = 0;

    for (dynamic value in values) {
      if (value is String) {
        List<String> parts = value.split(";");
        if (parts.length == 2) {
          int currentValue = int.tryParse(parts[0]) ?? 0;
          if (currentValue > highestValue) {
            highestValue = currentValue;
          }
        }
      }
    }

    return highestValue;
  }

  /// Finds the lowest value from a list of dynamic values.
  ///
  /// This method loops through the provided [values] and finds the lowest integer value
  /// from the values. It ignores values that cannot be parsed as integers and returns 0 if
  /// no valid value is found.
  ///
  /// Author: Jackie
  int _findLowestValue(List<dynamic> values) {
    int lowestValue = int.parse(values[0].split(";")[0]);

    for (dynamic value in values) {
      if (value is String) {
        List<String> parts = value.split(";");
        if (parts.length == 2) {
          int currentValue = int.parse(parts[0]);
          if (currentValue < lowestValue) {
            lowestValue = currentValue;
          }
        }
      }
    }

    return lowestValue;
  }
}
