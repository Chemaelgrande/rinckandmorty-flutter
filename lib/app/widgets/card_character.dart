import 'package:flutter/material.dart';
import 'package:rickandmorty/app/widgets/buttons/favourite_button_widget.dart';
import 'package:rickandmorty/app/widgets/text_character_card.dart';

class CardCharacter extends StatelessWidget {
  const CardCharacter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
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
                Image.asset(
                  "assets/images/other-image-rickandmorty.jpeg",
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
              children: const [
                TextCharacterCard(
                  title: "Title",
                  subtitle: "Never Ricking Morty",
                ),
                SizedBox(
                  height: 10,
                ),
                TextCharacterCard(
                  title: "Title",
                  subtitle: "Subtitle",
                ),
                SizedBox(
                  height: 10,
                ),
                TextCharacterCard(
                  title: "Title",
                  subtitle: "Subtitle",
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
