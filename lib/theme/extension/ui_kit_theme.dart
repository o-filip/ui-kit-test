import 'package:flutter/material.dart';

import 'label_theme.dart';

class UiKitThemeData extends ThemeExtension<UiKitThemeData> {
  const UiKitThemeData({
    this.labelTheme,
  });

  final LabelThemeData? labelTheme;

  @override
  ThemeExtension<UiKitThemeData> copyWith({
    LabelThemeData? labelTheme,
  }) {
    return UiKitThemeData(
      labelTheme: labelTheme ?? this.labelTheme,
    );
  }

  @override
  ThemeExtension<UiKitThemeData> lerp(
    covariant ThemeExtension<UiKitThemeData>? other,
    double t,
  ) {
    if (other is! UiKitThemeData) {
      return this;
    } else {
      return UiKitThemeData(
        labelTheme: labelTheme?.lerp(other.labelTheme, t),
      );
    }
  }
}
