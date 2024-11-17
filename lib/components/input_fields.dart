import 'package:cy_scan/enums/field_type.dart';
import 'package:cy_scan/enums/icon_type.dart';
import 'package:flutter/material.dart';

/// 通用的文本输入框组件
class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final ValueChanged<String>? onChanged;

  const CustomTextField({
    super.key,
    required this.controller,
    required this.label,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          labelText: label,
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(12)),
          ),
        ),
        onChanged: onChanged,
      ),
    );
  }
}

class InputFieldsBuilder extends StatelessWidget {
  final Map<IconType, List<FieldType>> fieldTypes;
  final IconType selectedType;
  final Function(String) onDataChanged;

  const InputFieldsBuilder({
    super.key,
    required this.fieldTypes,
    required this.selectedType,
    // required this.controllers,
    required this.onDataChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: fieldTypes[selectedType]!.map((fieldType) {
        return CustomTextField(
          controller: fieldType.controller,
          label: fieldType.label,
          onChanged: (_) => onDataChanged(''),
        );
      }).toList(),
    );
  }
}

// Map<FieldType, TextEditingController> generateControllers({
//   required IconType selectedType,
//   required Map<IconType, List<FieldType>> fieldTypes,
// }) {
//   return {
//     for (var fieldType in fieldTypes[selectedType]!)
//       fieldType: fieldType.controller,
//   };
// }
// controllers: {
//    for (var fieldType in fieldTypes[selectedType]!)
//    fieldType: fieldType.controller,
// },
