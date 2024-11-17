import 'package:flutter/material.dart';

enum FieldType {
  name,
  phone,
  email,
  url,
  text,
}

extension FieldTypeExtension on FieldType {
  /// 返回每个字段对应的文本标签
  String get label {
    switch (this) {
      case FieldType.name:
        return 'Name';
      case FieldType.phone:
        return 'Phone';
      case FieldType.email:
        return 'Email';
      case FieldType.url:
        return 'URL';
      case FieldType.text:
        return 'Text';
    }
  }

  /// 每个字段对应的 `TextEditingController`
  static final Map<FieldType, TextEditingController> _controllers = {
    for (var type in FieldType.values) type: TextEditingController(),
  };

  TextEditingController get controller => _controllers[this]!;

// TextEditingController get controller {
//   // "this" 在这里指的是调用该 getter 的当前枚举实例。
//   final currentField = this;
//   return _controllers[currentField]!; // 通过当前枚举值从 _controllers Map 中获取对应的 TextEditingController
// }
}
