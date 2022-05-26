typedef void ObserverCallback(dynamic options);

class NotificationCenter {
  static NotificationCenter _instance = NotificationCenter._();
  NotificationCenter._();

  Map<String, Map<dynamic, ObserverCallback>> _channelObservers = {};

  static void subscribe({
    required String channel,
    required dynamic observer,
    required ObserverCallback onNotification,
  }) {
    if (_instance._channelObservers[channel] == null) {
      _instance._channelObservers[channel] = {};
    }

    _instance._channelObservers[channel]![observer] = onNotification;
  }

  static void unsubscribe({String? channel, required dynamic observer}) {
    if (channel == null) {
      for (final Map<dynamic, ObserverCallback> observers in _instance._channelObservers.values) {
        observers.remove(observer);
      }
    } else {
      if (_instance._channelObservers[channel] != null) {
        _instance._channelObservers[channel]!.remove(observer);
      }
    }
  }

  static void post({required String channel, dynamic options}) {
    if (_instance._channelObservers[channel] != null) {
      _instance._channelObservers[channel]!.values.forEach(
        (callback) => Future(() => callback(options)),
      );
    }
  }
}
