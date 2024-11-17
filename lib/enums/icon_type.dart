import 'package:flutter/material.dart';

enum IconType {
  text,
  url,
  contact,
  share,
}

extension IconTypeExtension on IconType {
  IconData get icon {
    switch (this) {
      case IconType.text:
        return Icons.text_fields;
      case IconType.url:
        return Icons.link;
      case IconType.contact:
        return Icons.contact_page;
      case IconType.share:
        return Icons.share;
      default:
        return Icons.question_mark;
    }
  }

  String get label {
    switch (this) {
      case IconType.text:
        return 'Text';
      case IconType.url:
        return 'URL';
      case IconType.contact:
        return 'Contact';
      case IconType.share:
        return 'Share';
      default:
        return 'Unknown';
    }
  }
}
