import 'package:flutter/material.dart';

class RoundedIconButton extends StatelessWidget {
  final VoidCallback onTap;
  final IconData icon;
  final Color color;
  final String tooltip;
  const RoundedIconButton({
    super.key,
    required this.onTap,
    required this.icon,
    required this.color,
    this.tooltip = '',
  });

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: tooltip,
      child: RawMaterialButton(
        onPressed: onTap,
        elevation: 2.0,
        fillColor: color,
        constraints:
            BoxConstraints(minWidth: 60.0, minHeight: 60.0, maxHeight: 60.0),
        child: Icon(
          icon,
          size: 36.0,
        ),
        shape: CircleBorder(),
      ),
    );
  }
}
