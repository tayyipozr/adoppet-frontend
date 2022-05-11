import 'dart:ui';
import 'package:animal/constants/navigation_constants.dart';
import 'package:animal/models/enums/page_enum.dart';
import 'package:animal/stores/root_store.dart';
import 'package:animal/stores/user_store.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PetDrawer extends StatefulWidget {
  const PetDrawer({Key? key}) : super(key: key);

  @override
  _PetDrawerState createState() => _PetDrawerState();
}

class _PetDrawerState extends State<PetDrawer> {
  late RootStore _rootStore;
  late UserStore _userStore;

  @override
  void didChangeDependencies() async {
    super.didChangeDependencies();
    _rootStore = Provider.of<RootStore>(context);
    _userStore = _rootStore.userStore;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black.withOpacity(0.7),
      width: 280,
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: BackdropFilter(
        filter: ImageFilter.blur(
          sigmaX: 5.0,
          sigmaY: 5.0,
        ),
        child: Column(
          children: [
            Row(
              children: [
                CircleAvatar(
                  child: Icon(Icons.account_box_outlined),
                ),
                Text("Hoşgeldin ${_userStore.user != null ? _userStore.user!.firstName : "Anonim"}"),
              ],
            ),
            Divider(
              color: Colors.white,
            ),
            ListTile(
              title: Text("Profil"),
            ),
            Divider(
              color: Colors.white,
            ),
            ListTile(
              title: Text("Başvurularım"),
              onTap: () => Navigator.popAndPushNamed(context, NavigationConstants.ADOPTED_PETS,
                  arguments: PageEnum.Applications),
            ),
            Divider(
              color: Colors.white,
            ),
            ListTile(
              title: Text("Favorilerim"),
              onTap: () =>
                  Navigator.popAndPushNamed(context, NavigationConstants.ADOPTED_PETS, arguments: PageEnum.Favorites),
            ),
            Divider(
              color: Colors.white,
            ),
            ListTile(
              title: Text("Sahiplendiklerim"),
              onTap: () =>
                  Navigator.popAndPushNamed(context, NavigationConstants.ADOPTED_PETS, arguments: PageEnum.Adopted),
            ),
            ListTile(
              title: Text("Alınan Başvurular"),
              onTap: () =>
                  Navigator.popAndPushNamed(context, NavigationConstants.ADOPTED_PETS, arguments: PageEnum.Requests),
            ),
          ],
        ),
      ),
    );
  }
}
