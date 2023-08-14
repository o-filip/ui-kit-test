import 'package:flutter/material.dart';

class LabelTheme extends InheritedTheme {
  const LabelTheme({
    super.key,
    required this.data,
    required super.child,
  });

  final LabelThemeData data;

  static LabelThemeData? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<LabelTheme>()?.data;
  }

  @override
  bool updateShouldNotify(LabelTheme oldWidget) => data != oldWidget.data;

  @override
  Widget wrap(BuildContext context, Widget child) {
    return LabelTheme(data: data, child: child);
  }
}

class LabelThemeData extends ThemeExtension<LabelThemeData> {
  const LabelThemeData({
    this.backgroundColor,
    this.textStyle,
  });

  factory LabelThemeData.fromDefaults(
    BuildContext context,
  ) {
    final theme = Theme.of(context);

    return LabelThemeData(
      backgroundColor: theme.colorScheme.primary,
      textStyle: theme.textTheme.labelLarge?.copyWith(
        color: theme.colorScheme.onPrimary,
      ),
    );
  }

  final Color? backgroundColor;
  final TextStyle? textStyle;

  @override
  LabelThemeData copyWith({
    Color? backgroundColor,
    TextStyle? textStyle,
  }) {
    return LabelThemeData(
      backgroundColor: backgroundColor ?? this.backgroundColor,
      textStyle: textStyle ?? this.textStyle,
    );
  }

  @override
  LabelThemeData lerp(
    covariant ThemeExtension<LabelThemeData>? other,
    double t,
  ) {
    if (other is! LabelThemeData) {
      return this;
    } else {
      return copyWith(
        backgroundColor: Color.lerp(
          backgroundColor,
          other.backgroundColor,
          t,
        ),
        textStyle: TextStyle.lerp(
          textStyle,
          other.textStyle,
          t,
        ),
      );
    }
  }
}
