import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rickandmorty/app/data/models/character_model.dart';
import 'package:rickandmorty/app/routes/app_pages.dart';
import 'package:rickandmorty/app/widgets/buttons/favourite_button_widget.dart';
import 'package:rickandmorty/app/widgets/text_character_card.dart';

class CardCharacter extends StatelessWidget {
  final Character character;
  const CardCharacter({
    Key? key,
    required this.character,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.toNamed(
        Routes.CHARACTER_DETAILS,
        arguments: character,
      ),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(10),
                bottomLeft: Radius.circular(10),
              ),
              child: Stack(
                children: [
                  Image.network(
                    character.image!,
                    width: 154,
                    height: 154,
                    fit: BoxFit.fill,
                  ),
                  const Positioned(
                    bottom: 10,
                    right: 10,
                    child: FavouriteButtonWidget(),
                  )
                ],
              ),
            ),
            Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextCharacterCard(
                    title: character.status! + " - " + character.species!,
                    subtitle: character.name!,
                    status: character.status!,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextCharacterCard(
                    title: "Last Know location:",
                    subtitle: character.location!.name!,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextCharacterCard(
                    title: "First seen in:",
                    subtitle: character.origin!.name!,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
