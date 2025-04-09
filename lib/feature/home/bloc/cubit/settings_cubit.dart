import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'dart:convert';

class SettingsState {
  final bool isDarkModeEnabled;
  final bool isNotificationsEnabled;
  final String selectedLanguage;

  SettingsState({
    required this.isDarkModeEnabled,
    required this.isNotificationsEnabled,
    required this.selectedLanguage,
  });

  // الحالة الافتراضية
  factory SettingsState.initial() {
    return SettingsState(
      isDarkModeEnabled: false,
      isNotificationsEnabled: true,
      selectedLanguage: 'English',
    );
  }

  // تحويل الحالة إلى نص JSON
  String toJson() {
    return jsonEncode({
      'isDarkModeEnabled': isDarkModeEnabled,
      'isNotificationsEnabled': isNotificationsEnabled,
      'selectedLanguage': selectedLanguage,
    });
  }

  // استعادة الحالة من نص JSON
  factory SettingsState.fromJson(String jsonString) {
    final data = jsonDecode(jsonString);
    return SettingsState(
      isDarkModeEnabled: data['isDarkModeEnabled'] ?? false,
      isNotificationsEnabled: data['isNotificationsEnabled'] ?? true,
      selectedLanguage: data['selectedLanguage'] ?? 'English',
    );
  }
}

class SettingsCubit extends HydratedCubit<SettingsState> {
  SettingsCubit() : super(SettingsState.initial());

  // تعديل الوضع الداكن
  void toggleDarkMode() {
    emit(SettingsState(
      isDarkModeEnabled: !state.isDarkModeEnabled,
      isNotificationsEnabled: state.isNotificationsEnabled,
      selectedLanguage: state.selectedLanguage,
    ));
  }

  // تعديل الإشعارات
  void toggleNotifications() {
    emit(SettingsState(
      isDarkModeEnabled: state.isDarkModeEnabled,
      isNotificationsEnabled: !state.isNotificationsEnabled,
      selectedLanguage: state.selectedLanguage,
    ));
  }

  // تغيير اللغة
  void changeLanguage(String language) {
    emit(SettingsState(
      isDarkModeEnabled: state.isDarkModeEnabled,
      isNotificationsEnabled: state.isNotificationsEnabled,
      selectedLanguage: language,
    ));
  }

  @override
  SettingsState fromJson(Map<String, dynamic> json) {
    return SettingsState.fromJson(jsonEncode(json));
  }

  @override
  Map<String, dynamic> toJson(SettingsState state) {
    return jsonDecode(state.toJson());
  }
}
