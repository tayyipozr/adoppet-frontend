import 'package:animal/core/extensions/context_extensions.dart';
import 'package:animal/core/utils/push_notification_mixin.dart';
import 'package:animal/models/adopt/adoption_payload.dart';
import 'package:animal/models/blockchain/transaction.dart';
import 'package:animal/models/enums/adoption_prcess_enum.dart';
import 'package:animal/models/enums/page_enum.dart';
import 'package:animal/stores/adopt_store.dart';
import 'package:animal/stores/blockchain_store.dart';
import 'package:animal/stores/notification_store.dart';
import 'package:animal/stores/root_store.dart';
import 'package:animal/stores/state_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class AdoptedPetsPage extends StatefulWidget {
  final PageEnum _pageEnum;
  const AdoptedPetsPage(this._pageEnum, {Key? key}) : super(key: key);

  @override
  _AdoptedPetsPageState createState() => _AdoptedPetsPageState();
}

class _AdoptedPetsPageState extends State<AdoptedPetsPage> with PushNotificationMixin {
  late RootStore _rootStore;
  late AdoptStore _adoptStore;
  late NotificationStore _notificationStore;
  late BlockchainStore _blockchainStore;

  TextEditingController _healthController = TextEditingController();

  String _selectedDrowdownValue = "0 - 5000";

  List<DropdownMenuItem<String>> _menuItems = [
    DropdownMenuItem(child: Text("0 - 5000"), value: "0 - 5000"),
    DropdownMenuItem(child: Text("5000 - 10.000"), value: "5000 - 10.000"),
    DropdownMenuItem(child: Text("10.000 - 50.000"), value: "10.000 - 50.000"),
    DropdownMenuItem(child: Text("50.000 - üzeri"), value: "50.000 - üzeri"),
  ];

  @override
  void initState() {
    super.initState();

    () async {
      await Future.delayed(Duration.zero);
      showNotificationDialog(context, _blockchainStore);
      switch (widget._pageEnum) {
        case PageEnum.Requests:
          await _adoptStore.getAdoptionRequests();
          break;
        case PageEnum.Applications:
          await _adoptStore.getApplications();
          break;
        default:
      }
    }();
  }

  @override
  void didChangeDependencies() async {
    super.didChangeDependencies();
    _rootStore = Provider.of<RootStore>(context);
    _adoptStore = _rootStore.adoptStore;
    _notificationStore = _rootStore.notificationStore;
    _blockchainStore = _rootStore.blockchainStore;
    /*
    if (PageEnum.Adopted == widget._pageEnum) {
      _pets = await _petStore.getAdopted();
    } else {
      _pets = await _petStore.getFavorites();
    }
    */
  }

  @override
  Widget build(BuildContext context) {
    switch (widget._pageEnum) {
      case PageEnum.Requests:
        return _buildRequests();
      case PageEnum.Applications:
        return _buildApplications();
      default:
        return Container(
          child: Center(child: Text("No Page")),
        );
    }
  }

  Scaffold _buildRequests() {
    return Scaffold(
      appBar: AppBar(
        title: Text("Alınan Başvurular"),
      ),
      body: Observer(
        builder: (context) => _adoptStore.requestsState.state != LoadingState.loaded
            ? Center(
                child: CircularProgressIndicator(),
              )
            : Padding(
                padding: context.paddingLow,
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: widget._pageEnum != PageEnum.Requests ? 5 / 6 : 5 / 8,
                    crossAxisSpacing: context.lowValue,
                    mainAxisSpacing: context.lowValue,
                  ),
                  itemCount: _adoptStore.adoptionRequests.length,
                  itemBuilder: (context, index) {
                    print(_adoptStore.adoptionRequests[index].adoptionProcess!.status == AdoptionProcess.REJECTED.name);
                    return Card(
                      elevation: 5,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      child: Column(children: [
                        widget._pageEnum != PageEnum.Requests
                            ? Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                                  Text(_adoptStore.adoptionRequests[index].pet!.name!),
                                  IconButton(
                                    onPressed: () {},
                                    icon: Icon(Icons.favorite),
                                  )
                                ]),
                              )
                            : SizedBox(height: 10),
                        SizedBox(
                          width: context.width / 3,
                          height: context.height / 5,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(15.0),
                            child: Image.network(
                              _adoptStore.adoptionRequests[index].pet!.imageUrls == null
                                  ? [
                                      "https://images.unsplash.com/photo-1583511655826-05700d52f4d9?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=688&q=80",
                                      "https://images.unsplash.com/photo-1501820488136-72669149e0d4?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1740&q=80"
                                    ][_adoptStore.adoptionRequests[index].pet!.typeId! - 1]
                                  : _adoptStore.adoptionRequests[index].pet!.imageUrls![0].url!,
                              fit: BoxFit.fitWidth,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        if (widget._pageEnum == PageEnum.Requests)
                          Column(
                            children: [
                              Text(
                                _adoptStore.adoptionRequests[index].pet!.name!,
                              ),
                              Text(
                                "Başvuran : " + _adoptStore.adoptionRequests[index].user!.firstName!,
                              ),
                              Text(
                                _adoptStore.adoptionRequests[index].adoptionProcess!.status ==
                                        AdoptionProcess.CONFIRMATION.name
                                    ? "Onay Tarihi : " +
                                        DateFormat.yMMMd().format(DateTime.parse(
                                          _adoptStore.adoptionRequests[index].updatedAt!,
                                        ))
                                    : "Başvuru Tarihi : " +
                                        DateFormat.yMMMd().format(DateTime.parse(
                                          _adoptStore.adoptionRequests[index].updatedAt!,
                                        )),
                                textAlign: TextAlign.center,
                              ),
                              if (_adoptStore.adoptionRequests[index].adoptionProcess!.status ==
                                  AdoptionProcess.CONFIRMATION.name)
                                Column(
                                  children: [
                                    SizedBox(height: 10),
                                    Text("Tebrikler"),
                                    Text("Başvuruyu kabul ettiniz."),
                                  ],
                                )
                              else if (_adoptStore.adoptionRequests[index].adoptionProcess!.status ==
                                  AdoptionProcess.REJECTED.name)
                                Column(
                                  children: [
                                    SizedBox(height: 10),
                                    Text("İşlem tamamlandı"),
                                    Text("Başvuruyu reddettiniz."),
                                  ],
                                )
                              else
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Expanded(
                                      child: TextButton(
                                        clipBehavior: Clip.antiAliasWithSaveLayer,
                                        onPressed: () async {
                                          await _adoptStore.updateAdoption(
                                            _adoptStore.adoptionRequests[index].id!,
                                            AdoptionProcess.REJECTED.index,
                                          );
                                        },
                                        child: Text("Reddet"),
                                      ),
                                    ),
                                    Expanded(
                                      child: TextButton(
                                        clipBehavior: Clip.antiAliasWithSaveLayer,
                                        onPressed: () async {
                                          await _adoptStore.updateAdoption(_adoptStore.adoptionRequests[index].id!,
                                              AdoptionProcess.CONFIRMATION.index);
                                        },
                                        child: Text("Kabul Et"),
                                      ),
                                    ),
                                  ],
                                )
                            ],
                          ),
                      ]),
                    );
                  },
                ),
              ),
      ),
    );
  }

  Scaffold _buildApplications() {
    return Scaffold(
      appBar: AppBar(
        title: Text("Başvurularım"),
      ),
      body: Observer(
        builder: (context) => _adoptStore.applicationsState.state != LoadingState.loaded
            ? Center(
                child: CircularProgressIndicator(),
              )
            : Padding(
                padding: context.paddingLow,
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 5 / 8,
                    crossAxisSpacing: context.lowValue,
                    mainAxisSpacing: context.lowValue,
                  ),
                  itemCount: _adoptStore.applications.length,
                  itemBuilder: (context, index) {
                    return Card(
                      elevation: 5,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      child: Column(children: [
                        SizedBox(height: 10),
                        SizedBox(
                          width: context.width / 3,
                          height: context.height / 5,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(15.0),
                            child: Image.network(
                              _adoptStore.applications[index].pet!.imageUrls == null
                                  ? [
                                      "https://images.unsplash.com/photo-1583511655826-05700d52f4d9?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=688&q=80",
                                      "https://images.unsplash.com/photo-1501820488136-72669149e0d4?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1740&q=80"
                                    ][_adoptStore.applications[index].pet!.typeId! - 1]
                                  : _adoptStore.applications[index].pet!.imageUrls![0].url!,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        if (widget._pageEnum == PageEnum.Applications)
                          Column(
                            children: [
                              Text(
                                _adoptStore.applications[index].pet!.name!,
                              ),
                              SizedBox(height: 5),
                              Text(
                                "Başvuru Tarihi : " +
                                    DateFormat.yMd().format(DateTime.parse(
                                      _adoptStore.applications[index].createdAt!,
                                    )),
                                textAlign: TextAlign.center,
                              ),
                              if (_adoptStore.applications[index].adoptionProcess!.status ==
                                  AdoptionProcess.CONFIRMATION.name)
                                Column(
                                  children: [
                                    Text("Tebrikler"),
                                    Text("Başvurunuz kabul edildi."),
                                    TextButton(
                                        onPressed: () async {
                                          showDialog(
                                              context: context,
                                              builder: (context) {
                                                return Padding(
                                                  padding: EdgeInsets.symmetric(
                                                    horizontal: context.mediumValue,
                                                    vertical: context.highValue * 2,
                                                  ),
                                                  child: GestureDetector(
                                                    onTap: () {
                                                      FocusScopeNode currentFocus = FocusScope.of(context);
                                                      if (!currentFocus.hasPrimaryFocus) {
                                                        currentFocus.focusedChild?.unfocus();
                                                      }
                                                    },
                                                    child: Card(
                                                      shape: RoundedRectangleBorder(
                                                        borderRadius: BorderRadius.circular(16.0),
                                                      ),
                                                      child: Padding(
                                                        padding: EdgeInsets.symmetric(
                                                          horizontal: context.lowValue,
                                                          vertical: context.lowValue,
                                                        ),
                                                        child: Column(
                                                          children: <Widget>[
                                                            Text(
                                                              "Evlat Edinme Formu",
                                                              style: Theme.of(context).textTheme.headline6,
                                                            ),
                                                            Divider(),
                                                            Text(
                                                              "Evlat edinme sürecinizde son adımınız için tebrik ederiz !\n\nLütfen formu dikkatli ve doğru doldurunuz !",
                                                              style: Theme.of(context).textTheme.bodyText1,
                                                            ),
                                                            Divider(),
                                                            TextField(
                                                              controller: _healthController,
                                                              decoration: InputDecoration(
                                                                focusedBorder: OutlineInputBorder(
                                                                    borderSide:
                                                                        BorderSide(color: Colors.grey.shade100)),
                                                                labelText: "Hayvanın sağlık durumu",
                                                                enabledBorder: InputBorder.none,
                                                                labelStyle: const TextStyle(
                                                                  color: Colors.grey,
                                                                ),
                                                              ),
                                                              maxLines: null,
                                                              maxLength: 80,
                                                            ),
                                                            Spacer(),
                                                            Column(
                                                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                              children: [
                                                                DropdownButtonFormField<String>(
                                                                  decoration:
                                                                      InputDecoration(border: OutlineInputBorder()),
                                                                  items: _menuItems,
                                                                  value: _selectedDrowdownValue,
                                                                  onChanged: (value) => setState(() {
                                                                    _selectedDrowdownValue = value!;
                                                                  }),
                                                                ),
                                                                SizedBox(height: 10),
                                                                Row(
                                                                  children: [
                                                                    Expanded(
                                                                      child: OutlinedButton(
                                                                        onPressed: () async {
                                                                          var payload = AdoptionPayload(
                                                                            title: "Evlat Edinme Form Onay",
                                                                            body: "Maaş aralığı: " +
                                                                                _selectedDrowdownValue +
                                                                                "\nBaşvuru tarihi: " +
                                                                                DateFormat.yMd().format(DateTime.parse(
                                                                                    _adoptStore.applications[index]
                                                                                        .createdAt!)) +
                                                                                "\nEvlat edinilen hayvanın sağlık durumu:\n" +
                                                                                "${_healthController.text}",
                                                                            type: AdoptionProcess.COMPLETE.name,
                                                                          );

                                                                          print(payload);

                                                                          await _notificationStore.sendNotification(
                                                                            _adoptStore.applications[index].pet!.id!,
                                                                            payload,
                                                                          );
                                                                        },
                                                                        child: Text(_notificationStore
                                                                                .sendNotificationState.isLoading
                                                                            ? "Gönderiliyor"
                                                                            : "Gönder"),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ],
                                                            ),
                                                            Spacer(),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                );
                                              });
                                        },
                                        child: Text("Evlat edin !"))
                                  ],
                                )
                              else if (_adoptStore.applications[index].adoptionProcess!.status ==
                                  AdoptionProcess.REJECTED.name)
                                Column(
                                  children: [
                                    SizedBox(height: 5),
                                    Text("Üzgünüz"),
                                    Text("Başvurunuz reddedildi."),
                                  ],
                                )
                              else
                                Column(
                                  children: [
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text("Cevap bekleniyor."),
                                  ],
                                )
                            ],
                          ),
                      ]),
                    );
                  },
                ),
              ),
      ),
    );
  }
}
