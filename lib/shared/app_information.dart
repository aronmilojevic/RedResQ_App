class AppInformation {
  static bool silentModeEnabled = false;
  AppInformation._();

  static bool getSilentModeEnabled() {
    return silentModeEnabled;
  }

  static void setSilentModeEnabled(bool newValue) {
    silentModeEnabled = newValue;
  }
}


// token der für 30 Tage gültig ist wird gespeichert
