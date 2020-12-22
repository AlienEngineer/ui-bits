import 'package:flutter/widgets.dart';
import 'package:ui_bits/ui_bits.dart';
import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/foundation.dart';

class CarouselPageSample extends StatefulWidget {
  @override
  _CarouselPageState createState() => _CarouselPageState();
}

class _CarouselPageState extends State<CarouselPageSample> {
  Uint8List image;

  @override
  void initState() {
    super.initState();
    networkImageToByte("https://picsum.photos/200/200").then((value) {
      setState(() {
        image = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    var width = 200.0;
    var height = width * 1.25;
    return Carousel(
      children: Iterable<int>.generate(10)
          .where((_) => image != null)
          .map(
            (_) => BitCard(
              padding: BitEdgeInsetsOptions.none,
              children: [BitThumbnail(width: width, image: image)],
              width: width,
              height: height,
            ),
          )
          .toList(),
    );
  }

  Future<Uint8List> networkImageToByte(String path) async {
    HttpClient httpClient = HttpClient();
    var request = await httpClient.getUrl(Uri.parse(path));
    var response = await request.close();
    Uint8List bytes = await consolidateHttpClientResponseBytes(response);
    return bytes;
  }
}
