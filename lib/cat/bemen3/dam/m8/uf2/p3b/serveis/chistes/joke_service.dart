import 'dart:convert';
import 'dart:math';
import 'package:http/http.dart' as http;
import 'joke_model.dart';

class JokeService {
  final String apiUrl = "https://api.sampleapis.com/jokes/goodJokes";

  Future<Joke> fetchJoke() async {
    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      List<dynamic> jokes = jsonDecode(response.body);
      if (jokes.isNotEmpty) {
        // Generar un índice aleatorio
        final randomIndex = Random().nextInt(jokes.length);
        return Joke.fromJson(jokes[randomIndex]);
      }
    }
    throw Exception("Error al obtener el chiste");
  }
}
