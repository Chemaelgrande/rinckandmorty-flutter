import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:rickandmorty/app/routes/app_pages.dart';
import 'package:rickandmorty/app/theme/app_fonts.dart';
import 'package:rickandmorty/app/widgets/layout/background_image.dart';
import 'package:rickandmorty/app/widgets/buttons/button_widget.dart';

class HomeView extends GetView {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const BackgroundImage(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                //BACKGROUND IMAGE
                Image.asset(
                  "assets/images/rickandmorty-letters.png",
                ),

                //INFORMATION PAGE
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
                //NAVIGATION BUTTON
                ButtonWidget(
                  text: "Continuar",
                  onPressed: () {
                    Get.offNamed(Routes.CHARACTER);
                  },
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
