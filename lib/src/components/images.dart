import 'dart:convert';
import 'dart:typed_data';

import 'package:ui_bits/src/ui_bits_internal.dart';

abstract class BitImage {
  Uint8List getBytes();
  String toBase64();
}

class BitImageBase64 implements BitImage {
  final String base64Image;

  BitImageBase64(this.base64Image);

  @override
  Uint8List getBytes() => base64.decode(base64Image);

  @override
  String toBase64() => base64Image;
}

class BitImageBytes implements BitImage {
  final Uint8List bytes;

  BitImageBytes(this.bytes);

  @override
  Uint8List getBytes() => bytes;

  @override
  String toBase64() {
    return base64.encode(bytes);
  }
}

class CircleImageWidget extends StatefulWidget {
  final double width;
  final Future<BitImage> image;

  const CircleImageWidget({
    Key key,
    @required this.width,
    @required this.image,
  }) : super(key: key);

  @override
  _CircleImageWidgetState createState() => _CircleImageWidgetState();
}

class _CircleImageWidgetState extends State<CircleImageWidget> {
  BitImage image;
  @override
  void initState() {
    super.initState();

    widget.image.then(
      (value) => setState(() {
        image = value;
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width * 0.75,
      height: widget.width * 0.75,
      decoration: buildBoxDecoration(),
    );
  }

  BoxDecoration buildBoxDecoration() {
    if (image == null) {
      return BoxDecoration();
    }

    return BoxDecoration(
      shape: BoxShape.circle,
      image: DecorationImage(
        fit: BoxFit.cover,
        image: MemoryImage(image.getBytes()),
      ),
    );
  }
}
