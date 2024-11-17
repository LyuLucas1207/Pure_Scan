import 'package:cy_scan/configs/components/selectors_configs.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SwitchSelector extends StatelessWidget {
  final String title;
  final bool value;
  final ValueChanged<bool> onChanged;
  final double fontSize;
  final FontWeight fontWeight;
  final Color fontColor;

  const SwitchSelector({
    super.key,
    required this.value,
    required this.onChanged,
    this.title = SwitchSelectorConfigs.defaultText,
    this.fontSize = SwitchSelectorConfigs.defaultFontSize,
    this.fontWeight = SwitchSelectorConfigs.defaultFontWeight,
    this.fontColor = SwitchSelectorConfigs.defaultFontColor,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: GoogleFonts.poppins(
            fontSize: fontSize,
            fontWeight: fontWeight,
            color: fontColor,
          ),
        ),
        Switch(
          value: value,
          onChanged: onChanged,
        ),
      ],
    );
  }
}
