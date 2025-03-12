import 'package:empty/cat/bemen3/dam/m8/uf2/p3b/serveis/ejercicio2/counter_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Page2 extends StatefulWidget {
  const Page2({super.key});

  @override
  State<Page2> createState() => _Page2State();
}

class _Page2State extends State<Page2> {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Text(context.watch<CounterProvider>().counter.toString(),
            style: const TextStyle(fontSize: 50)));
  }
}
