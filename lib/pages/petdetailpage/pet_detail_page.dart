import 'package:animal/core/extensions/context_extensions.dart';
import 'package:animal/models/pets/pet.dart';
import 'package:animal/stores/adopt_store.dart';
import 'package:animal/stores/root_store.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
  late AdoptStore _adoptStore;

  @override
  void initState() {
    super.initState();
    () async {
      await Future.delayed(Duration.zero);
    }();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    RootStore rootStore = Provider.of<RootStore>(context);
    _adoptStore = rootStore.adoptStore;
  }

  @override
  Widget build(BuildContext context) {
    print("Detail Page: " + widget.pet.typeId.toString() + widget.pet.id.toString());
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
                tag: widget.pet.typeId.toString() + widget.pet.id.toString(),
                child: Image.network(
                  widget.pet.imageUrls == null
                      ? [
                          "https://images.unsplash.com/photo-1583511655826-05700d52f4d9?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=688&q=80",
                          "https://images.unsplash.com/photo-1501820488136-72669149e0d4?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1740&q=80"
                        ][widget.pet.typeId! - 1]
                      : widget.pet.imageUrls![0].url!,
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
                                    widget.pet.genderId == 1 ? "Erkek" : "Dişi",
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
                                    'Color',
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
                      onPressed: _adoptStore.adoptState.isLoading
                          ? null
                          : () async {
                              final bool = await _adoptStore.adopt(widget.pet.id!);
                              showDialog(
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                      title: Text(bool ? "Tebrikler !" : "Bir hata oluştu !"),
                                      content: Text(bool
                                          ? "${widget.pet.name} adlı dostumuz için evlat edinme sürecini başlattınız."
                                          : "Lütfen tekrar denetin !"),
                                      actions: [
                                        ElevatedButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          child: Text("Tamam"),
                                        )
                                      ],
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
