import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DemoProviderPage extends StatefulWidget {
  const DemoProviderPage({super.key});

  @override
  State<DemoProviderPage> createState() => _DemoProviderPageState();
}

class _DemoProviderPageState extends State<DemoProviderPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Demo provider page"),
      ),
      body: Center(
        child: Container(
          child: Provider<String>(
              create: (context) => "Hello" ,
              child: ChildWidget()
          ),
        ),
      ),
    );
  }
}

class ChildWidget extends StatelessWidget {
  const ChildWidget({super.key});

  @override
  Widget build(BuildContext context) {
    // 1 Lay du lieu thong qua lop
    String text = Provider.of(context);
    return Column(
      children: [
        Text("Child widget $text")
      ],
    );
  }
}

