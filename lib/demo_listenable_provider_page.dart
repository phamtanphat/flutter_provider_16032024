import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Counter extends ChangeNotifier {
  int count = 0;

  void increase() {
    count += 1;
    notifyListeners();
  }
}

class DemoListenableProviderPage extends StatefulWidget {
  const DemoListenableProviderPage({super.key});

  @override
  State<DemoListenableProviderPage> createState() => _DemoListenableProviderPageState();
}

class _DemoListenableProviderPageState extends State<DemoListenableProviderPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Demo listenable provider page"),
      ),
      body: Container(
        child: Center(
            child: ListenableProvider<Counter>(
                create: (context) => Counter(),
                child: CounterWidget()
            )
        ),
      ),
    );
  }
}

class CounterWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Consumer<Counter>(
           builder: (context, data, child) {
             return Text("Count ${data.count}");
           },
        ),
        ElevatedButton(
            onPressed: () {
              Counter counter = Provider.of(context, listen: false);
              counter.increase();
            },
            child: Text("Increase"))
      ],
    );
  }
}
