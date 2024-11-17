import 'package:cy_scan/configs/components/buttons_configs.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DefaultedButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  final Color backgroundColor;
  final Color textColor;
  final double horizontalPadding;
  final double verticalPadding;
  final FontWeight fontWeight;
  final double fontSize;

  const DefaultedButton({
    super.key,
    required this.onPressed,
    this.text = DefaultedButtonConfigs.defaultText,
    this.backgroundColor = DefaultedButtonConfigs.defaultBackgroundColor,
    this.textColor = DefaultedButtonConfigs.defaultTextColor,
    this.horizontalPadding = DefaultedButtonConfigs.defaultHorizontalPadding,
    this.verticalPadding = DefaultedButtonConfigs.defaultVerticalPadding,
    this.fontWeight = DefaultedButtonConfigs.defaultFontWeight,
    this.fontSize = DefaultedButtonConfigs.defaultFontSize,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          padding: EdgeInsets.symmetric(
            horizontal: horizontalPadding,
            vertical: verticalPadding,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        child: Text(
          text,
          style: GoogleFonts.poppins(
            fontSize: fontSize,
            fontWeight: fontWeight,
            color: textColor,
          ),
        ),
      ),
    );
  }
}
