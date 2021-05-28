enum NotifType {
  follow,
  like,
  comment,
  mention,
}

class NotifModel {
  String fromName;
  String fromId;
  String message;
  NotifType notifType;

  NotifModel({this.fromId, this.fromName, this.message, this.notifType});
}
