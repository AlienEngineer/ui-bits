import 'package:flutter/widgets.dart';
import 'package:ui_bits/ui_bits.dart';

class CarouselPageSample extends StatefulWidget {
  @override
  _CarouselPageState createState() => _CarouselPageState();
}

class _CarouselPageState extends State<CarouselPageSample> {
  @override
  Widget build(BuildContext context) {
    var width = 200.0;
    var height = width * 1.25;
    return Carousel(
      children: [
        BitCard(child: Text('My Test 1'), width: width, height: height),
        BitCard(child: Text('My Test 2'), width: width, height: height),
        BitCard(child: Text('My Test 3'), width: width, height: height),
        BitCard(child: Text('My Test 4'), width: width, height: height),
        BitCard(child: Text('My Test 5'), width: width, height: height),
        BitCard(child: Text('My Test 6'), width: width, height: height),
        BitCard(child: Text('My Test 7'), width: width, height: height),
        BitCard(child: Text('My Test 8'), width: width, height: height),
        BitCard(child: Text('My Test 9'), width: width, height: height),
        BitCard(child: Text('My Test 10'), width: width, height: height),
        BitCard(child: Text('My Test 11'), width: width, height: height),
        BitCard(child: Text('My Test 12'), width: width, height: height),
        BitCard(child: Text('My Test 13'), width: width, height: height),
      ],
    );
  }
}
