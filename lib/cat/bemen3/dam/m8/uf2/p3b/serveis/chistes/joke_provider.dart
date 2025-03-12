import 'package:flutter/material.dart';
import 'joke_model.dart';
import 'joke_service.dart';

class JokeProvider extends ChangeNotifier {
  final JokeService _jokeService = JokeService();
  Joke? _currentJoke;
  bool _isLoading = false;

  Joke? get currentJoke => _currentJoke;
  bool get isLoading => _isLoading;

  Future<void> loadJoke() async {
    _isLoading = true;
    notifyListeners();

    try {
      _currentJoke = await _jokeService.fetchJoke();
    } catch (e) {
      _currentJoke = Joke(setup: "Error", punchline: "No se pudo obtener el chiste");
    }

    _isLoading = false;
    notifyListeners();
  }
}
