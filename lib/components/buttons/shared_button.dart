import 'package:cy_scan/configs/components/buttons_configs.dart';
import 'package:cy_scan/enums/icon_type.dart';
import 'package:flutter/material.dart';

class SharedButton extends StatelessWidget {
  final IconType iconType;
  final String sharedText;
  final VoidCallback onPressed; // 点击按钮的逻辑
  final double verticalPadding;
  final double horizontalPadding;
  final double fontSize;
  final FontWeight fontWeight;
  final Color fontColor;
  final double iconSize;
  final Color iconColor;

  const SharedButton({
    super.key,
    required this.iconType,
    required this.sharedText,
    required this.onPressed,
    this.verticalPadding = DefaultedSharedButtonConfigs.verticalPadding,
    this.horizontalPadding = DefaultedSharedButtonConfigs.horizontalPadding,
    this.fontSize = DefaultedSharedButtonConfigs.fontSize,
    this.fontWeight = DefaultedSharedButtonConfigs.fontWeight,
    this.fontColor = DefaultedSharedButtonConfigs.fontColor,
    this.iconSize = DefaultedSharedButtonConfigs.iconSize,
    this.iconColor = DefaultedSharedButtonConfigs.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: onPressed, // 动态传入逻辑
      icon: Icon(
        iconType.icon,
        color: iconColor,
        size: iconSize,
      ), // 动态传入 icon
      label: Text(
        sharedText,
        style: TextStyle(
          fontSize: fontSize,
          fontWeight: fontWeight,
          color: fontColor,
        ),
      ),
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white,
        padding: EdgeInsets.symmetric(
          vertical: verticalPadding,
          horizontal: horizontalPadding,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );
  }
}
