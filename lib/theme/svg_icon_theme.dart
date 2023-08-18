import 'dart:ui';

import 'package:flutter/material.dart';

class SvgIconTheme extends InheritedTheme {
  const SvgIconTheme({
    super.key,
    required this.data,
    required super.child,
  });

  final SvgIconThemeData data;

  static Widget merge({
    Key? key,
    SvgIconThemeData? data,
    required Widget child,
  }) {
    return Builder(
      builder: (BuildContext context) {
        return SvgIconTheme(
          key: key,
          data: _getInheritedSvgIconThemeData(context).merge(data),
          child: child,
        );
      },
    );
  }

  static SvgIconThemeData of(BuildContext context) {
    return _getInheritedSvgIconThemeData(context).resolve(context);
  }

  static SvgIconThemeData _getInheritedSvgIconThemeData(BuildContext context) {
    final iconTheme =
        context.dependOnInheritedWidgetOfExactType<SvgIconTheme>();
    return iconTheme?.data ?? SvgIconThemeData.fromDefaults();
  }

  @override
  bool updateShouldNotify(SvgIconTheme oldWidget) => data != oldWidget.data;

  @override
  Widget wrap(BuildContext context, Widget child) {
    return SvgIconTheme(data: data, child: child);
  }
}

class SvgIconThemeData {
  const SvgIconThemeData({
    this.width,
    this.height,
    this.color,
    this.blendMode,
    this.fit,
    this.alignment,
  });

  SvgIconThemeData.fromDefaults({
    double? width,
    double? height,
    Color? color,
    BlendMode? blendMode,
    BoxFit? fit,
    AlignmentGeometry? alignment,
  }) : this(
          width: width,
          height: height,
          color: color,
          blendMode: blendMode ?? BlendMode.srcIn,
          fit: fit ?? BoxFit.contain,
          alignment: alignment ?? Alignment.center,
        );

  final double? width;
  final double? height;
  final Color? color;
  final BlendMode? blendMode;
  final BoxFit? fit;
  final AlignmentGeometry? alignment;

  SvgIconThemeData copyWith({
    double? width,
    double? height,
    Color? color,
    BlendMode? blendMode,
    BoxFit? fit,
    AlignmentGeometry? alignment,
  }) {
    return SvgIconThemeData(
      width: width ?? this.width,
      height: height ?? this.height,
      color: color ?? this.color,
      blendMode: blendMode ?? this.blendMode,
      fit: fit ?? this.fit,
      alignment: alignment ?? this.alignment,
    );
  }

  SvgIconThemeData merge(SvgIconThemeData? other) {
    if (other == null) {
      return this;
    } else {
      return SvgIconThemeData(
        width: width ?? other.width,
        height: height ?? other.height,
        color: color ?? other.color,
        blendMode: blendMode ?? other.blendMode,
        fit: fit ?? other.fit,
        alignment: alignment ?? other.alignment,
      );
    }
  }

  SvgIconThemeData resolve(BuildContext context) => this;

  SvgIconThemeData lerp(
    SvgIconThemeData? other,
    double t,
  ) {
    if (other is! SvgIconThemeData) {
      return this;
    }

    return SvgIconThemeData(
      width: lerpDouble(width, other.width, t),
      height: lerpDouble(height, other.height, t),
      color: Color.lerp(color, other.color, t),
      blendMode: t < 0.5 ? blendMode : other.blendMode,
      fit: t < 0.5 ? fit : other.fit,
      alignment: t < 0.5 ? alignment : other.alignment,
    );
  }
}
