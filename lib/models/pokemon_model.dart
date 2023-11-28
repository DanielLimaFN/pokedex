class PokemonResponse {
  final int count;
  final String? next;
  final String? previous;
  final List<Pokemon> results;

  PokemonResponse({
    required this.count,
    this.next,
    this.previous,
    required this.results,
  });

  factory PokemonResponse.fromJson(Map<String, dynamic> json) => PokemonResponse(
    count: json['count'],
    next: json['next'],
    previous: json['previous'],
    results: List<Pokemon>.from(json['results'].map((x) => Pokemon.fromJson(x))),
  );
}

class Pokemon {
  final String name;
  final String url;

  Pokemon({
    required this.name,
    required this.url,
  });

  factory Pokemon.fromJson(Map<String, dynamic> json) => Pokemon(
    name: json['name'],
    url: json['url'],
  );
}