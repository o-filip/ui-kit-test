import 'package:flutter/material.dart';

import '../theme/label_theme.dart';
import '../theme/svg_icon_theme.dart';
import '../theme/ui_kit_theme.dart';

class Label extends StatelessWidget {
  const Label({
    super.key,
    required this.text,
    this.icon,
    this.iconTheme,
    this.textStyle,
    this.backgroundColor,
    this.borderRadius,
    this.padding,
  });

  final Widget text;
  final Widget? icon;
  final SvgIconThemeData? iconTheme;
  final TextStyle? textStyle;
  final Color? backgroundColor;
  final BorderRadius? borderRadius;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    final labelTheme = LabelTheme.of(context) ??
        Theme.of(context).extension<UiKitThemeData>()?.labelTheme;
    final defaultTheme = LabelThemeData.fromDefaults(context);

    return Container(
      padding: _getPadding(labelTheme, defaultTheme),
      decoration: BoxDecoration(
        color: _getBackgroundColor(labelTheme, defaultTheme),
        borderRadius: _getBorderRadius(labelTheme, defaultTheme),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildIconAndSpacing(context, labelTheme, defaultTheme),
          Flexible(
            child: _buildText(context, labelTheme, defaultTheme),
          )
        ],
      ),
    );
  }

  Widget _buildIconAndSpacing(
    BuildContext context,
    LabelThemeData? labelTheme,
    LabelThemeData defaultTheme,
  ) {
    if (icon != null) {
      return Padding(
        padding: const EdgeInsets.only(right: 8),
        child: SvgIconTheme.merge(
          data: _getIconTheme(context, labelTheme, defaultTheme),
          child: icon!,
        ),
      );
    } else {
      return const SizedBox.shrink();
    }
  }

  Widget _buildText(
    BuildContext context,
    LabelThemeData? labelTheme,
    LabelThemeData defaultTheme,
  ) {
    return DefaultTextStyle.merge(
      style: _getTextStyle(labelTheme, defaultTheme),
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      child: text,
    );
  }

  EdgeInsetsGeometry? _getPadding(
    LabelThemeData? labelTheme,
    LabelThemeData defaultTheme,
  ) {
    return padding ?? labelTheme?.padding ?? defaultTheme.padding;
  }

  Color? _getBackgroundColor(
    LabelThemeData? labelTheme,
    LabelThemeData defaultTheme,
  ) {
    return backgroundColor ??
        labelTheme?.backgroundColor ??
        defaultTheme.backgroundColor;
  }

  BorderRadius? _getBorderRadius(
    LabelThemeData? labelTheme,
    LabelThemeData defaultTheme,
  ) {
    return borderRadius ??
        labelTheme?.borderRadius ??
        defaultTheme.borderRadius;
  }

  TextStyle? _getTextStyle(
    LabelThemeData? labelTheme,
    LabelThemeData defaultTheme,
  ) {
    return textStyle ?? labelTheme?.textStyle ?? defaultTheme.textStyle;
  }

  SvgIconThemeData? _getIconTheme(
    BuildContext context,
    LabelThemeData? labelTheme,
    LabelThemeData defaultTheme,
  ) {
    if (iconTheme != null) {
      return iconTheme?.merge(
        labelTheme?.iconTheme ?? defaultTheme.iconTheme,
      );
    } else {
      return labelTheme?.iconTheme ?? defaultTheme.iconTheme;
    }
  }
}
