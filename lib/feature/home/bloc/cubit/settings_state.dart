/*class SettingsState {
  final bool isDarkModeEnabled;
  final bool isNotificationsEnabled;
  final String selectedLanguage;

  SettingsState({
    required this.isDarkModeEnabled,
    required this.isNotificationsEnabled,
    required this.selectedLanguage,
  });

  factory SettingsState.initial() {
    return SettingsState(
      isDarkModeEnabled: false,
      isNotificationsEnabled: true,
      selectedLanguage: 'English',
    );
  }

  factory SettingsState.fromJson(Map<String, dynamic> json) {
    return SettingsState(
      isDarkModeEnabled: json['isDarkModeEnabled'] ?? false,
      isNotificationsEnabled: json['isNotificationsEnabled'] ?? true,
      selectedLanguage: json['selectedLanguage'] ?? 'English',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'isDarkModeEnabled': isDarkModeEnabled,
      'isNotificationsEnabled': isNotificationsEnabled,
      'selectedLanguage': selectedLanguage,
    };
  }
}
*/
