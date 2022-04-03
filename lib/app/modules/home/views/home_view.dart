import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:rickandmorty/app/theme/app_colors.dart';
import 'package:rickandmorty/app/theme/app_fonts.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            color: Colors.black,
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Opacity(
              opacity: 0.2,
              child: Image.asset(
                "assets/images/space-image-rickandmorty.png",
                fit: BoxFit.fitHeight,
                colorBlendMode: BlendMode.modulate,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Image.asset(
                  "assets/images/rickandmorty-letters.png",
                ),
                Column(
                  children: [
                    Text(
                      "Bienvenido \na Rick and Morty",
                      style: TEXT_THEME_WHITE.headline1,
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      "En esta prueba analizaremos la capacidad de construir la app en base a sus conocimientos y habilidades de desarrollo mediante el análisis del código y la reproducción del siguiente diseño.",
                      style: TEXT_THEME_WHITE.bodyText2,
                      textAlign: TextAlign.center,
                    )
                  ],
                ),
                ElevatedButton(
                  child: const Padding(
                    padding: EdgeInsets.fromLTRB(45, 10.0, 45, 10.0),
                    child: Text(
                      'Continuar',
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                      elevation: 0.0,
                      primary: AppColors.COLOR_BLUE,
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(40))),
                      textStyle: const TextStyle(fontSize: 18)),
                  onPressed: () {},
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
