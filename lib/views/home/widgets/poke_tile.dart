import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:teste/models/pokemon_model.dart';
import 'package:teste/utils/theme.dart';

Widget pokeTile(
    {required Pokemon poke, required int pokeID, required double width}) {
  return Padding(
    padding: const EdgeInsets.only(left: 16, right: 16, top: 12),
    child: Material(
      borderRadius: BorderRadius.circular(12),
      elevation: 6,
      child: Container(
        height: 140,
        width: width * 0.3,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          gradient: const LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [AppColors.primaryGradientColor, AppColors.accentGradientColor],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset(
              "assets/img/pokemons/poke_$pokeID.gif",
              height: 100,
            ),
            Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(12),
                    bottomRight: Radius.circular(12),
                  ),
                  color: Colors.white),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    "#0$pokeID",
                    style: GoogleFonts.outfit(
                        fontWeight: FontWeight.w400,
                        fontSize: 16,
                        color: Colors.black),
                    maxLines: 2,
                    overflow: TextOverflow.fade,
                  ),
                  Text(
                    poke.name,
                    style: GoogleFonts.outfit(
                        fontWeight: FontWeight.w400,
                        fontSize: 16,
                        color: Colors.black),
                    maxLines: 2,
                    overflow: TextOverflow.fade,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
