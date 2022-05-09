import 'package:animal/core/extensions/context_extensions.dart';
import 'package:animal/models/pets/pet.dart';
import 'package:flutter/material.dart';

class PetDetailPage extends StatefulWidget {
  final Pet pet;

  PetDetailPage({
    Key? key,
    required this.pet,
  }) : super(key: key);

  @override
  _PetDetailPageState createState() => _PetDetailPageState();
}

class _PetDetailPageState extends State<PetDetailPage> {
  @override
  Widget build(BuildContext context) {
    print("Detail Page: " + widget.pet.category! + widget.pet.id.toString());
    return GestureDetector(
      onVerticalDragUpdate: (DragUpdateDetails dragUpdateDetails) {
        print(dragUpdateDetails.delta.dy);
        if (dragUpdateDetails.delta.dy < 3) Navigator.pop(context);
      },
      child: Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.startTop,
        floatingActionButton: FloatingActionButton(
          heroTag: "action",
          onPressed: () => Navigator.pop(context),
          backgroundColor: Colors.transparent,
          elevation: 0,
          child: Icon(
            Icons.arrow_back_ios_rounded,
          ),
        ),
        body: Stack(
          fit: StackFit.expand,
          children: [
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: Hero(
                tag: widget.pet.category! + widget.pet.id.toString(),
                child: Image.network(
                  widget.pet.imageUrls == null ? "  " : widget.pet.imageUrls![0],
                  fit: BoxFit.fitWidth,
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
                height: 300,
                width: 300,
                child: Column(
                  children: [
                    Text(
                      widget.pet.name ?? "",
                      style: TextStyle(color: Colors.black, fontSize: 20),
                    ),
                    Container(
                      padding: context.paddingLow,
                      width: context.width,
                      height: context.height / 3,
                      child: GridView.extent(
                        childAspectRatio: 8 / 3,
                        physics: NeverScrollableScrollPhysics(),
                        maxCrossAxisExtent: 130,
                        shrinkWrap: true,
                        children: [
                          Card(
                            elevation: 5,
                            color: Colors.grey,
                            child: Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Image.network("https://cdn-icons-png.flaticon.com/512/3788/3788090.png"),
                                  Text(
                                    widget.pet.age.toString(),
                                    style: TextStyle(color: Colors.black, fontSize: 20),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Card(
                            elevation: 5,
                            color: Colors.grey,
                            child: Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Image.network("https://cdn-icons-png.flaticon.com/512/594/594037.png"),
                                  Text(
                                    widget.pet.sex! ? "Erkek" : "Dişi",
                                    style: TextStyle(color: Colors.black, fontSize: 20),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Card(
                            elevation: 5,
                            color: Colors.grey,
                            child: Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Image.network("https://cdn-icons-png.flaticon.com/512/714/714561.png"),
                                  Text(
                                    widget.pet.height.toString(),
                                    style: TextStyle(color: Colors.black, fontSize: 20),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Card(
                            elevation: 5,
                            color: Colors.grey,
                            child: Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Image.network("https://cdn-icons-png.flaticon.com/512/2929/2929016.png"),
                                  Text(
                                    widget.pet.weight.toString(),
                                    style: TextStyle(color: Colors.black, fontSize: 20),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Card(
                            elevation: 5,
                            color: Colors.grey,
                            child: Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Image.network("https://cdn-icons-png.flaticon.com/512/2206/2206009.png"),
                                  Text(
                                    widget.pet.color.toString(),
                                    style: TextStyle(color: Colors.black, fontSize: 20),
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    ElevatedButton(
                      style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.grey)),
                      onPressed: () {
                        showDialog(
                            context: context,
                            builder: (context) {
                              return Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Card(
                                  child: Form(
                                      child: Column(
                                    children: [
                                      Text(widget.pet.name ?? ""),
                                      TextField(
                                        decoration: InputDecoration(
                                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(16)),
                                          labelText: "Health Status",
                                        ),
                                      ),
                                      TextField(),
                                      TextField(),
                                    ],
                                  )),
                                ),
                              );
                            });
                      },
                      child: Text("Şimdi sahiplen !"),
                    )
                  ],
                ),
              ),
            ),
            Positioned(
              right: 0,
              bottom: 250,
              child: IconButton(
                icon: widget.pet.name!.length <= 5 ? Icon(Icons.favorite_border) : Icon(Icons.favorite),
                color: Colors.grey,
                onPressed: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
