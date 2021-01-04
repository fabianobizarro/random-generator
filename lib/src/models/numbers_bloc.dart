import 'dart:async';

import 'package:random_generator/src/models/random_generator.dart';
import 'package:rxdart/rxdart.dart';

class NumbersBloc {
  final _numbers = BehaviorSubject<List<int>>();
  final _size = BehaviorSubject<int>();
  final _sorted = BehaviorSubject<bool>();
  final _max = BehaviorSubject<int>();

  NumbersBloc(
      {int size = 6,
      int maxValue = 100,
      bool sort = false,
      bool initialize = false}) {
    setSize(size);
    setMaxValue(maxValue);
    sortNumbers(sort);

    if (initialize) {
      generate();
    }
  }

  Stream<List<int>> get numbers =>
      CombineLatestStream([_numbers, _size, _sorted, _max], combiner);

  Stream<int> get size => _size.stream;
  Stream<int> get maxValue => _max.stream;
  Stream<bool> get sorted => _sorted.stream;

  List<int> combiner(List<Object> values) {
    print(values);
    var size = values[1];
    var sorted = values[2];
    var max = values[3];

    var numbers = DefaultRandomGenerator(
      max: max,
      min: 1,
      size: size,
    ).generate();

    if (sorted) numbers.sort();

    return numbers;
  }

  void generate() => _numbers.sink.add([]);

  void setSize(int size) => _size.sink.add(size);

  void setMaxValue(int value) => _max.sink.add(value);

  void sortNumbers(bool value) {
    print(value);
    _sorted.sink.add(value);
  }

  void dispose() {
    _numbers.close();
    _max.close();
    _size.close();
    _sorted.close();
  }
}
