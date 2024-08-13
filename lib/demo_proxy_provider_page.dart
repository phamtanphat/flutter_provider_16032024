import 'dart:math';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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

class DemoProxyproviderWidget extends StatefulWidget {

  @override
  State<DemoProxyproviderWidget> createState() => _DemoProxyproviderWidgetState();
}

class _DemoProxyproviderWidgetState extends State<DemoProxyproviderWidget> {

  ModelRepository? modelRepository;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Demo proxy provider"),
        ),
        body: MultiProvider(
          providers: [
            Provider(create: (context) => Counter(count: 0)),
            ProxyProvider<Counter, CounterManager>(
                create: (context) => CounterManager(),
                update: (context, counter, counterManager) {
                  counterManager?.updateCounter(counter: counter);
                  return counterManager ?? CounterManager();
                }
            ),
            ProxyProvider<CounterManager, ModelRepository>(
                create: (context) => ModelRepository(),
                update: (context, counterManager, modelRepository) {
                  modelRepository?.updateCounterManager(counterManager: counterManager);
                  return modelRepository ?? ModelRepository();
                }
            )
          ],
          child: ProxyContainerWidget(),
        )
    );
  }
}

class ProxyContainerWidget extends StatefulWidget {
  const ProxyContainerWidget({Key? key}) : super(key: key);

  @override
  State<ProxyContainerWidget> createState() => _ProxyContainerWidgetState();
}

class _ProxyContainerWidgetState extends State<ProxyContainerWidget> {

  ModelRepository? modelRepository;
  Counter? counter;

  @override
  void initState() {
    super.initState();
    modelRepository = context.read();
    counter = context.read();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ElevatedButton(
        onPressed: () {
          modelRepository?.calculateIncrease();
          print(counter?.count.toString());
        },
        child: Consumer<ModelRepository> (
          builder: (context, repository, child) {
            return Text("Increase ");
          },
        ),
      ),
    );
  }
}