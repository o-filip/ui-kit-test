import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../theme/svg_icon_theme.dart';

class SvgIcon extends StatelessWidget {
  const SvgIcon({
    super.key,
    required this.loader,
    this.width,
    this.height,
    this.color,
    this.blendMode,
    this.fit,
    this.alignment,
  });

  SvgIcon.asset(
    String assetName, {
    AssetBundle? bundle,
    String? package,
    SvgTheme theme = const SvgTheme(),
    super.key,
    this.width,
    this.height,
    this.color,
    this.blendMode,
    this.fit,
    this.alignment,
  }) : loader = SvgAssetLoader(
          assetName,
          packageName: package,
          assetBundle: bundle,
          theme: theme,
        );

  final BytesLoader loader;
  final double? width;
  final double? height;
  final Color? color;
  final BlendMode? blendMode;
  final BoxFit? fit;
  final AlignmentGeometry? alignment;

  @override
  Widget build(BuildContext context) {
    final iconTheme = SvgIconTheme.of(context);
    final defaultTheme = SvgIconThemeData.fromDefaults();

    final color = _getColor(iconTheme, defaultTheme);
    final blendMode = _getBlendMode(iconTheme, defaultTheme);

    return SvgPicture(
      loader,
      colorFilter: color != null && blendMode != null
          ? ColorFilter.mode(color, blendMode)
          : null,
      width: _getWidth(iconTheme, defaultTheme),
      height: _getHeight(iconTheme, defaultTheme),
      alignment: _getAlignment(iconTheme, defaultTheme) ?? Alignment.center,
      fit: _getFit(iconTheme, defaultTheme) ?? BoxFit.contain,
    );
  }

  Color? _getColor(
    SvgIconThemeData? iconTheme,
    SvgIconThemeData defaultTheme,
  ) {
    return color ?? iconTheme?.color ?? defaultTheme.color;
  }

  BlendMode? _getBlendMode(
    SvgIconThemeData? iconTheme,
    SvgIconThemeData defaultTheme,
  ) {
    return blendMode ?? iconTheme?.blendMode ?? defaultTheme.blendMode;
  }

  double? _getWidth(
    SvgIconThemeData? iconTheme,
    SvgIconThemeData defaultTheme,
  ) {
    return width ?? iconTheme?.width ?? defaultTheme.width;
  }

  double? _getHeight(
    SvgIconThemeData? iconTheme,
    SvgIconThemeData defaultTheme,
  ) {
    return height ?? iconTheme?.height ?? defaultTheme.height;
  }

  AlignmentGeometry? _getAlignment(
    SvgIconThemeData? iconTheme,
    SvgIconThemeData defaultTheme,
  ) {
    return alignment ?? iconTheme?.alignment ?? defaultTheme.alignment;
  }

  BoxFit? _getFit(
    SvgIconThemeData? iconTheme,
    SvgIconThemeData defaultTheme,
  ) {
    return fit ?? iconTheme?.fit ?? defaultTheme.fit;
  }
}
