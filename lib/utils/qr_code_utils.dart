import 'dart:io';

import 'package:cy_scan/enums/field_type.dart';
import 'package:cy_scan/enums/icon_type.dart';
import 'package:path_provider/path_provider.dart';
import 'package:screenshot/screenshot.dart';

class QRCodeUtils {
  /// 根据选中的类型生成二维码数据
  static String generateQRData({
    required IconType selectedType,
  }) {
    switch (selectedType) {
      case IconType.contact:
        return '''BEGIN:VCARD
        VERSION:3.0
        FN:${FieldType.name.controller.text}
        TEL:${FieldType.phone.controller.text}
        EMAIL:${FieldType.email.controller.text}
        END:VCARD''';
      case IconType.url:
        String url = FieldType.url.controller.text;
        url = url.toLowerCase();
        if (!url.startsWith('http') && !url.startsWith('https')) {
          url = 'https://$url';
        }
        return url;
      case IconType.text:
        return FieldType.text.controller.text;
      default:
        return FieldType.text.controller.text;
    }
  }

  /// 截图二维码并返回图片路径
  static Future<String?> captureQRCode({
    required ScreenshotController screenshotController,
  }) async {
    final directory = await getApplicationDocumentsDirectory();
    final path = '${directory.path}/qr_code.png';
    final capturedImage = await screenshotController.capture();

    if (capturedImage == null) return null;

    File imageFile = File(path);
    await imageFile.writeAsBytes(capturedImage);
    return path;
  }
}
