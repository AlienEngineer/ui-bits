import 'package:flutter/widgets.dart';
import 'dart:typed_data';

import 'package:ui_bits/src/ui_bits_internal.dart';

class ThumbnailData {
  String title;
  String subTitle;
  Uint8List image;

  ThumbnailData({
    this.title,
    this.subTitle,
    this.image,
  });
}

class BitThumbnail extends StatelessWidget {
  final double width;
  final Uint8List image;
  final ThumbnailData data;

  const BitThumbnail({
    Key key,
    this.width,
    this.image,
    this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BitCard(
      padding: BitEdgeInsetsOptions.none,
      children: [
        if (data.image != null)
          BitSmallPadding(
            child: Center(
              child: CircleImageWidget(width: width, image: data.image),
            ),
          ),
        BitSmallPadding(
          options: BitEdgeInsetsOptions.combine([
            BitEdgeInsetsOptions.top,
            BitEdgeInsetsOptions.bottom,
            BitEdgeInsetsOptions.left,
            BitEdgeInsetsOptions.right,
          ]),
          child: Center(
            child: Column(
              children: [
                BitText(
                  data.title,
                  style: BitTextStyles.h5.asPrimary(context),
                ),
                BitText(
                  data.subTitle,
                  style: BitTextStyles.subtitle1,
                ),
              ],
            ),
          ),
        )
      ],
      width: width,
      height: width * 1.25,
    );
  }
}

class CircleImageWidget extends StatelessWidget {
  const CircleImageWidget({
    Key key,
    @required this.width,
    @required this.image,
  }) : super(key: key);

  final double width;
  final Uint8List image;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width * 0.75,
      height: width * 0.75,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        image: DecorationImage(
          fit: BoxFit.cover,
          image: MemoryImage(image),
        ),
      ),
    );
  }
}
