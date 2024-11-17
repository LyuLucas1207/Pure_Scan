import 'package:cy_scan/components/buttons/defaulted_button.dart';
import 'package:cy_scan/components/buttons/segmented_button.dart';
import 'package:cy_scan/components/buttons/shared_button.dart';
import 'package:cy_scan/components/input_fields.dart';
import 'package:cy_scan/components/selectors/color_picker_dialog.dart';
import 'package:cy_scan/components/selectors/shape_picker.dart';
import 'package:cy_scan/components/selectors/slider_selector.dart';
import 'package:cy_scan/components/selectors/switch_selector.dart';
import 'package:cy_scan/configs/components/qr_configs.dart';
import 'package:cy_scan/enums/field_type.dart';
import 'package:cy_scan/enums/icon_type.dart';
import 'package:cy_scan/utils/qr_code_utils.dart';
import 'package:cy_scan/utils/share_utils.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:screenshot/screenshot.dart';

class GenerateQRPage extends StatefulWidget {
  const GenerateQRPage({super.key});

  @override
  GenerateQRPageState createState() => GenerateQRPageState();
}

class GenerateQRPageState extends State<GenerateQRPage> {
  final ScreenshotController _screenshotsController = ScreenshotController();

  String qrData = '';
  IconType selectedType = IconType.text; // 默认选中 Text 类型

  final fieldTypes = {
    IconType.contact: [FieldType.name, FieldType.phone, FieldType.email],
    IconType.url: [FieldType.url],
    IconType.text: [FieldType.text],
  };

  final options = const [
    IconType.text,
    IconType.url,
    IconType.contact,
  ];

  // QR Code 样式配置
  double qrSize = QRConfigs.defaultSize;
  double qrPadding = QRConfigs.defaultPadding;
  bool qrGapless = QRConfigs.defaultGapless;
  Color qrBackgroundColor = QRConfigs.defaultBackgroundColor;
  Color qrEyeColor = QRConfigs.defaultEyeColor;
  QrEyeShape qrEyeShape = QRConfigs.defaultEyeShape;
  Color qrDataModuleColor = QRConfigs.defaultDataModuleColor;
  QrDataModuleShape qrDataModuleShape = QRConfigs.defaultDataModuleShape;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      appBar: AppBar(
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
        elevation: 0,
        title: Text('Generate QR Code', style: GoogleFonts.poppins()),
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // 上方选项卡组件
              Card(
                color: Colors.white,
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    children: [
                      CustomSegmentedButton(
                        options: options,
                        selectedValue: selectedType,
                        onChanged: (IconType newValue) {
                          setState(() {
                            selectedType = newValue; // 更新选中的类型
                            qrData = ''; // 清空 QR 数据
                          });
                        },
                        fontSize: 11,
                      ),
                      const SizedBox(height: 24),
                      InputFieldsBuilder(
                        fieldTypes: fieldTypes,
                        selectedType: selectedType,
                        onDataChanged: (newData) {
                          setState(() {
                            qrData = QRCodeUtils.generateQRData(
                                selectedType: selectedType);
                          });
                        },
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 24),
              // 如果有 QR 数据，则显示 QR 代码
              if (qrData.isNotEmpty)
                Column(
                  children: [
                    Card(
                      color: Colors.white,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          children: [
                            Screenshot(
                              controller: _screenshotsController,
                              child: Container(
                                color: Colors.white,
                                padding: const EdgeInsets.all(16),
                                child: QrImageView(
                                  data: qrData,
                                  version: QrVersions.auto,
                                  size: qrSize,
                                  eyeStyle: QrEyeStyle(
                                    eyeShape: qrEyeShape,
                                    color: qrEyeColor,
                                  ),
                                  dataModuleStyle: QrDataModuleStyle(
                                    dataModuleShape: qrDataModuleShape,
                                    color: qrDataModuleColor,
                                  ),
                                  gapless: qrGapless,
                                  backgroundColor: qrBackgroundColor,
                                  padding: EdgeInsets.all(qrPadding),
                                  errorCorrectionLevel: QrErrorCorrectLevel.H,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 24),
                    SharedButton(
                      iconType: IconType.share,
                      sharedText: 'Share QR Code',
                      onPressed: () async {
                        final imagePath = await QRCodeUtils.captureQRCode(
                          screenshotController: _screenshotsController,
                        );
                        if (imagePath != null) {
                          await ShareUtils.shareImage(imagePath);
                        }
                      },
                      verticalPadding: 12,
                      horizontalPadding: 24,
                    ),
                  ],
                ),
              const SizedBox(height: 24),
              // 滑动框和选项卡配置 QR 样式
              _buildCustomizationSection(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCustomizationSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // QR Size 滑块
        SliderSelector(
          title: 'QR Size',
          value: qrSize,
          min: 100,
          max: 300,
          onChanged: (newValue) => setState(() => qrSize = newValue),
        ),
        // QR Padding 滑块
        SliderSelector(
          title: 'QR Padding',
          value: qrPadding,
          min: 0,
          max: 50,
          onChanged: (newValue) => setState(() => qrPadding = newValue),
        ),
        // Gapless 开关
        SwitchSelector(
          title: 'Gapless',
          value: qrGapless,
          onChanged: (newValue) => setState(() => qrGapless = newValue),
        ),
        // Eye Shape 选择器
        ShapePicker<QrEyeShape>(
          title: 'Eye Shape',
          options: QrEyeShape.values,
          selectedValue: qrEyeShape,
          onChanged: (newShape) => setState(() => qrEyeShape = newShape),
          icons: const {
            QrEyeShape.square: Icons.square,
            QrEyeShape.circle: Icons.circle,
          }, // 定义图标
        ),
        // Data Module Shape 选择器
        ShapePicker<QrDataModuleShape>(
          title: 'Data Module Shape',
          options: QrDataModuleShape.values,
          selectedValue: qrDataModuleShape,
          onChanged: (newShape) => setState(() => qrDataModuleShape = newShape),
          icons: const {
            QrDataModuleShape.square: Icons.square,
            QrDataModuleShape.circle: Icons.circle,
          }, // 定义图标
        ),
        // Background Color 颜色选择器
        ColorPickerDialog(
          title: 'Background Color',
          currentColor: qrBackgroundColor,
          onColorChanged: (newColor) =>
              setState(() => qrBackgroundColor = newColor),
        ),
        // Eye Style Color 颜色选择器
        ColorPickerDialog(
          title: 'Eye Style Color',
          currentColor: qrEyeColor,
          onColorChanged: (newColor) => setState(() => qrEyeColor = newColor),
        ),
        // Data Module Color 颜色选择器
        ColorPickerDialog(
          title: 'Data Module Color',
          currentColor: qrDataModuleColor,
          onColorChanged: (newColor) =>
              setState(() => qrDataModuleColor = newColor),
        ),
        const SizedBox(height: 20),
        // Set to Default 按钮
        DefaultedButton(
          onPressed: _resetToDefault, // 传递恢复默认值的方法
          text: 'Set to Default',
          backgroundColor: Colors.white,
          textColor: Colors.green,
        ),
      ],
    );
  }

  /// 恢复默认值
  void _resetToDefault() {
    setState(() {
      qrSize = QRConfigs.defaultSize;
      qrPadding = QRConfigs.defaultPadding;
      qrGapless = QRConfigs.defaultGapless;
      qrBackgroundColor = QRConfigs.defaultBackgroundColor;
      qrEyeColor = QRConfigs.defaultEyeColor;
      qrEyeShape = QRConfigs.defaultEyeShape;
      qrDataModuleColor = QRConfigs.defaultDataModuleColor;
      qrDataModuleShape = QRConfigs.defaultDataModuleShape;
    });
  }
}
