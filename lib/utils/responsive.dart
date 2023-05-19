import 'package:flutter/material.dart';

/// A widget for handling responsive design based on screen size.
///
///authors: Jackie, Christoffer & Jakob
class Responsive extends StatelessWidget {
  final Widget mobile;
  final Widget? tablet;
  final Widget desktop;

  /// Constructs a `Responsive` widget.
  ///
  /// The [mobile] widget is required and will be displayed on small screens.
  /// The [tablet] widget is optional and will be displayed on medium-sized screens.
  /// The [desktop] widget is required and will be displayed on large screens.
  const Responsive({
    Key? key,
    required this.mobile,
    this.tablet,
    required this.desktop,
  }) : super(key: key);

  /// Returns `true` if the screen size is considered as a mobile device.
  static bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width < 850;

  /// Returns `true` if the screen size is considered as a tablet device.
  static bool isTablet(BuildContext context) =>
      MediaQuery.of(context).size.width < 1100 &&
      MediaQuery.of(context).size.width >= 850;

  /// Returns `true` if the screen size is considered as a desktop device.
  static bool isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width >= 1100;

  @override
  Widget build(BuildContext context) {
    final Size _size = MediaQuery.of(context).size;
    if (_size.width >= 1100) {
      return desktop;
    } else if (_size.width >= 850 && tablet != null) {
      return tablet!;
    } else {
      return mobile;
    }
  }
}
