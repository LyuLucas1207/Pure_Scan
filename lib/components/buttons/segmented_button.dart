import 'package:cy_scan/configs/components/buttons_configs.dart';
import 'package:cy_scan/enums/icon_type.dart';
import 'package:flutter/material.dart';

class CustomSegmentedButton extends StatelessWidget {
  final List<IconType> options;
  final IconType selectedValue;
  final Function(IconType) onChanged;
  final double fontSize;
  final FontWeight fontWeight;
  final Color fontColor;
  final double iconSize;
  final Color iconColor;

  const CustomSegmentedButton({
    super.key,
    required this.options,
    required this.selectedValue,
    required this.onChanged,
    this.fontSize = DefaultedSegmentedButtonConfigs.fontSize,
    this.fontWeight = DefaultedSegmentedButtonConfigs.fontWeight,
    this.fontColor = DefaultedSegmentedButtonConfigs.fontColor,
    this.iconSize = DefaultedSegmentedButtonConfigs.iconSize,
    this.iconColor = DefaultedSegmentedButtonConfigs.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return SegmentedButton<IconType>(
      segments: options.map((option) {
        return ButtonSegment(
          value: option, // 确保这里的 value 是 IconType
          label: Text(
            option.label,
            style: TextStyle(
                fontSize: fontSize, fontWeight: fontWeight, color: fontColor),
          ),
          icon: Icon(option.icon, size: iconSize, color: iconColor),
        );
      }).toList(),
      selected: {selectedValue},
      onSelectionChanged: (Set<IconType> newSelection) {
        // 明确 newSelection 的类型
        onChanged(newSelection.first); // 确保回调的是 IconType 类型
      },
    );
  }
}
