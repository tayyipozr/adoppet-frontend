import 'package:animal/core/extensions/context_extensions.dart';
import 'package:animal/models/enums/page_enum.dart';
import 'package:animal/models/pets/pet.dart';
import 'package:animal/stores/pet_store.dart';
import 'package:animal/stores/root_store.dart';
import 'package:animal/stores/state_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

class AdoptedPetsPage extends StatefulWidget {
  final PageEnum _pageEnum;
  const AdoptedPetsPage(this._pageEnum, {Key? key}) : super(key: key);

  @override
  _AdoptedPetsPageState createState() => _AdoptedPetsPageState();
}

class _AdoptedPetsPageState extends State<AdoptedPetsPage> {
  late List<Pet> _pets;
  late RootStore _rootStore;
  late PetStore _petStore;

  @override
  void initState() {
    super.initState();
    _pets = [];
  }

  @override
  void didChangeDependencies() async {
    super.didChangeDependencies();
    _rootStore = Provider.of<RootStore>(context);
    _petStore = _rootStore.petStore;
    if (PageEnum.Adopted == widget._pageEnum) {
      _pets = await _petStore.getAdopted();
    } else {
      _pets = await _petStore.getFavorites();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sahiplendiklerim"),
      ),
      body: Observer(builder: (context) {
        switch (_petStore.adoptedState.state) {
          case LoadingState.initial:
            return Center(child: CircularProgressIndicator());
          case LoadingState.loading:
            return Center(child: CircularProgressIndicator());
          case LoadingState.loaded:
            return Padding(
              padding: context.paddingLow,
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 5 / 7,
                  crossAxisSpacing: context.lowValue,
                  mainAxisSpacing: context.lowValue,
                ),
                itemCount: _pets.length,
                itemBuilder: (context, index) {
                  return Card(
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: Column(children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                          Text(_pets[index].name!),
                          IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.favorite),
                          )
                        ]),
                      ),
                      SizedBox(
                        width: context.width / 3,
                        height: context.height / 5,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(15.0),
                          child: Image.network(
                            _pets[index].imageUrls![0],
                            fit: BoxFit.fitWidth,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        DateTime.now().toString().substring(0, 10),
                        textAlign: TextAlign.center,
                      )
                    ]),
                  );
                },
              ),
            );
          default:
            return Center(
              child: Text("Erro"),
            );
        }
      }),
    );
  }
}
