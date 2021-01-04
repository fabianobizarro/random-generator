import 'package:flutter/material.dart';

class NumberSelector extends StatefulWidget {
  NumberSelector({Key key}) : super(key: key);

  @override
  _NumberSelectorState createState() => _NumberSelectorState();
}

class _NumberSelectorState extends State<NumberSelector> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        FlatButton(
          onPressed: () {},
          child: Icon(Icons.arrow_downward),
        ),
        FlatButton(
          onPressed: () {},
          child: Icon(Icons.arrow_upward),
        ),
      ],
    );
  }
}
