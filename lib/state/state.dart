abstract class State {
  void nextState();
  void checkPreparation();
  void scheduleNotifications();
  void loadCards();
}