import 'package:flutter/material.dart';

import 'color_resources.dart';
import 'dimen_resources.dart';

ThemeData buildAppTheme() {
  final ThemeData base = ThemeData.light();
  return base.copyWith(
      accentColor: colorAccent,
      primaryColor: colorPrimary,
      primaryColorDark: colorPrimaryDark,
      primaryColorLight: colorPrimaryLight,
      buttonTheme: base.buttonTheme.copyWith(
          buttonColor: colorPrimary,
          textTheme: ButtonTextTheme.normal,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(6.0),
          )),
      scaffoldBackgroundColor: Colors.white,
      /*cardColor: kShrineBackgroundWhite,
    textSelectionColor: kShrinePink100,
    errorColor: kShrineErrorRed,*/
      textTheme: _buildTextTheme(base.textTheme),
      primaryTextTheme: _buildTextTheme(base.primaryTextTheme),
      accentTextTheme: _buildTextTheme(base.accentTextTheme),
      inputDecorationTheme: base.inputDecorationTheme.copyWith(
        labelStyle: base.textTheme.subtitle2,
        contentPadding: const EdgeInsets.only(bottom: 0),
      )
      );
}

TextTheme _buildTextTheme(TextTheme base) {
  return base
      .copyWith(
        headline6: base.headline6.copyWith(
          fontSize: TITLE_TEXT_FONT_SIZE,
          color: colorTextDarkBlue,
          fontWeight: FontWeight.w500,
        ),
        subtitle1: base.subtitle1.copyWith(
          fontSize: CAPTION_SMALLER_TEXT_FONT_SIZE,
          color: colorGray,
        ),
        subtitle2: base.subtitle2.copyWith(
          fontSize: CAPTION_TEXT_FONT_SIZE,
          color: colorTextLightGray,
        ),
        bodyText2: base.bodyText2.copyWith(
          fontSize: BODY2_TEXT_FONT_SIZE,
          fontWeight: FontWeight.w500,
        ),
        bodyText1: base.bodyText1.copyWith(
          fontSize: BODY1_TEXT_FONT_SIZE,
          fontWeight: FontWeight.normal,
        ),
        caption: base.caption.copyWith(
          fontSize: CAPTION_TEXT_FONT_SIZE,
          color: colorAccent,
        ),
        button: base.button.copyWith(
          fontSize: BODY2_TEXT_FONT_SIZE,
          color: colorTextDarkBlue,
        ),
      );
}

InputDecoration getTextFieldInputDecoration(
    String labelText, ThemeData baseTheme) {
  return InputDecoration(
    labelText: labelText,
    labelStyle: baseTheme.textTheme.subtitle2,
    contentPadding: const EdgeInsets.only(bottom: 0),
//      labelStyle: TextStyle(color: colorTextLabelGray, fontSize: 16),
  );
}
