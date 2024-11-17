import 'package:cy_scan/configs/components//selectors_configs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:google_fonts/google_fonts.dart';

class ColorPickerDialog extends StatelessWidget {
  final String title;
  final Color currentColor;
  final ValueChanged<Color> onColorChanged;
  final double bottomPadding;
  final double fontSize;
  final FontWeight fontWeight;
  final Color fontColor;
  final double colorPickerWidth;
  final double colorPickerHeight;
  final BoxShape colorPickerShape;
  final double colorPickerBorderWidth;
  final Color colorPickerBorderColor;

  const ColorPickerDialog({
    super.key,
    required this.title,
    required this.currentColor,
    required this.onColorChanged,
    this.bottomPadding = ColorPickerDialogConfigs.defaultBottomPadding,
    this.fontSize = ColorPickerDialogConfigs.defaultFontSize,
    this.fontWeight = ColorPickerDialogConfigs.defaultFontWeight,
    this.fontColor = ColorPickerDialogConfigs.defaultFontColor,
    this.colorPickerWidth = ColorPickerDialogConfigs.defaultColorPickerWidth,
    this.colorPickerHeight = ColorPickerDialogConfigs.defaultColorPickerHeight,
    this.colorPickerShape = ColorPickerDialogConfigs.defaultColorPickerShape,
    this.colorPickerBorderWidth =
        ColorPickerDialogConfigs.defaultColorPickerBorderWidth,
    this.colorPickerBorderColor =
        ColorPickerDialogConfigs.defaultColorPickerBorderColor,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center, // 确保标题与颜色选择器垂直居中
      children: [
        Expanded(
          child: Text(
            title,
            style: GoogleFonts.poppins(fontWeight: FontWeight.bold).merge(
              TextStyle(
                fontSize: fontSize,
                fontWeight: fontWeight,
                color: fontColor,
              ),
            ),
          ),
        ),
        GestureDetector(
          onTap: () => _openColorPickerDialog(
            context: context,
            currentColor: currentColor,
            onColorChanged: onColorChanged,
          ),
          child: Container(
            width: colorPickerWidth,
            height: colorPickerHeight,
            decoration: BoxDecoration(
              color: currentColor,
              shape: colorPickerShape,
              border: Border.all(
                color: colorPickerBorderColor,
                width: colorPickerBorderWidth,
              ),
            ),
          ),
        ),
        SizedBox(height: bottomPadding),
      ],
    );
  }

  void _openColorPickerDialog({
    required BuildContext context,
    required Color currentColor,
    required ValueChanged<Color> onColorChanged,
  }) {
    showDialog(
      context: context,
      builder: (context) {
        Color tempColor = currentColor; // 临时颜色
        return AlertDialog(
          title: const Text('Select Color'),
          content: SingleChildScrollView(
            child: ColorPicker(
              pickerColor: currentColor,
              onColorChanged: (color) => tempColor = color,
              pickerAreaHeightPercent: 0.8,
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(), // 取消选择
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                onColorChanged(tempColor);
                Navigator.of(context).pop(); // 确认选择
              },
              child: const Text('Select'),
            ),
          ],
        );
      },
    );
  }
}
