import 'package:ui_bits/src/ui_bits_internal.dart';

class BitScrollable extends StatelessWidget {
  final List<Widget> children;

  const BitScrollable({Key key, this.children}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: children,
      ),
    );
  }
}
