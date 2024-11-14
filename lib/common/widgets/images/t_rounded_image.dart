import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:tergov/utils/constants/enums.dart';
import 'package:tergov/utils/constants/sizes.dart';


class TRoundedImage extends StatelessWidget {
  const TRoundedImage({
    super.key,
    this.image,
    this.file,
    this.border,
    this.width = 56,
    this.height = 56,
    this.memoryImage,
    required this.imageType,
    this.overlayColor,
    this.backgroundColor,
    this.padding = TSizes.sm,
    this.margin,
    this.fit = BoxFit.contain,
    this.applyImageRadius = true,
    this.borderRadius = TSizes.md,
  });

  final bool applyImageRadius;
  final BoxBorder? border;
  final double borderRadius;
  final BoxFit? fit;
  final String? image;
  final File? file;
  final ImageType imageType;
  final Color? overlayColor;
  final Color? backgroundColor;
  final Uint8List? memoryImage;
  final double width, height, padding;
  final double? margin;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      margin: margin != null ? EdgeInsets.all(margin!) : null,
      padding: EdgeInsets.all(padding),
      decoration: BoxDecoration(color: backgroundColor, border: border, borderRadius: BorderRadius.circular(borderRadius)),
      child: _buildImageWidget(),
    );
  }

  Widget _buildImageWidget() {
    Widget imageWidget;
    switch (imageType) {
      case ImageType.network:
        imageWidget = _buildNetworkImage();
      case ImageType.asset:
        imageWidget = _buildAssetImage();
      case ImageType.file:
        imageWidget = _buildFileImage();
      case ImageType.memory:
        imageWidget = _buildMemoryImage();
    }

    return ClipRRect(
      borderRadius: applyImageRadius ? BorderRadius.circular(borderRadius) : BorderRadius.zero,
      child: imageWidget,
    );
  }

  Widget _buildMemoryImage() {
    if (memoryImage != null) {
      return Image.memory(memoryImage!, fit: fit, color: overlayColor);
    }
    return Container();
  }

  Widget _buildNetworkImage() {
    if (image != null) {
      return Image.network(image!, fit: fit, color: overlayColor);
    }
    return Container();
  }

  Widget _buildFileImage() {
    if (file != null) {
      return Image.file(file!, fit: fit, color: overlayColor);
    }

    return Container();
  }

  Widget _buildAssetImage() {
    if (image != null) {
      return Image.asset(image!, fit: fit, color: overlayColor);
    }

    return Container();
  }
}
