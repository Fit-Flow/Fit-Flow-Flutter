import 'package:flutter/material.dart';
import '../app_colors.dart';

/// Represents a header widget with a title.
///
///authors: Jackie, Christoffer & Jakob
class HeaderWidget extends StatelessWidget {
  final String title;

  const HeaderWidget({
    Key? key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        title,
        style: TextStyle(
          color: AppColors.textColor,
          fontSize: 24,
          fontWeight: FontWeight.w900,
          fontFamily: 'Fusion',
        ),
      ),
    );
  }
}
