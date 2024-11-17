import 'package:cy_scan/configs/components/selectors_configs.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SliderSelector extends StatelessWidget {
  final String title;
  final double value;
  final double min;
  final double max;
  final ValueChanged<double> onChanged;
  final double fontSize;
  final FontWeight fontWeight;
  final Color fontColor;
  final int divisions;

  const SliderSelector({
    super.key,
    required this.value,
    required this.min,
    required this.max,
    required this.onChanged,
    this.title = SliderSelectorConfigs.defaultText,
    this.fontSize = SliderSelectorConfigs.defaultFontSize,
    this.fontWeight = SliderSelectorConfigs.defaultFontWeight,
    this.fontColor = SliderSelectorConfigs.defaultFontColor,
    this.divisions = SliderSelectorConfigs.defaultDivisions,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: GoogleFonts.poppins(fontWeight: FontWeight.bold).merge(
            TextStyle(
              fontSize: fontSize,
              fontWeight: fontWeight,
              color: fontColor,
            ),
          ),
        ),
        Slider(
          value: value,
          min: min,
          max: max,
          divisions: divisions,
          label: value.toStringAsFixed(0),
          onChanged: onChanged,
        ),
      ],
    );
  }
}
