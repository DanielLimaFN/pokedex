import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:teste/models/pokeinfo_model.dart';
import '../models/pokemon_model.dart';
import '../services/api_service.dart';

class PokemonController extends GetxController {
  var isLoading = true.obs;
  var pokemonList = <Pokemon>[].obs;
  var pokemonDetails = Rxn<Pokeinfo>();

  final ApiService apiService;

  PokemonController({required this.apiService});

  @override
  void onInit() {
    super.onInit();
    fetchPokemon();
  }

  void fetchPokemon() async {
    isLoading(true);
    try {
      var response = await apiService.fetchPokemonList();
      if (response != null) {
        var pokemonResponse = PokemonResponse.fromJson(response);
        pokemonList.value = pokemonResponse.results;
      }
    } catch (e) {
      debugPrint('Erro ao carregar Pokémons: $e');
    } finally {
      isLoading(false);
    }
  }

  void fetchPokemonDetails(String pokemonName) async {
    try {
      var response = await apiService.fetchPokemonDetails(pokemonName);
      if (response != null) {
        pokemonDetails.value = Pokeinfo.fromJson(response);
      }
    } catch (e) {
      debugPrint('Erro ao carregar detalhes do Pokémon: $e');
    }
  }
}