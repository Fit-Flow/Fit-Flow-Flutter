import 'package:flutter/material.dart';

import '../app_colors.dart';

/// A widget that displays a full-screen loading indicator.
///
/// This widget is used to show a loading indicator that covers the entire screen.
/// It is commonly used to indicate that the application is in a loading state.
///
/// authors: Jackie & Christoffer
class FullScreenLoadWidget extends StatelessWidget {
  const FullScreenLoadWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // A transparent container that covers the entire screen.
        Container(
          width: double.maxFinite,
          height: double.maxFinite,
          color: Colors.transparent,
        ),
        // A centered CircularProgressIndicator.
        Center(
          child: CircularProgressIndicator(
            // The color of the CircularProgressIndicator.
            color: AppColors.yellowColor,
            // The width of the CircularProgressIndicator's stroke.
            strokeWidth: 10,
          ),
        ),
      ],
    );
  }
}
