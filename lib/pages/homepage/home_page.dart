import 'package:animal/constants/navigation_constants.dart';
import 'package:animal/core/utils/push_notification_mixin.dart';
import 'package:animal/pages/homepage/shimmers/pet_preview_shimmer.dart';
import 'package:animal/pages/homepage/widgets/categories_widget.dart';
import 'package:animal/pages/homepage/widgets/pet_preview_widget.dart';
import 'package:animal/stores/blockchain_store.dart';
import 'package:animal/stores/pet_store.dart';
import 'package:animal/stores/root_store.dart';
import 'package:animal/widgets/pet_drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with PushNotificationMixin {
  late RootStore _rootStore;
  late PetStore _petStore;
  late BlockchainStore _blockchainStore;
  late GlobalKey<ScaffoldState> _scaffoldKey;

  @override
  void initState() {
    _scaffoldKey = GlobalKey<ScaffoldState>();
    super.initState();

    () async {
      await Future.delayed(Duration.zero);
      showNotificationDialog(context, _blockchainStore);
    }();
  }

  @override
  void didChangeDependencies() async {
    super.didChangeDependencies();
    _rootStore = Provider.of<RootStore>(context);
    _blockchainStore = _rootStore.blockchainStore;
    _petStore = _rootStore.petStore;
    await _petStore.get();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Text("Adoppet"),
          centerTitle: true,
          leading: IconButton(
            icon: CircleAvatar(
                child: Icon(
              Icons.account_circle_outlined,
              size: 30,
            )),
            onPressed: () {
              _scaffoldKey.currentState!.openDrawer();
            },
          ),
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.popAndPushNamed(context, NavigationConstants.ADOPTED_PETS);
                },
                icon: Icon(Icons.wrap_text_rounded))
          ],
        ),
        drawer: PetDrawer(),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              _buildSearchBox(),
              SizedBox(
                height: 100,
                child: CategoriesWidget((i) async {
                  _petStore.currentIndex = i;
                  print(_petStore.currentIndex);
                  await _petStore.get();
                }),
              ),
              _buildAboutText(),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Observer(builder: (BuildContext context) {
                    if (_petStore.petState.isLoading) {
                      return PetPreviewShimmer();
                    } else if (_petStore.petState.isLoaded) {
                      return PetPreview(pets: _petStore.pets);
                    } else {
                      print(_petStore.petState.errorMessage);
                      return Container(
                        width: 0,
                        height: 0,
                      );
                    }
                  }),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  SizedBox _buildSearchBox() {
    return SizedBox(
      width: 300,
      child: TextField(
        decoration: InputDecoration(
          prefixIcon: Icon(
            Icons.search,
            color: Colors.white,
            size: 28,
          ),
          hintText: 'Bir dost ara...',
          hintStyle: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontStyle: FontStyle.italic,
          ),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
        ),
        style: TextStyle(
          color: Colors.white,
        ),
      ),
    );
  }

  Text _buildSearchTitle() {
    return Text(
      "Search a friend",
      textAlign: TextAlign.center,
      style: TextStyle(fontSize: 20),
    );
  }
}

Container _buildAboutText() {
  return Container(
    padding: EdgeInsets.only(left: 8.0),
    child: Text(
      "Sahiplen",
      style: TextStyle(fontSize: 18),
    ),
    alignment: Alignment.centerLeft,
  );
}
