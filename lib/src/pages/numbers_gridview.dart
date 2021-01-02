
import 'package:flutter/widgets.dart';

class NumbersGridView extends StatelessWidget {
  final List<int> items;
  const NumbersGridView(this.items, {Key key}) : super(key: key);

  int get axisCount {
    var length = items.length;

    if (length <= 6) return 2;
    if (length <= 12) return 3;

    return 4;
  }

  @override
  Widget build(BuildContext context) => GridView.count(
        padding: EdgeInsets.all(20.0),
        crossAxisSpacing: 20.0,
        mainAxisSpacing: 20.0,
        crossAxisCount: axisCount,
        children: mapList(items),
      );

  List<Widget> mapList(List<int> items) {
    return items
        .map((n) => Container(
              child: Text(
                n.toString(),
                style: TextStyle(fontSize: 24.0, fontFamily: 'Cascadia Code'),
              ),
              alignment: Alignment.center,
            ))
        .toList();
  }
}
