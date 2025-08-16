import 'package:flutter_bloc/flutter_bloc.dart';
import '../data/model/notification_model.dart';
import '../data/repo/notification_repository.dart';

class NotificationState {
  final List<NotificationModel> notifications;

  NotificationState({
     this.notifications= const[],
     });
}

class NotificationCubit extends Cubit<NotificationState> {
  final NotificationRepository repository;

  NotificationCubit(this.repository) 
  : super(NotificationState(notifications: []));

  Future<void> loadNotifications() async {
    try {
      final notifications = await repository.getSavedNotifications();
      emit(NotificationState(notifications: notifications));
    } catch (e) {
      emit(NotificationState(notifications: []));
    }
  }

  Future<void> addNotification(NotificationModel notification) async {
    final currentNotifications = List<NotificationModel>.from(state.notifications);
    currentNotifications.insert(0, notification);
    emit(NotificationState(notifications: currentNotifications));
    await repository.saveNotification(notification);
  }
}
