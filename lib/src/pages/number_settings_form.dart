import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_number_picker/flutter_number_picker.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:provider/provider.dart';
import 'package:random_generator/src/models/numbers_bloc.dart';

import 'number_selector.dart';

class NumberSettingsForm extends StatelessWidget {
  const NumberSettingsForm({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of<NumbersBloc>(context);

    return Container(
      height: 600,
      child: Column(children: [
        ordernarNumberosSwitcher(bloc),
        slider(bloc),
      ]),
    );
  }

  Widget ordernarNumberosSwitcher(NumbersBloc bloc) {
    return ListTile(
        title: const Text("Ordenar números"),
        trailing: StreamBuilder(
          stream: bloc.sorted,
          builder: (context, snapshot) => Switch(
            value: snapshot.data ?? false,
            onChanged: (newValue) => bloc.sortNumbers(newValue),
          ),
        ));
  }

  Widget slider(NumbersBloc bloc) {
    return ListTile(
      title: const Text('Quantidade de números'),
      trailing: StreamBuilder(
        stream: bloc.size,
        builder: (context, snap) {
          return NumberPicker.integer(
            initialValue: snap.data ?? 1,
            minValue: 1,
            maxValue: 100,
            onChanged: (n) {
              print(n);
              bloc.setSize(n);
            },
          );
        },
      ),
    );

    // return StreamBuilder(
    //   stream: bloc.size,
    //   builder: (context, snapshot) => Slider(
    //     value: (snapshot.data ?? 1) * 1.0,
    //     max: 100,
    //     min: 1,
    //     label: 'Quantidade de números',
    //     onChanged: (n) {
    //       print(n);
    //       bloc.setSize(n.round());
    //     },
    //   ),
    // );
  }
}
