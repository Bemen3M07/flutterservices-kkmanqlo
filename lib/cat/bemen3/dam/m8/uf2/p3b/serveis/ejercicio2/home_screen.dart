import 'package:empty/cat/bemen3/dam/m8/uf2/p3b/serveis/ejercicio2/counter_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'page1.dart';
import 'page2.dart';
import 'page3.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    super.key,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  final List<Widget> _pages = <Widget>[
    const Page1(),
    const Page2(),
    const Page3(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Material App Bar'),
        actions: [
          TextButton(
              onPressed: null,
              child: Text(
                context.watch<CounterProvider>().counter.toString(),
                style: const TextStyle(color: Colors.purple),
              ))
        ],
      ),
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (int index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Page 1',
          ), // BottomNavigationBarItem
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: 'Page 2',
          ), // BottomNavigationBarItem
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: 'Page 3',
          ), // BottomNavigationBarItem
        ],
      ),
    );
  }
}
