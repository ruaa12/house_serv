/*import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'settings_state.dart';

class SettingsCubit extends HydratedCubit<SettingsState> {
  SettingsCubit() : super(SettingsState.initial());

  void toggleDarkMode() {
    emit(SettingsState(
      isDarkModeEnabled: !state.isDarkModeEnabled,
      isNotificationsEnabled: state.isNotificationsEnabled,
      selectedLanguage: state.selectedLanguage,
    ));
  }

  void toggleNotifications() {
    emit(SettingsState(
      isDarkModeEnabled: state.isDarkModeEnabled,
      isNotificationsEnabled: !state.isNotificationsEnabled,
      selectedLanguage: state.selectedLanguage,
    ));
  }

  void changeLanguage(String language) {
    emit(SettingsState(
      isDarkModeEnabled: state.isDarkModeEnabled,
      isNotificationsEnabled: state.isNotificationsEnabled,
      selectedLanguage: language,
    ));
  }

  @override
  SettingsState fromJson(Map<String, dynamic> json) {
    return SettingsState.fromJson(json);
  }

  @override
  Map<String, dynamic> toJson(SettingsState state) {
    return state.toJson();
  }
}*/
