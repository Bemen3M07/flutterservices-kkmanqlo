import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'joke_provider.dart';

class JokePage extends StatelessWidget {
const JokePage({super.key});

  @override
  Widget build(BuildContext context) {
    final jokeProvider = Provider.of<JokeProvider>(context);

    return Scaffold(
      appBar: AppBar(title: const Text("Chistes Random")),
      body: Center(
        child: jokeProvider.isLoading
            ? const CircularProgressIndicator() // Muestra un loader mientras carga
            : jokeProvider.currentJoke != null
                ? Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          jokeProvider.currentJoke!.setup,
                          textAlign: TextAlign.center,
                          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 20),
                        Text(
                          jokeProvider.currentJoke!.punchline,
                          textAlign: TextAlign.center,
                          style: const TextStyle(fontSize: 18),
                        ),
                      ],
                    ),
                  )
                : const Text("Presiona el botón para obtener un chiste"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => jokeProvider.loadJoke(),
        child: const Icon(Icons.refresh),
      ),
    );
  }
}
