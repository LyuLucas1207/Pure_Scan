import 'package:cy_scan/components/buttons/feature_button.dart'; // 引入 FeatureButton 组件
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green, // 背景颜色为绿色
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 20), // 顶部留白
            Padding(
              padding: const EdgeInsets.all(20),
              child: Text(
                'Pure QR Scanner',
                style: GoogleFonts.poppins(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(height: 50), // 顶部留白
            Center(
              child: Container(
                padding: const EdgeInsets.all(50),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.surface,
                  borderRadius: BorderRadius.circular(24),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 10,
                      spreadRadius: 5,
                    ),
                  ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    FeatureButton(
                      title: 'Generate QR Code',
                      icon: Icons.qr_code,
                      onPressed: () =>
                          Navigator.pushNamed(context, '/generate_qr'),
                    ),
                    const SizedBox(height: 50),
                    FeatureButton(
                      title: 'Scan QR Code',
                      icon: Icons.qr_code_scanner,
                      onPressed: () => Navigator.pushNamed(context, '/scan_qr'),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
