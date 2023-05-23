import 'package:flutter/material.dart';

import '../app_colors.dart';

class FullScreenLoadWidget extends StatelessWidget {
  const FullScreenLoadWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.maxFinite,
          height: double.maxFinite,
          color: Colors.transparent,
        ),
        Center(
          child: CircularProgressIndicator(
            color: AppColors.yellowColor,
            strokeWidth: 10,
          ),
        ),
      ],
    );
  }
}
