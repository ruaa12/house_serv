import 'package:equatable/equatable.dart';

class SettingsState extends Equatable {
  final bool isNotificationsEnabled;
  final bool isDarkModeEnabled;
  final String selectedLanguage;

  const SettingsState({
    required this.isNotificationsEnabled,
    required this.isDarkModeEnabled,
    required this.selectedLanguage,
  });

  // الحالة الابتدائية
  factory SettingsState.initial() {
    return const SettingsState(
      isNotificationsEnabled: false,
      isDarkModeEnabled: false,
      selectedLanguage: 'en',
    );
  }

  // لنسخ الحالة وتعديل قيم محددة
  SettingsState copyWith({
    bool? isNotificationsEnabled,
    bool? isDarkModeEnabled,
    String? selectedLanguage,
  }) {
    return SettingsState(
      isNotificationsEnabled:
          isNotificationsEnabled ?? this.isNotificationsEnabled,
      isDarkModeEnabled: isDarkModeEnabled ?? this.isDarkModeEnabled,
      selectedLanguage: selectedLanguage ?? this.selectedLanguage,
    );
  }

  // لتحويل الحالة إلى Map لتخزينها
  Map<String, dynamic> toMap() {
    return {
      'isNotificationsEnabled': isNotificationsEnabled,
      'isDarkModeEnabled': isDarkModeEnabled,
      'selectedLanguage': selectedLanguage,
    };
  }

  // لتحويل Map إلى الحالة
  factory SettingsState.fromMap(Map<String, dynamic> map) {
    return SettingsState(
      isNotificationsEnabled: map['isNotificationsEnabled'] ?? false,
      isDarkModeEnabled: map['isDarkModeEnabled'] ?? false,
      selectedLanguage: map['selectedLanguage'] ?? 'en',
    );
  }
  @override
  List<Object> get props =>
      [isNotificationsEnabled, isDarkModeEnabled, selectedLanguage];
}
