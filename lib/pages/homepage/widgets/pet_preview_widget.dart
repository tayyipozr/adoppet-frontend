import 'package:animal/models/pets/pet.dart';
import 'package:animal/pages/petdetailpage/pet_detail_page.dart';
import 'package:flutter/material.dart';

class PetPreview extends StatefulWidget {
  final List<Pet> pets;

  PetPreview({Key? key, required this.pets}) : super(key: key);

  @override
  _PetPreviewState createState() => _PetPreviewState();
}

class _PetPreviewState extends State<PetPreview> {
  int _index = 0;

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      itemCount: widget.pets.length,
      controller: PageController(viewportFraction: 0.7),
      onPageChanged: (int index) => setState(() => _index = index),
      itemBuilder: (_, i) {
        print("Pet Preview: " + widget.pets[_index].category! + widget.pets[_index].id.toString());
        return Transform.scale(
          scale: i == _index ? 1 : 0.9,
          child: GestureDetector(
            onVerticalDragUpdate: (DragUpdateDetails dragUpdateDetails) {
              print(dragUpdateDetails.delta.dy);
              if (dragUpdateDetails.delta.dy < -3)
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) {
                      return PetDetailPage(pet: widget.pets[_index]);
                    },
                  ),
                );
            },
            child: Card(
              semanticContainer: true,
              clipBehavior: Clip.antiAliasWithSaveLayer,
              elevation: 6,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
              child: Center(
                child: Hero(
                  tag: widget.pets[_index].category! + widget.pets[_index].id.toString(),
                  child: Image.network(
                    widget.pets[i].imageUrls![0],
                    fit: BoxFit.fitHeight,
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
