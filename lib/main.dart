import 'package:flutter/material.dart';
import 'package:flutter_provider_16032024/demo_listenable_provider_page.dart';
import 'package:flutter_provider_16032024/demo_provider_page.dart';
import 'package:flutter_provider_16032024/demo_value_listable_provider_page.dart';

import 'demo_proxy_provider_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: "screen3",
      routes: {
        "screen1": (context) => DemoListenableProviderPage(),
        "screen2": (context) => DemoValueListenableProviderPage(),
        "screen3": (context) => DemoProxyproviderWidget(),
      },
    );
  }
}