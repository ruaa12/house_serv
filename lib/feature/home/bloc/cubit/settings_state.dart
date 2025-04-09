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
