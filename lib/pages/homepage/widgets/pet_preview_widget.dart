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
              clipBehavior: Clip.antiAliasWithSaveLayer,
              elevation: 6,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
              child: Hero(
                tag: widget.pets[_index].typeId.toString() + widget.pets[_index].id.toString(),
                child: Image.network(
                  widget.pets[i].imageUrls == null
                      ? [
                          "https://images.unsplash.com/photo-1583511655826-05700d52f4d9?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=688&q=80",
                          "https://images.unsplash.com/photo-1501820488136-72669149e0d4?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1740&q=80"
                        ][widget.pets[i].typeId! - 1]
                      : widget.pets[i].imageUrls![0].url!,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
