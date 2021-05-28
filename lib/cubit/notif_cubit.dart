import 'package:bloc/bloc.dart';
import 'package:macebook/services/notif_service.dart';
import 'package:meta/meta.dart';

part 'notif_state.dart';

class NotifCubit extends Cubit<NotifState> {
  final NotifServices notifServices = NotifServices();
  NotifCubit() : super(NotifInitial());

  void getNotifications() async {
    await notifServices.getNotifications();
    print('notification loaded');
    emit(NotifLoaded());
  }
}
