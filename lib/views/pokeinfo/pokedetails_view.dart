import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:teste/controllers/pokemon_controller.dart';
import 'package:teste/utils/theme.dart';

class PokemonDetailsView extends StatelessWidget {
  final String pokemonName;

  const PokemonDetailsView(this.pokemonName, {super.key});

  @override
  Widget build(BuildContext context) {
    final PokemonController pokemonController = Get.find();

    pokemonController.fetchPokemonDetails(pokemonName);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Voltar",
          style: GoogleFonts.outfit(
              fontWeight: FontWeight.w600, fontSize: 18, color: Colors.black),
        ),
      ),
      body: Obx(() {
        var pokeInfo = pokemonController.pokemonDetails.value;
        if (pokeInfo == null) {
          return const Center(child: CircularProgressIndicator());
        } else {
          return Column(
            children: [
              Expanded(
                flex: 1,
                child: SizedBox(
                  width: double.infinity,
                  child: Image.asset(
                      "assets/img/pokemons/poke_${pokeInfo.id}.gif",
                      height: 250),
                ),
              ),
              Expanded(
                flex: 2,
                child: Container(
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(12),
                      topRight: Radius.circular(12),
                    ),
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        AppColors.secondaryGradientColor,
                        AppColors.secondaryGradientColor
                      ],
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(18),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(
                          child: Text(
                            pokemonName,
                            style: GoogleFonts.outfit(
                                fontWeight: FontWeight.w600,
                                fontSize: 28,
                                color: Colors.white),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              "ID: #0${pokeInfo.id}",
                              style: GoogleFonts.outfit(
                                  fontWeight: FontWeight.w300,
                                  fontSize: 16,
                                  color: Colors.white),
                            ),
                            Text(
                              "Categoria: ${pokeInfo.types?[0].type?.name}",
                              style: GoogleFonts.outfit(
                                  fontWeight: FontWeight.w300,
                                  fontSize: 16,
                                  color: Colors.white),
                            ),
                            Text(
                              "Altura: ${pokeInfo.height}",
                              style: GoogleFonts.outfit(
                                  fontWeight: FontWeight.w300,
                                  fontSize: 16,
                                  color: Colors.white),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 24,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              "Habilidade 1: ${pokeInfo.abilities?[0].ability?.name}",
                              style: GoogleFonts.outfit(
                                  fontWeight: FontWeight.w300,
                                  fontSize: 16,
                                  color: Colors.white),
                            ),
                            Text(
                              "Habilidade 2: ${pokeInfo.abilities?[1].ability?.name}",
                              style: GoogleFonts.outfit(
                                  fontWeight: FontWeight.w300,
                                  fontSize: 16,
                                  color: Colors.white),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          );
        }
      }),
    );
  }
}
