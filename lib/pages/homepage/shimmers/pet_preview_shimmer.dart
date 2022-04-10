import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class PetPreviewShimmer extends StatelessWidget {
  const PetPreviewShimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      itemCount: 3,
      controller: PageController(viewportFraction: 0.7),
      onPageChanged: (i) {},
      itemBuilder: (_, i) {
        return Transform.scale(
          scale: i == 0 ? 1 : 0.9,
          child: GestureDetector(
            onVerticalDragUpdate: (DragUpdateDetails dragUpdateDetails) {},
            child: Shimmer.fromColors(
              baseColor: Colors.grey.shade400,
              highlightColor: Colors.grey.shade600,
              child: Card(
                semanticContainer: true,
                clipBehavior: Clip.antiAliasWithSaveLayer,
                elevation: 6,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                child: Container(),
              ),
            ),
          ),
        );
      },
    );
  }
}
