import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:rickandmorty/app/theme/app_colors.dart';
import 'package:rickandmorty/app/theme/app_fonts.dart';
import 'package:rickandmorty/app/widgets/background_image.dart';
import 'package:rickandmorty/app/widgets/buttons/button_search_widget.dart';
import 'package:rickandmorty/app/widgets/buttons/favourite_button_widget.dart';
import 'package:rickandmorty/app/widgets/buttons/popupmenu_button_widget.dart';

import '../controllers/character_controller.dart';

class CharacterView extends GetView<CharacterController> {
  const CharacterView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        const BackgroundImage(),
        ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(40),
              child: Image.asset(
                "assets/images/rickandmorty-letters.png",
              ),
            ),
            Container(
              color: AppColors.COLOR_BLACK_GREY,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
              child: Row(
                children: const [
                  ButtonSearchWidget(),
                  Spacer(),
                  PopupmenuButtonWidget()
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
              color: AppColors.COLOR_WHITE,
              child: Row(
                children: [
                  Text(
                    "Mostrar favoritos:",
                    style: TEXT_THEME_BLACK.headline1,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  const FavouriteButtonWidget()
                ],
              ),
            ),
            ListView.builder(
              shrinkWrap: true,
              itemCount: 4,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return Container(
                  height: 200,
                  color: Colors.red,
                );
              },
            ),
            Container(
              color: Colors.transparent,
              height: 100,
            )
          ],
        ),
      ],
    ));
  }
}
