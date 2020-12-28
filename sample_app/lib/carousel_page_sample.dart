import 'package:flutter/widgets.dart';
import 'package:ui_bits/ui_bits.dart';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'dart:typed_data';

class CarouselPageSample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BitScrollable(
      children: [
        Row(
          children: [
            BitThumbnail(
              width: 200.0,
              data: ThumbnailData(
                image: networkImageToByte("https://picsum.photos/200/200"),
                title: 'Arthur Morgan',
                subTitle: 'Engineer',
              ),
            ),
            BitThumbnail(
              width: 200.0,
              data: ThumbnailData(
                image: networkImageToByte("https://picsum.photos/200/200"),
                title: 'Arthur Morgan',
              ),
            ),
            BitThumbnail(
              width: 200.0,
              data: ThumbnailData(
                image: networkImageToByte("https://picsum.photos/200/200"),
                subTitle: 'Engineer',
              ),
            ),
            BitThumbnail(
              width: 200.0,
              data: ThumbnailData(
                image: networkImageToByte("https://picsum.photos/200/200"),
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
              .map(
                (name) => BitThumbnail(
                  width: 200.0,
                  data: ThumbnailData(
                    image: networkImageToByte("https://picsum.photos/200/200"),
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

  Future<BitImage> networkImageToByte(String path) async {
    HttpClient httpClient = HttpClient();
    var request = await httpClient.getUrl(Uri.parse(path));
    var response = await request.close();
    Uint8List bytes = await consolidateHttpClientResponseBytes(response);
    return BitImageBytes(bytes);
  }
}
