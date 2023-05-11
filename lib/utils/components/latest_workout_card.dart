import 'package:flutter/material.dart';
import '../app_colors.dart';

/**
 * @authors Jackie, Christoffer & Jackie
 */
class LatestWorkoutCard extends StatelessWidget {
  final String title;
  final List<String> workouts;
  const LatestWorkoutCard({
    super.key,
    required this.title,
    required this.workouts,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 210,
      padding: EdgeInsets.all(20), // Set padding around the container
      decoration: BoxDecoration(
        color: AppColors.darkGreyColor, // Set background color
        borderRadius: BorderRadius.circular(8.0), // Set border radius
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
                color: AppColors.grayTextColor,
                fontSize: 20,
                fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 10,
          ),
          Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: List.generate(
                workouts.length,
                (index) => Padding(
                  padding: const EdgeInsets.only(bottom: 5),
                  child: Text(
                    workouts[index],
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: AppColors.grayTextColor,
                      fontSize: 16,
                    ),
                  ),
                ),
              )),
        ],
      ),
    );
  }
}
