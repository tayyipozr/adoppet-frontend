import 'dart:ui';
import 'package:animal/constants/navigation_constants.dart';
import 'package:animal/models/enums/page_enum.dart';
import 'package:animal/models/user/user.dart';
import 'package:animal/stores/auth_store.dart';
import 'package:animal/stores/root_store.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PetDrawer extends StatefulWidget {
  const PetDrawer({Key? key}) : super(key: key);

  @override
  _PetDrawerState createState() => _PetDrawerState();
}

class _PetDrawerState extends State<PetDrawer> {
  late RootStore _rootStore;
  late AuthStore _authStore;

  @override
  void didChangeDependencies() async {
    super.didChangeDependencies();
    _rootStore = Provider.of<RootStore>(context);
    _authStore = _rootStore.authStore;
    await _authStore.getUser();
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
                  child: Image.network(_authStore.user!.imageUrls![0]),
                ),
                Text("Hoşgeldin ${_authStore.user!.name}"),
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
          ],
        ),
      ),
    );
  }
}
