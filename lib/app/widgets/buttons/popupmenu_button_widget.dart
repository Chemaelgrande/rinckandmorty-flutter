import 'package:flutter/material.dart';
import 'package:rickandmorty/app/theme/app_colors.dart';

class PopupmenuButtonWidget extends StatelessWidget {
  const PopupmenuButtonWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<String>(
      icon: Icon(
        Icons.menu,
        color: AppColors.COLOR_WHITE,
      ),
      onSelected: (String result) {
        switch (result) {
          case 'filter1':
            print('filter 1 clicked');
            break;
          case 'filter2':
            print('filter 2 clicked');
            break;
          case 'clearFilters':
            print('Clear filters');
            break;
          default:
        }
      },
      itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
        const PopupMenuItem<String>(
          value: 'filter1',
          child: Text('Filter 1'),
        ),
        const PopupMenuItem<String>(
          value: 'filter2',
          child: Text('Filter 2'),
        ),
        const PopupMenuItem<String>(
          value: 'clearFilters',
          child: Text('Clear filters'),
        ),
      ],
    );
  }
}
