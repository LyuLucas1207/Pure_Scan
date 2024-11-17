import 'dart:io';

import 'package:share_plus/share_plus.dart';

class ShareUtils {
  /// 分享图片
  static Future<void> shareImage(String imagePath) async {
    final imageFile = File(imagePath);
    if (await imageFile.exists()) {
      await Share.shareXFiles([XFile(imagePath)], text: 'Shared Image');
    }
  }

  /// 分享文本
  static Future<void> shareText(String text) async {
    await Share.share(text, subject: 'Shared Text');
  }

  /// 分享视频
  static Future<void> shareVideo(String videoPath) async {
    final videoFile = File(videoPath);
    if (await videoFile.exists()) {
      await Share.shareXFiles([XFile(videoPath)], text: 'Shared Video');
    }
  }
}
