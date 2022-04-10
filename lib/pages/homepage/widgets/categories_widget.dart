import 'package:animal/models/enums/pet_enum.dart';
import 'package:flutter/material.dart';

typedef VoidCallBack = void Function(int index);

class CategoriesWidget extends StatefulWidget {
  final VoidCallBack changeCategory;
  CategoriesWidget(this.changeCategory, {Key? key}) : super(key: key);
  @override
  _CategoriesWidgetState createState() => _CategoriesWidgetState();
}

class _CategoriesWidgetState extends State<CategoriesWidget> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      scrollDirection: Axis.horizontal,
      itemCount: PetEnum.values.length,
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            widget.changeCategory(index);
          },
          child: Card(
            elevation: 6,
            shape: CircleBorder(),
            child: Container(
              alignment: Alignment.center,
              width: 70,
              child: Text(
                PetEnum.values[index].name,
                style: TextStyle(fontSize: 15),
              ),
            ),
          ),
        );
      },
    );
  }
}
