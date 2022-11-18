import 'package:flutter/material.dart';

import 'app_theme_data.dart';

class InheritedAppTheme extends InheritedWidget {
  final AppThemeData data;
  const InheritedAppTheme({
    required this.data,
    required Widget child,
    Key? key,
  }) : super(key: key, child: child);
  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) =>
      oldWidget != this;
}
