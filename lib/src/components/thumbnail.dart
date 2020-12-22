import 'package:flutter/widgets.dart';
import 'dart:typed_data';

import 'package:ui_bits/src/ui_bits_internal.dart';

class BitThumbnail extends StatelessWidget {
  final double width;
  final Uint8List image;

  const BitThumbnail({
    Key key,
    this.width,
    this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BitSmallPadding(
          child: Center(child: CircleImageWidget(width: width, image: image)),
        ),
        BitSmallPadding(
          options: BitEdgeInsetsOptions.combine([
            BitEdgeInsetsOptions.top,
            BitEdgeInsetsOptions.bottom,
            BitEdgeInsetsOptions.left,
            BitEdgeInsetsOptions.right,
          ]),
          child: Text('Ricardo Nunes'),
        )
      ],
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
