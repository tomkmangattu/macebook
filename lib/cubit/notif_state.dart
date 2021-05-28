part of 'notif_cubit.dart';

@immutable
abstract class NotifState {}

class NotifInitial extends NotifState {}

class NotifLoaded extends NotifState {}

class NotifLoadFail extends NotifState {}
