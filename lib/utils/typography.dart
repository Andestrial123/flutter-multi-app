import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

enum TypographyType {
  headline1,
  headline3,
  middleText,
  middleTextBold,
  smallText,
  smallTextBold,
  bigText,
  bigTextBold,
}

class _TypographyProps {
  final double fontSize;
  final FontWeight fontWeight;
  final double height;

  const _TypographyProps({
    required this.fontSize,
    required this.fontWeight,
    required this.height,
  });
}

const typographyStyles = <TypographyType, _TypographyProps>{
  TypographyType.headline1: _TypographyProps(
      fontSize: 24, fontWeight: FontWeight.w800, height: 30.0 / 24),
  TypographyType.headline3: _TypographyProps(
      fontSize: 18, fontWeight: FontWeight.w600, height: 23.0 / 18),
  TypographyType.middleText: _TypographyProps(
      fontSize: 14, fontWeight: FontWeight.w600, height: 18.0 / 14),
  TypographyType.middleTextBold: _TypographyProps(
    fontSize: 14,
    fontWeight: FontWeight.w800,
    height: 18.0 / 14,
  ),
  TypographyType.smallText: _TypographyProps(
      fontSize: 12, fontWeight: FontWeight.w600, height: 16.0 / 12),
  TypographyType.smallTextBold: _TypographyProps(
      fontSize: 12, fontWeight: FontWeight.w800, height: 16.0 / 12),
  TypographyType.bigText: _TypographyProps(
      fontSize: 16, fontWeight: FontWeight.w600, height: 16 / 12),
  TypographyType.bigTextBold: _TypographyProps(
      fontSize: 16, fontWeight: FontWeight.w800, height: 21 / 16)
};

class MultiAppTypography extends StatelessWidget {
  final TypographyType type;
  final String text;
  final Color color;
  final TextOverflow? overflow;
  final int? maxLines;
  final TextDecoration? textDecoration;
  final TextAlign? textAlign;
  final bool disableThemeColor;
  final bool? softWrap;
  final double minFontSize;
  final bool autoresize;

  const MultiAppTypography(
    this.type,
    this.text, {
    super.key,
    this.color = Colors.brown,
    this.overflow,
    this.maxLines,
    this.textDecoration = TextDecoration.none,
    this.textAlign,
    this.disableThemeColor = false,
    this.softWrap,
    this.minFontSize = 12,
    this.autoresize = true,
  });

  @override
  Widget build(BuildContext context) {
    final style = typographyStyles[type]!;
    return AutoSizeText(
      text,
      minFontSize: autoresize ? minFontSize : style.fontSize,
      style: TextStyle(
        fontSize: style.fontSize,
        fontWeight: style.fontWeight,
        height: style.height,
        decoration: textDecoration,
        color: color,
      ),
      overflow: overflow,
      maxLines: maxLines,
      textAlign: textAlign,
      softWrap: softWrap,
    );
  }
}
