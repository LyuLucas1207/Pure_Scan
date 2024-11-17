import 'package:cy_scan/pages/generate_qr_page.dart';
import 'package:cy_scan/pages/home_page.dart';
import 'package:cy_scan/pages/scan_qr_code.dart';
import 'package:flutter/material.dart';

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => const HomePage());
      case '/generate_qr':
        return MaterialPageRoute(builder: (_) => const GenerateQRPage());
      case '/scan_qr':
        return MaterialPageRoute(builder: (_) => const ScanQRCode());
      default:
        // 为未定义的路由返回一个友好的页面
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            appBar: AppBar(title: const Text('404')),
            body: Center(child: Text('No route defined for ${settings.name}')),
          ),
        );
    }
  }
}
