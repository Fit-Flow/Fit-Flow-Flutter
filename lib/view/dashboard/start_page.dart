import 'package:fit_flow_flutter/utils/app_colors.dart';
import 'package:fit_flow_flutter/utils/components/graph_activity.dart';
import 'package:flutter/material.dart';
import '../../utils/components/graph_overview.dart';
import '../../utils/components/header_widget.dart';

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
          SizedBox(height: 15,),
          Container(
            height: 150, width: 320,
            padding: EdgeInsets.all(20), // Set padding around the container
            decoration: BoxDecoration(
              color: AppColors.darkGreyColor, // Set background color
              borderRadius: BorderRadius.circular(8.0), // Set border radius
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Træning 24-06/23",
                  style: TextStyle(color: AppColors.grayTextColor, fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10,),
                Wrap(
                  spacing: 10,
                  runSpacing: 10,
                  children: List.generate(5, (index) => 
                    Text(
                  "Øvelser her",
                  style: TextStyle(color: AppColors.grayTextColor, fontSize: 16,),
                ),
                  )
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
