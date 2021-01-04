import 'package:flutter/material.dart';
import 'package:random_generator/src/models/numbers_bloc.dart';
import 'package:random_generator/src/pages/number_settings_form.dart';

import 'numbers_gridview.dart';

class HomePage extends StatelessWidget {
  final bloc = NumbersBloc(initialize: true, size: 60);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Numbers"),
          actions: [
            IconButton(
              icon: Icon(Icons.settings),
              onPressed: () async {
                await showModalBottomSheet(
                    context: context,
                    builder: (ctx) => NumberSettingsForm(),
                    barrierColor: Colors.grey[10],
                    enableDrag: true);
              },
            ),
          ],
        ),
        body: StreamBuilder(
          stream: bloc.numbers,
          builder: (context, snapshot) {
            return snapshot.hasData
                ? NumbersGridView(snapshot.data)
                : Placeholder();
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            bloc.generate();
          },
          tooltip: "Gerar novo",
          child: const Icon(Icons.autorenew_outlined),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: BottomAppBar(
          shape: const CircularNotchedRectangle(),
          child: Container(
            height: 50.0,
          ),
        ),
      ),
    );
  }
}
