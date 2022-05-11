import 'package:animal/core/extensions/context_extensions.dart';
import 'package:animal/models/enums/adoption_prcess_enum.dart';
import 'package:animal/stores/blockchain_store.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:shimmer/shimmer.dart';

mixin PushNotificationMixin {
  void showNotificationDialog(BuildContext context, BlockchainStore blockchainStore) {
    FirebaseMessaging.onMessage.listen(
      (RemoteMessage message) {
        if (message.data['type'] == AdoptionProcess.COMPLETE.name)
          showDialog(
            context: context,
            builder: (context) => Card(
              clipBehavior: Clip.antiAliasWithSaveLayer,
              margin: EdgeInsets.symmetric(vertical: context.lowValue, horizontal: context.mediumValue),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              child: Stack(
                children: [
                  Column(
                    children: [
                      Image.network(
                        message.data['imageUrl'],
                        fit: BoxFit.cover,
                        loadingBuilder: (context, child, loadingProgress) {
                          if (loadingProgress == null) return child;

                          return Shimmer.fromColors(
                            child: Column(),
                            baseColor: Colors.grey.shade400,
                            highlightColor: Colors.grey.shade600,
                          );
                        },
                      ),
                      SizedBox(height: 10),
                      Text(
                        message.data['title'],
                        style: Theme.of(context).textTheme.headline5,
                      ),
                      SizedBox(height: 10),
                      Container(
                        padding: EdgeInsets.all(8),
                        child: Text(message.data['body']),
                        decoration: BoxDecoration(
                          border: Border.all(),
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                      Spacer(),
                      Observer(
                        builder: (context) => blockchainStore.transactionState.isLoading
                            ? Text(
                                "Onaylanıyor lütfen bekleyiniz...",
                                style: Theme.of(context).textTheme.headline6,
                                textAlign: TextAlign.center,
                              )
                            : Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  ElevatedButton(
                                    child: Text("Onayla"),
                                    onPressed: () async {
                                      await blockchainStore.adoptionTransaction(message.data['body']);
                                      if (blockchainStore.transactionState.isLoaded) {
                                        Navigator.of(context).pop();
                                      }
                                    },
                                  ),
                                  ElevatedButton(
                                    child: Text("Reddet"),
                                    onPressed: () => Navigator.of(context).pop(),
                                  ),
                                ],
                              ),
                      ),
                    ],
                  ),
                  Positioned(
                    top: context.lowestValue,
                    left: context.lowestValue,
                    child: TextButton(
                      child: Icon(Icons.close),
                      onPressed: () => Navigator.pop(context),
                    ),
                  ),
                ],
              ),
            ),
          );
      },
    );
  }
}
