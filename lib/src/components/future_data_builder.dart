import 'package:ui_bits/src/ui_bits_internal.dart';

class BitFutureDataBuilder<T> extends StatelessWidget {
  final Future<T> future;
  final Widget Function(T) onData;

  const BitFutureDataBuilder({
    Key key,
    this.future,
    this.onData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<T>(
      future: future ?? Future<T>.value(null),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return onData.call(snapshot.data) ?? Container();
        }

        return Container(
          child: Text('no data'),
        );
      },
    );
  }
}
