import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'car_provider.dart';
import 'car_model.dart';

class CarListPage extends StatelessWidget {
  const CarListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Lista de Coches')),
      body: Consumer<CarProvider>(
        builder: (context, carProvider, child) {
          if (carProvider.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          if (carProvider.errorMessage.isNotEmpty) {
            return Center(child: Text(carProvider.errorMessage));
          }
          return ListView.builder(
            itemCount: carProvider.cars.length,
            itemBuilder: (context, index) {
              CarsModel car = carProvider.cars[index];
              return ListTile(
                title: Text(car.make),
                subtitle: Text('${car.model} - ${car.year}'),
              );
            },
          );
        },
      ),
    );
  }
}
