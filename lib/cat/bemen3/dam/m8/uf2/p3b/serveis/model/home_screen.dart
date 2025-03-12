import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'car_provider.dart';
import 'car_list_page.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Lista de Coches')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // Cargar coches
            context.read<CarProvider>().fetchCars();
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const CarListPage()),
            );
          },
          child: const Text('Cargar Coches'),
        ),
      ),
    );
  }
}
