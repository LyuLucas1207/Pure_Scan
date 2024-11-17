import 'package:cy_scan/pages/home_page.dart'; // 引入主页组件
import 'package:cy_scan/router/app_router.dart'; // 引入路由配置
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    systemNavigationBarColor: Colors.green, // 设置系统导航栏背景颜色
    systemNavigationBarIconBrightness: Brightness.light, // 设置导航栏图标颜色
    statusBarColor: Colors.green, // 设置状态栏颜色
    statusBarIconBrightness: Brightness.light, // 设置状态栏图标颜色
  ));

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CygnusX QR Code Scanner',
      debugShowCheckedModeBanner: false,
      // 关闭右上角的调试标志
      theme: ThemeData(
        primarySwatch: createMaterialColor(
            const Color.fromRGBO(34, 139, 48, 1.0)), // 创建主颜色
        useMaterial3: true, // 使用 Material Design 3
        textTheme: GoogleFonts.poppinsTextTheme(), // 使用 Poppins 字体作为全局文本样式
        colorScheme: const ColorScheme(
          brightness: Brightness.light,
          primary: Color(0xFF228B22),
          onPrimary: Colors.white,
          secondary: Color(0xFF6B8E23),
          onSecondary: Colors.white,
          error: Colors.red,
          onError: Colors.white,
          surface: Color(0xFFFFFFFF),
          onSurface: Colors.black, // 表面上的文字颜色
        ),
      ),
      home: const HomePage(),
      initialRoute: '/',
      onGenerateRoute: AppRouter.generateRoute, // 使用自定义路由生成器
    );
  }
}

/// 创建一个 `MaterialColor` 用于生成不同亮度的主颜色。
MaterialColor createMaterialColor(Color color) {
  Map<int, Color> colorSwatch = {
    50: Color.fromRGBO(color.red, color.green, color.blue, .1), // 亮度 10%
    100: Color.fromRGBO(color.red, color.green, color.blue, .2), // 亮度 20%
    200: Color.fromRGBO(color.red, color.green, color.blue, .3), // 亮度 30%
    300: Color.fromRGBO(color.red, color.green, color.blue, .4), // 亮度 40%
    400: Color.fromRGBO(color.red, color.green, color.blue, .5), // 亮度 50%
    500: Color.fromRGBO(color.red, color.green, color.blue, .6), // 亮度 60%
    600: Color.fromRGBO(color.red, color.green, color.blue, .7), // 亮度 70%
    700: Color.fromRGBO(color.red, color.green, color.blue, .8), // 亮度 80%
    800: Color.fromRGBO(color.red, color.green, color.blue, .9), // 亮度 90%
    900: Color.fromRGBO(color.red, color.green, color.blue, 1.0), // 亮度 100%
  };
  return MaterialColor(color.value, colorSwatch); // 返回自定义的 MaterialColor
}
