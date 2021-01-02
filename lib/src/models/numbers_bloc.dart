import 'dart:async';

import 'package:random_generator/src/models/random_generator.dart';
import 'package:rxdart/rxdart.dart';

class NumbersBloc {
  int _size = 6;
  int _maxValue = 100;
  bool _sorted = false;
  bool teste = true;

  final _numbers = BehaviorSubject<List<int>>();

  NumbersBloc(
      {int size = 6,
      int maxValue = 100,
      bool sort = false,
      bool initialize = false}) {
    _size = size;
    _maxValue = maxValue;
    _sorted = sort;

    if (initialize) {
      generate();
    }
  }

  Stream<List<int>> get numbers => _numbers.stream;

  generate() {
    var generator = DefaultRandomGenerator(
      size: _size,
      min: 1,
      max: _maxValue,
    );

    var items = generator.generate();

    if (_sorted) items.sort();

    _numbers.sink.add(items);
  }

  void setSize(int size) {
    _size = size;
  }

  void setMaxValue(int value) {
    _maxValue = value;
  }

  void dispose() {
    _numbers.close();
  }
}
