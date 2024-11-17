import 'package:cy_scan/configs/components/selectors_configs.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ShapePicker<T> extends StatelessWidget {
  final String title;
  final List<T> options;
  final T selectedValue;
  final ValueChanged<T> onChanged;
  final Map<T, IconData>? icons; // 可选的图标映射
  final double fontSize;
  final FontWeight fontWeight;
  final Color fontColor;
  final double spacing;
  final double iconSize;
  final Color iconSelectedColor;
  final Color iconUnselectedColor;
  final double iconSpacing;
  final double innerFontSize;
  final FontWeight innerFontWeight;
  final Color innerFontSelectedColor;
  final Color innerFontUnselectedColor;

  const ShapePicker({
    super.key,
    required this.title,
    required this.options,
    required this.selectedValue,
    required this.onChanged,
    this.icons,
    this.fontSize = ShapePickerConfigs.defaultFontSize,
    this.fontWeight = ShapePickerConfigs.defaultFontWeight,
    this.fontColor = ShapePickerConfigs.defaultFontColor,
    this.spacing = ShapePickerConfigs.defaultSpacing,
    this.iconSize = ShapePickerConfigs.defaultIconSize,
    this.iconSelectedColor = ShapePickerConfigs.defaultSelectedColor,
    this.iconUnselectedColor = ShapePickerConfigs.defaultUnselectedColor,
    this.iconSpacing = ShapePickerConfigs.defaultIconSpacing,
    this.innerFontSize = ShapePickerConfigs.defaultInnerFontSize,
    this.innerFontWeight = ShapePickerConfigs.defaultInnerFontWeight,
    this.innerFontSelectedColor =
        ShapePickerConfigs.defaultInnerFontSelectedColor,
    this.innerFontUnselectedColor =
        ShapePickerConfigs.defaultInnerFontUnselectedColor,
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
        Wrap(
          spacing: spacing,
          children: options.map((option) {
            return ChoiceChip(
              showCheckmark: false,
              // 禁用默认的勾号显示
              side: BorderSide.none,
              // 移除默认边框
              label: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    selectedValue == option
                        ? Icons.check // 选中时显示勾号
                        : (icons?[option] ?? Icons.circle), // 未选中显示默认图标
                    size: iconSize,
                    color: selectedValue == option
                        ? iconSelectedColor
                        : iconUnselectedColor,
                  ),
                  SizedBox(width: iconSpacing),
                  Text(
                    option.toString().split('.').last,
                    style: GoogleFonts.poppins(
                      fontSize: innerFontSize,
                      fontWeight: innerFontWeight,
                      color: selectedValue == option
                          ? innerFontSelectedColor
                          : innerFontUnselectedColor,
                    ), // 文本样式
                  ),
                ],
              ),
              selected: selectedValue == option,
              onSelected: (isSelected) {
                if (isSelected) onChanged(option); // 选中触发回调
              },
            );
          }).toList(),
        ),
      ],
    );
  }
}
