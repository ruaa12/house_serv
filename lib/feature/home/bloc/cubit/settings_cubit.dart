import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'settings_state.dart';

class SettingsCubit extends HydratedCubit<SettingsState> {
  SettingsCubit() : super(SettingsState.initial());

  // تشغيل/إيقاف الإشعارات
  void toggleNotifications() {
    emit(state.copyWith(isNotificationsEnabled: !state.isNotificationsEnabled));
  }

  // تشغيل/إيقاف الوضع الليلي
  void toggleDarkMode() {
    emit(state.copyWith(isDarkModeEnabled: !state.isDarkModeEnabled));
  }

  // تغيير اللغة
  void setLanguage(String lang) {
    emit(state.copyWith(selectedLanguage: lang));
  }

  // حفظ الحالة تلقائياً
  @override
  Map<String, dynamic>? toJson(SettingsState state) {
    return state.toMap();
  }

  // استرجاع الحالة المحفوظة عند التشغيل
  @override
  SettingsState? fromJson(Map<String, dynamic> json) {
    return SettingsState.fromMap(json);
  }
}
