void main(List<String> arguments) {
  final notification = SlackNotificationDecorator(
      FacebookNotifcationDecorator(SmsNotification()));
  notification.sendMessage('Hello :)');
}

abstract class Notification {
  void sendMessage(String message);
}

class SmsNotification implements Notification {
  @override
  void sendMessage(String message) {
    print('SMS notification: $message');
  }
}

class NotificationDecorator implements Notification {
  final Notification _notification;

  NotificationDecorator(this._notification);
  @override
  void sendMessage(String message) {
    _notification.sendMessage(message);
  }
}

class FacebookNotifcationDecorator extends NotificationDecorator {
  FacebookNotifcationDecorator(Notification notification) : super(notification);
  @override
  void sendMessage(String message) {
    print('Facebook notification: $message');
    super.sendMessage(message);
  }
}

class SlackNotificationDecorator extends NotificationDecorator {
  SlackNotificationDecorator(Notification notification) : super(notification);
  @override
  void sendMessage(String message) {
    print('Slack notification: $message');
    super.sendMessage(message);
  }
}
