import 'package:animal/core/extensions/context_extensions.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

mixin PushNotificationMixin {
  void showNotificationDialog(BuildContext context) {
    FirebaseMessaging.onMessage.listen(
      (RemoteMessage message) {
        if (message.data['type'] == 'FINALIZE_ADOPTION')
          showDialog(
            context: context,
            builder: (context) => Padding(
              padding: EdgeInsets.all(context.lowestValue),
              child: Stack(
                children: [
                  Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: AlertDialog(
                      insetPadding: EdgeInsets.zero,
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      contentPadding: EdgeInsets.zero,
                      actionsAlignment: MainAxisAlignment.spaceBetween,
                      actions: [
                        ElevatedButton(
                          child: Text("Approve"),
                          onPressed: () => Navigator.of(context).pop(),
                        ),
                        ElevatedButton(
                          child: Text("Disapprove"),
                          onPressed: () => Navigator.of(context).pop(),
                        ),
                      ],
                      content: Column(
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
                              // You can use LinearProgressIndicator, CircularProgressIndicator, or a GIF instead
                            },
                          ),
                          Text(message.data['title']),
                          Text(message.data['body']),
                        ],
                      ),
                    ),
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
