import 'package:flutter/material.dart';
import 'car_http_service.dart';
import 'car_model.dart';

class CarProvider with ChangeNotifier {
  List<CarsModel> _cars = [];
  bool _isLoading = false;
  String _errorMessage = '';

  List<CarsModel> get cars => _cars;
  bool get isLoading => _isLoading;
  String get errorMessage => _errorMessage;

  Future<void> fetchCars() async {
    _isLoading = true;
    notifyListeners();

    try {
      _cars = await CarHttpService().getCars();
      _errorMessage = '';
    } catch (e) {
      _errorMessage = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
