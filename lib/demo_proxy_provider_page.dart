import 'dart:math';

class Counter { // Entity
  var count;

  Counter({required this.count});
}

class CounterManager { // Use case
  Counter? counter;

  void updateCounter({required Counter counter}) {
    this.counter = counter;
  }

  void increase({int step = 1}) {
    counter?.count += step;
  }

  void decrease({int step = 1}) {
    counter?.count -= step;
  }

  void reset() {
    counter?.count = 0;
  }
}

class ModelRepository { // Controller
  CounterManager? counterManager;

  void updateCounterManager({required CounterManager counterManager}) {
    this.counterManager = counterManager;
  }

  int getRandom() => Random().nextInt(100);

  void calculateIncrease() {
    var number = getRandom();
    if (number % 2 == 0) {
      counterManager?.increase(step: number);
    }
  }

  void calculateDecrease() {
    var number = getRandom();
    if (number % 2 == 0) {
      counterManager?.decrease(step: number);
    }
  }

  void calculateReset() {
    counterManager?.reset();
  }
}