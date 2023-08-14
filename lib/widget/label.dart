import 'package:flutter/material.dart';

import '../theme/extension/label_theme.dart';
import '../theme/extension/ui_kit_theme.dart';

class Label extends StatelessWidget {
  const Label({
    super.key,
    required this.text,
    this.icon,
    this.textStyle,
    this.backgroundColor,
    this.padding,
    this.border,
  });

  final Widget text;
  final Widget? icon;
  final TextStyle? textStyle;
  final Color? backgroundColor;
  final EdgeInsetsGeometry? padding;
  final BoxBorder? border;

  @override
  Widget build(BuildContext context) {
    final labelTheme = LabelTheme.of(context) ??
        Theme.of(context).extension<UiKitThemeData>()?.labelTheme;
    final defaultTheme = LabelThemeData.fromDefaults(context);

    return Container(
      padding: padding,
      decoration: BoxDecoration(
        color: _getBackgroundColor(labelTheme, defaultTheme),
        border: border,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (icon != null) ...[
            icon!,
            const SizedBox(width: 4),
          ],
          DefaultTextStyle.merge(
            style: _getTextStyle(labelTheme, defaultTheme),
            child: text,
          ),
        ],
      ),
    );
  }

  Color? _getBackgroundColor(
    LabelThemeData? labelTheme,
    LabelThemeData defaultTheme,
  ) {
    return backgroundColor ??
        labelTheme?.backgroundColor ??
        defaultTheme.backgroundColor;
  }

  TextStyle? _getTextStyle(
    LabelThemeData? labelTheme,
    LabelThemeData defaultTheme,
  ) {
    return textStyle ?? labelTheme?.textStyle ?? defaultTheme.textStyle;
  }
}
