import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lazy_load_scrollview/lazy_load_scrollview.dart';
import 'package:rickandmorty/app/routes/app_pages.dart';
import 'package:rickandmorty/app/theme/app_colors.dart';
import 'package:rickandmorty/app/theme/app_fonts.dart';
import 'package:rickandmorty/app/widgets/buttons/favourite_buttons/list_favourite_button_widget.dart';
import 'package:rickandmorty/app/widgets/layout/background_image.dart';
import 'package:rickandmorty/app/widgets/buttons/button_search_widget.dart';
import 'package:rickandmorty/app/widgets/buttons/popupmenu_button_widget.dart';
import 'package:rickandmorty/app/widgets/cards/card_character.dart';
import 'package:rickandmorty/app/widgets/texts/row_categories.dart';
import '../controllers/character_controller.dart';

class CharacterView extends GetView<CharacterController> {
  const CharacterView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const BackgroundImage(),
          //LOAD CARDS BY LAZYLOAD
          Obx(
            () => LazyLoadScrollView(
              onEndOfPage: controller.next,
              isLoading: controller.isLoading.value,
              child: ListView(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(40),
                    child: Image.asset(
                      "assets/images/rickandmorty-letters.png",
                    ),
                  ),
                  Container(
                    color: AppColors.COLOR_BLACK_GREY,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 24),
                    child: Row(
                      children: const [
                        //FILTERS SECTION
                        ButtonSearchWidget(),
                        Spacer(),
                        PopupmenuButtonWidget()
                      ],
                    ),
                  ),
                  //FILTERS BY CATEGORIES
                  Container(
                    color: AppColors.COLOR_WHITE,
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        RowCategories(
                          categories: [
                            "alive",
                            "dead",
                            "unknown1",
                          ],
                          category: "status",
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        RowCategories(
                          categories: [
                            "female",
                            "male",
                            "genderless",
                            "unknown2"
                          ],
                          category: "gender",
                        ),
                      ],
                    ),
                  ),

                  //SHOW CARDS
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 40),
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
                        const ListFavouriteButton()
                      ],
                    ),
                  ),
                  Container(
                    color: AppColors.COLOR_WHITE,
                    padding: const EdgeInsets.only(
                      left: 15,
                      right: 15,
                      top: 15,
                      bottom: 60,
                    ),
                    child: (controller.listIsFavorite.value == true &&
                            controller.favouritesCharacters.isEmpty)
                        ? Column(
                            children: [
                              Text(
                                'Ups',
                                style: TEXT_THEME_BLACK.headline3,
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Text(
                                "Parece que tu viaje\n ha terminado",
                                style: TEXT_THEME_BLACK.headline1,
                                textAlign: TextAlign.center,
                              )
                            ],
                          )
                        : ListView.builder(
                            shrinkWrap: true,
                            itemCount: (controller.listIsFavorite.value == true)
                                ? controller.favouritesCharacters.length
                                : (controller.searchCharacters.isEmpty)
                                    ? controller.characters.length
                                    : controller.searchCharacters.length,
                            physics: const NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) {
                              return CardCharacter(
                                onTap: () {
                                  CharacterController characterController =
                                      Get.find();

                                  characterController.getInteresantCharacters();
                                  Get.toNamed(
                                    Routes.CHARACTER_DETAILS,
                                    arguments: (controller
                                                .listIsFavorite.value ==
                                            true)
                                        ? controller.favouritesCharacters[index]
                                        : (controller.searchCharacters.isEmpty)
                                            ? controller.characters[index]
                                            : controller
                                                .searchCharacters[index],
                                  );
                                },
                                character: (controller.listIsFavorite.value ==
                                        true)
                                    ? controller.favouritesCharacters[index]
                                    : (controller.searchCharacters.isEmpty)
                                        ? controller.characters[index]
                                        : controller.searchCharacters[index],
                              );
                            },
                          ),
                  ),
                  Container(
                    color: Colors.transparent,
                    height: 100,
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
