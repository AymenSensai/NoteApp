import 'package:flutter/material.dart';
import 'package:notes_app/core/theming/colors.dart';
import 'package:notes_app/core/theming/font_weight_helper.dart';

class TextStyles {
  static TextStyle font24WhiteBold = const TextStyle(
    fontSize: 24,
    fontWeight: FontWeightHelper.bold,
    color: ColorsManager.white,
  );

  static TextStyle font18WhiteMedium = const TextStyle(
    fontSize: 18,
    fontWeight: FontWeightHelper.medium,
    color: ColorsManager.white,
  );

  static TextStyle font16WhiteMedium = const TextStyle(
    fontSize: 16,
    fontWeight: FontWeightHelper.medium,
    color: ColorsManager.white,
  );

  static TextStyle font14WhiteMedium = const TextStyle(
    fontSize: 14,
    fontWeight: FontWeightHelper.medium,
    color: ColorsManager.white,
  );

  static TextStyle font14GrayMedium = const TextStyle(
    fontSize: 14,
    fontWeight: FontWeightHelper.medium,
    color: ColorsManager.gray,
  );

  static TextStyle font14SilverGrayMedium = const TextStyle(
    fontSize: 14,
    fontWeight: FontWeightHelper.medium,
    color: ColorsManager.silverGray,
  );

  static TextStyle font12GrayRegular = const TextStyle(
    fontSize: 12,
    fontWeight: FontWeightHelper.regular,
    color: ColorsManager.gray,
  );

  static TextStyle font12darkGrayRegular = const TextStyle(
    fontSize: 12,
    fontWeight: FontWeightHelper.regular,
    color: ColorsManager.darkGray,
  );
}
