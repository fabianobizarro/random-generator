import 'dart:math';

abstract class RandomGenerator {
  final int _minValue;
  final int _maxValue;
  final int _size;

  const RandomGenerator(this._size, this._minValue, this._maxValue);

  int get size => _size;
  int get minValue => _minValue;
  int get maxValue => _maxValue;

  List<int> generate();
}

class DefaultRandomGenerator extends RandomGenerator {
  final Random _random = Random.secure();

  DefaultRandomGenerator({int size = 6, int min = 1, int max = 100})
      : assert(size >= 1),
        assert(min < max),
        super(size, min, max);

  @override
  List<int> generate() {
    var values = <int>[];

    for (var i = 0; i < size; i++) {
      values.add(_random.nextInt(maxValue + 1));
    }
    
    return values;
  }
}
