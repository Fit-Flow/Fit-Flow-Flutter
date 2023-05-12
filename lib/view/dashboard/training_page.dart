import 'package:flutter/material.dart';

import '../../utils/components/header_widget.dart';
import '../../utils/components/training_widget.dart';

/**
 * @authors Jackie, Christoffer & Jakob
 */
class TrainingPage extends StatelessWidget {
  const TrainingPage({Key? key}) : super(key: key);

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
              title: "Træning",
            ),
            SizedBox(
              height: 15,
            ),
            TrainingWidget()
          ],
        ),
      ),
    );
  }
}