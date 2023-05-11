import 'package:flutter/material.dart';
import '../app_colors.dart';

/**
 * @authors Jackie, Christoffer & Jackie
 */
class HeaderWidget extends StatelessWidget {
  final String title;
  const HeaderWidget({
    super.key, required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        title,
        style: TextStyle(
            color: AppColors.textColor,
            fontSize: 24,
            fontWeight: FontWeight.w900),
      ),
    );
  }
}
