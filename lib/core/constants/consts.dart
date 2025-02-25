abstract class AppConst {
  static const applicationName = 'Multiplayer sample';
  static const notificationDuration = Duration(seconds: 4);
  static const defaultPlayersCount = '2';
  static const defaultGameDuration = '15';
  static const maxErrors = 3; // number of errors allowed per user. when he reaches this limit, he will be moved to loser screen
  static const pingMaxLag = 5;
  static const pingDuration = 3;
}
