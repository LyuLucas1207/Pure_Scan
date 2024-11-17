import 'package:cy_scan/configs/components/buttons_configs.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FeatureButton extends StatelessWidget {
  final String title;
  final IconData icon;
  final VoidCallback onPressed;
  final double height;
  final double width;
  final double fontSize;
  final FontWeight fontWeight;
  final Color color;
  final double iconSize;
  final Color iconColor;

  const FeatureButton({
    super.key,
    required this.title,
    required this.icon,
    required this.onPressed,
    this.height = DefaultedFeatureButtonConfigs.height,
    this.width = DefaultedFeatureButtonConfigs.width,
    this.fontSize = DefaultedFeatureButtonConfigs.fontSize,
    this.fontWeight = DefaultedFeatureButtonConfigs.fontWeight,
    this.color = DefaultedFeatureButtonConfigs.color,
    this.iconSize = DefaultedFeatureButtonConfigs.iconSize,
    this.iconColor = DefaultedFeatureButtonConfigs.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: const EdgeInsets.all(15),
        height: 200,
        width: 230,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(icon, size: 120, color: Colors.white),
            const SizedBox(height: 10),
            Text(
              title,
              style: GoogleFonts.poppins(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
