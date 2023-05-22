import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../view_model/authentication_viewmodel.dart';
import '../app_colors.dart';
import 'latest_workout_card.dart';

/// Represents the widget displaying the profile settings header.
///
///authors: Jackie, Christoffer & Jakob
class ProfileSettingsHeader extends StatelessWidget {
  const ProfileSettingsHeader({Key? key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthenticationViewModel>(builder: (viewmodel) {
      return Row(
        children: [
          Container(
            width: 200,
            height: 200,
            child: ClipRRect(
              child: Image.asset('assets/img/test-profil.png'),
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          SizedBox(
            width: 40,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                FirebaseAuth.instance.currentUser!.displayName!,
                style: TextStyle(
                  color: AppColors.textColor,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                FirebaseAuth.instance.currentUser!.email!,
                style: TextStyle(
                  color: AppColors.lightGreyColor,
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ],
      );
    });
  }
}

/// Represents the widget displaying the latest workouts.
class LatestWorkoutsWidget extends StatefulWidget {
  const LatestWorkoutsWidget({Key? key});

  @override
  State<LatestWorkoutsWidget> createState() => _LatestWorkoutsWidgetState();
}

class _LatestWorkoutsWidgetState extends State<LatestWorkoutsWidget> {
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
      _showNextButton = _scrollController.offset <=
          _scrollController.position.maxScrollExtent - 1;
      _showBackButton = _scrollController.offset >=
          _scrollController.position.minScrollExtent + 1;
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
                  "Triceps pulldown",
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
                  "Triceps pulldown",
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
                  "Triceps pulldown",
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
                  "Triceps pulldown",
                ],
              ),
            ],
          ),
        ),
        Positioned.fill(
          child: Align(
            alignment: Alignment.center,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _showBackButton
                    ? DirectionButton(
                        isBack: true,
                        onTap: () {
                          _offset = _scrollController.offset - 230;
                          _scrollController.animateTo(
                            _offset,
                            duration: const Duration(milliseconds: 500),
                            curve: Curves.easeInOut,
                          );
                        },
                      )
                    : Container(),
                _showNextButton
                    ? DirectionButton(
                        isBack: false,
                        onTap: () {
                          _offset = _scrollController.offset + 230;
                          _scrollController.animateTo(
                            _offset,
                            duration: const Duration(milliseconds: 500),
                            curve: Curves.easeInOut,
                          );
                        },
                      )
                    : Container(),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

/// Represents a button with a direction arrow.
class DirectionButton extends StatelessWidget {
  final bool isBack;
  final VoidCallback onTap;

  const DirectionButton({
    Key? key,
    required this.isBack,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 45,
        height: double.maxFinite,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: isBack
                ? [
                    AppColors.backgroundColor,
                    AppColors.darkGreyColor.withOpacity(0.3),
                  ]
                : [
                    AppColors.darkGreyColor.withOpacity(0.3),
                    AppColors.backgroundColor,
                  ],
          ),
        ),
        child: Icon(
          isBack ? Icons.arrow_back_ios : Icons.arrow_forward_ios,
          color: AppColors.textColor,
        ),
      ),
    );
  }
}