import 'package:flutter/widgets.dart';
import 'dart:typed_data';

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
      children: [
        Center(
          child: Container(
            width: width * 0.75,
            height: width * 0.75,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                fit: BoxFit.cover,
                image: MemoryImage(image),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
