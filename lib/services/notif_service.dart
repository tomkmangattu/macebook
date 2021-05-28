import 'dart:math';

import 'package:macebook/models/notif_model.dart';

class NotifServices {
  List<NotifModel> notifModels;
  Map<NotifType, int> notifLength;

  Future<void> getNotifications() async {
    notifModels = [];
    notifLength = {
      NotifType.comment: 0,
      NotifType.follow: 0,
      NotifType.like: 0,
      NotifType.mention: 0,
    };
    await Future.delayed(Duration(seconds: 5));
    for (int i = 0; i < 14; i++) {
      final index = Random().nextInt(4);
      final NotifType randomType = NotifType.values[index];
      _addItem(
        notifType: randomType,
        from: 'John',
        fromId: '@John',
        message: 'This is a message',
      );
    }
    print('notification1-loaded');
    return;
  }

  void _addItem(
      {NotifType notifType, String from, String fromId, String message}) {
    switch (notifType) {
      case NotifType.comment:
        notifLength[NotifType.comment] = notifLength[NotifType.comment] + 1;
        break;
      case NotifType.follow:
        notifLength[NotifType.follow] = notifLength[NotifType.follow] + 1;
        break;
      case NotifType.like:
        notifLength[NotifType.like] = notifLength[NotifType.like] + 1;
        break;
      case NotifType.mention:
        notifLength[NotifType.mention] = notifLength[NotifType.mention] + 1;
        break;
    }
    notifModels.add(NotifModel(
        fromId: fromId,
        fromName: from,
        message: message,
        notifType: notifType));
  }
}
