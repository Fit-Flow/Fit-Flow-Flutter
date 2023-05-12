import 'package:get/get.dart';
import 'package:flutter/material.dart';

import '../utils/components/training_widget.dart';

/**
 * @authors Jackie, Christoffer & Jakob
 */
class TrainingViewModel extends GetxController implements GetxService {

  List<List<Widget>> _sets = [[]]; //Liste af workouts med en Liste af sets
  List<List<Widget>> get sets => _sets;

  void addSetToTraining(int index) {
    _sets[index].add(TrainingSetWidget());
    update();
  }
}