import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class ApiService {
  final Dio _dio = Dio();

  ApiService() {
    _dio.options.baseUrl = 'https://pokeapi.co/api/v2/';
    _dio.options.connectTimeout = const Duration(seconds: 5);
    _dio.options.receiveTimeout = const Duration(seconds: 5);
  }

  Future<dynamic> fetchPokemonList() async {
    try {
      Response response = await _dio.get('pokemon/?limit=706');
      return response.data;
    } catch (error) {
      debugPrint('Erro ao realizar a requisição: $error');
      return null;
    }
  }

  Future<dynamic> fetchPokemonDetails(String pokemonName) async {
    try {
      Response response = await _dio.get('pokemon/$pokemonName');
      return response.data;
    } catch (error) {
      debugPrint('Erro ao realizar a requisição: $error');
      return null;
    }
  }
}