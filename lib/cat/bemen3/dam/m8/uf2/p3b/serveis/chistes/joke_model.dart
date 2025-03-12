class Joke {
  final String setup;
  final String punchline;

  Joke({required this.setup, required this.punchline});

  // Convertimos JSON en un objeto Joke
  factory Joke.fromJson(Map<String, dynamic> json) {
    return Joke(
      setup: json['setup'] ?? "No joke setup",
      punchline: json['punchline'] ?? "No punchline",
    );
  }
}
