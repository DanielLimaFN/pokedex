import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:teste/controllers/pokemon_controller.dart';
import 'package:teste/utils/theme.dart';
import 'package:teste/views/home/widgets/poke_tile.dart';
import 'package:teste/views/pokeinfo/pokedetails_view.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final PokemonController pokemonController = Get.find();
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        elevation: 0,
        toolbarHeight: 120,
        title: Image.asset("assets/img/pokemons/pokelogo.png",height: 80),
        centerTitle: true,
      ),
      body: Obx(() {
        if (pokemonController.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        } else {
          return GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 1.1,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
            ),
            itemCount: pokemonController.pokemonList.length,

            itemBuilder: (context, index) {
              var pokemon = pokemonController.pokemonList[index];
              int pokeID = index + 1;
              return InkWell(
                onTap: () {
                  Get.to(() => PokemonDetailsView(pokemon.name));
                },
                child: pokeTile(poke: pokemon, pokeID: pokeID,width: width),
              );
            },
          );
        }
      }),
    );
  }
}