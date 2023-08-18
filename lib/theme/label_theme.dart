import 'package:flutter/material.dart';

import 'svg_icon_theme.dart';

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

class LabelThemeData {
  const LabelThemeData({
    this.textStyle,
    this.iconTheme,
    this.padding,
    this.backgroundColor,
    this.borderRadius,
  });

  factory LabelThemeData.fromDefaults(
    BuildContext context, {
    TextStyle? textStyle,
    SvgIconThemeData? iconTheme,
    Color? backgroundColor,
    BorderRadius? borderRadius,
    EdgeInsetsGeometry? padding,
  }) {
    final theme = Theme.of(context);

    return LabelThemeData(
      textStyle: textStyle ??
          theme.textTheme.labelLarge?.copyWith(
            color: theme.colorScheme.onPrimary,
          ),
      iconTheme: iconTheme ??
          SvgIconThemeData.fromDefaults(
            height: 16,
            width: 16,
            color: theme.colorScheme.onPrimary,
          ),
      backgroundColor: backgroundColor ?? theme.colorScheme.primary,
      borderRadius: borderRadius ?? BorderRadius.circular(8),
      padding: padding ??
          const EdgeInsets.symmetric(
            horizontal: 8,
            vertical: 4,
          ),
    );
  }

  final TextStyle? textStyle;
  final SvgIconThemeData? iconTheme;
  final Color? backgroundColor;
  final BorderRadius? borderRadius;
  final EdgeInsetsGeometry? padding;

  LabelThemeData copyWith({
    TextStyle? textStyle,
    SvgIconThemeData? iconTheme,
    Color? backgroundColor,
    Color? foregroundColor,
    BorderRadius? borderRadius,
    EdgeInsetsGeometry? padding,
  }) {
    return LabelThemeData(
      textStyle: textStyle ?? this.textStyle,
      iconTheme: iconTheme ?? this.iconTheme,
      backgroundColor: backgroundColor ?? this.backgroundColor,
      borderRadius: borderRadius ?? this.borderRadius,
      padding: padding ?? this.padding,
    );
  }

  LabelThemeData lerp(
    covariant LabelThemeData? other,
    double t,
  ) {
    if (other is! LabelThemeData) {
      return this;
    } else {
      return copyWith(
        textStyle: TextStyle.lerp(
          textStyle,
          other.textStyle,
          t,
        ),
        iconTheme: iconTheme?.lerp(
          other.iconTheme,
          t,
        ),
        backgroundColor: Color.lerp(
          backgroundColor,
          other.backgroundColor,
          t,
        ),
        borderRadius: BorderRadius.lerp(
          borderRadius,
          other.borderRadius,
          t,
        ),
        padding: EdgeInsetsGeometry.lerp(
          padding,
          other.padding,
          t,
        ),
      );
    }
  }
}
