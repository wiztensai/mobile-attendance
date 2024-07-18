import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mobile_attendance2/utils/size_utils.dart';

class MyFontLabel extends StatelessWidget {
  const MyFontLabel(
      {required this.text, this.bold = false, this.textAlign, super.key});
  final String text;
  final bool bold;
  final TextAlign? textAlign;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: SPACESIZE_SMALL_EXTRA),
      child: Text(
        text,
        textAlign: textAlign,
        style: TextStyle(
            fontSize: FONTSIZE_LABEL,
            fontWeight: bold ? FontWeight.bold : null),
      ),
    );
  }
}

class MyFontTitle extends StatelessWidget {
  const MyFontTitle({required this.text, this.textAlign, super.key});
  final String text;
  final TextAlign? textAlign;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      style: TextStyle(fontWeight: FontWeight.bold, fontSize: FONTSIZE_TITLE),
    );
  }
}

class MyFontSubtitle extends StatelessWidget {
  const MyFontSubtitle({required this.text, this.textAlign, super.key});
  final String text;
  final TextAlign? textAlign;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      style:
          TextStyle(fontWeight: FontWeight.bold, fontSize: FONTSIZE_SUBTITLE),
    );
  }
}

class MyFontBody extends StatelessWidget {
  const MyFontBody(
      {required this.text,
      this.maxLine,
      this.color,
      this.textAlign,
      this.bold = false,
      this.withEllipsis = false,
      this.textStyle,
      super.key});

  final bool bold;
  final String text;
  final int? maxLine;
  final Color? color;
  final TextAlign? textAlign;
  final bool withEllipsis;
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    TextStyle fw;
    if (bold) {
      fw = TextStyle(
          fontWeight: FontWeight.bold, fontSize: FONTSIZE_BODY, color: color);
    } else {
      fw = TextStyle(fontSize: FONTSIZE_BODY, color: color);
    }

    if (textStyle != null) {
      fw = textStyle!;
    }

    /**
   * kenapa dipisah elipsis?
   * karena kalo pake elipsis, maxline otomatis jadi 1
   * 
   * kalo pake ellipsis, wajib pake maxline
   */
    if (withEllipsis) {
      assert(maxLine != null);

      return Text(
        text,
        textAlign: textAlign,
        maxLines: maxLine,
        overflow: TextOverflow.ellipsis,
        style: fw,
      );
    } else {
      return Text(
        text,
        textAlign: textAlign,
        maxLines: maxLine,
        style: fw,
      );
    }
  }
}

MyFontHomeBanner(String title) {
  return Text(
    title,
    style: TextStyle(
        fontSize: FONTSIZE_BODY,
        fontFamily: 'Noto',
        fontWeight: FontWeight.w500,
        fontStyle: FontStyle.italic),
  );
}

class MyFontDesc extends StatelessWidget {
  const MyFontDesc(
      {required this.text,
      this.bold = false,
      this.maxLine,
      this.color,
      this.textAlign,
      super.key});
  final bool bold;
  final String text;
  final TextAlign? textAlign;
  final int? maxLine;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    TextStyle fw;
    if (bold) {
      fw = TextStyle(
          fontWeight: FontWeight.bold, fontSize: FONTSIZE_DESC, color: color);
    } else {
      fw = TextStyle(fontSize: FONTSIZE_DESC, color: color);
    }
    return Text(
      text,
      textAlign: textAlign,
      maxLines: maxLine,
      softWrap: false,
      overflow: TextOverflow.ellipsis,
      style: fw,
    );
  }
}

MyFontLogo(String text, {double? fontSize, Color? color}) {
  return Text(
    text,
    style: TextStyle(fontSize: fontSize, fontFamily: 'Prompt', color: color),
  );
}

class MyFontButton extends StatelessWidget {
  const MyFontButton(
      {required this.text,
      this.bold = false,
      this.color,
      this.textAlign,
      super.key});

  final bool bold;
  final String text;
  final Color? color;
  final TextAlign? textAlign;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      style: TextStyle(
          color: color,
          fontSize: FONTSIZE_BUTTON,
          fontWeight: bold ? FontWeight.w700 : null),
    );
  }
}

class MyFontAppbar extends StatelessWidget {
  const MyFontAppbar(
      {required this.text,
      this.bold = false,
      this.color,
      this.fontSize,
      super.key});

  final String text;
  final bool bold;
  final Color? color;
  final double? fontSize;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          fontSize: fontSize ?? FONTSIZE_BUTTON_APPBAR,
          // color: color ?? Colors.white,
          fontWeight: bold ? FontWeight.w700 : null),
    );
  }
}

MyFontDialogTitle(String text) {
  return Text(
    text,
    style: TextStyle(fontSize: FONTSIZE_SUBTITLE, fontWeight: FontWeight.w700),
  );
}
