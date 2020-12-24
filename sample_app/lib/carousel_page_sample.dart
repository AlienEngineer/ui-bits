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
    return BitScrollable(
      children: [
        Row(
          children: [
            BitThumbnail(
              width: 200.0,
              data: ThumbnailData(
                image: image,
                title: 'Arthur Morgan',
                subTitle: 'Engineer',
              ),
            ),
            BitThumbnail(
              width: 200.0,
              data: ThumbnailData(
                image: image,
                title: 'Arthur Morgan',
              ),
            ),
            BitThumbnail(
              width: 200.0,
              data: ThumbnailData(
                image: image,
                subTitle: 'Engineer',
              ),
            ),
            BitThumbnail(
              width: 200.0,
              data: ThumbnailData(
                image: image,
              ),
            ),
          ],
        ),
        SizedBox(height: context.sizes.medium),
        Carousel(
          children: [
            'Dutch van der Linde',
            'Arthur Morgan',
            'John Marston',
            'Abigail Roberts',
            'Bill Williamson',
            'Charles Smith',
            'Hosea Matthews',
            'Jack Marston',
            'Javier Escuella',
            'Josiah Trelawny',
            'Karen Jones',
            'Kieran Duffy',
            'Lenny Summers',
            'Leopold Strauss',
            'Mary-Beth Gaskill',
            'Micah Bell',
            'Molly O\'Shea',
            'Mr. Pearson',
            'Reverend Swanson',
            'Sadie Adler',
            'Sean MacGuire',
            'Susan Grimshaw',
            'Tilly Jackson',
            'Uncle',
          ]
              .where((_) => image != null)
              .map(
                (name) => BitThumbnail(
                  width: 200.0,
                  data: ThumbnailData(
                    image: image,
                    title: name,
                    subTitle: 'Engineer',
                  ),
                ),
              )
              .toList(),
        )
      ],
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
