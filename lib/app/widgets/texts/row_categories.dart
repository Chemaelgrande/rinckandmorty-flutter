import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rickandmorty/app/modules/character/controllers/character_controller.dart';
import 'package:rickandmorty/app/theme/app_colors.dart';
import 'package:rickandmorty/app/theme/app_fonts.dart';

class RowCategories extends StatelessWidget {
  final List<String> categories;
  final String category;
  const RowCategories({
    Key? key,
    required this.categories,
    required this.category,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CharacterController characterController = Get.find();
    return SizedBox(
      height: 50,
      child: ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount: categories.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(right: 10.0),
              child: Obx(
                () => ElevatedButton(
                  onPressed: () async {
                    if (category == "status") {
                      characterController.statusSearchCharacter.value =
                          categories[index];
                    }
                    if (category == "gender") {
                      characterController.genderSearchCharacter.value =
                          categories[index];
                    }
                    await characterController
                        .getAllSearchCharactersByCategory();
                  },
                  style: ButtonStyle(
                      backgroundColor: (characterController
                                      .statusSearchCharacter.value ==
                                  categories[index] ||
                              characterController.genderSearchCharacter.value ==
                                  categories[index])
                          ? MaterialStateProperty.all(AppColors.COLOR_BLUE)
                          : MaterialStateProperty.all(AppColors.COLOR_GREY)),
                  child: Text(
                    (categories[index] == "unknown1" ||
                            categories[index] == "unknown2")
                        ? "unknown"
                        : categories[index],
                    style: TEXT_THEME_WHITE.bodyText2,
                  ),
                ),
              ),
            );
          }),
    );
  }
}
