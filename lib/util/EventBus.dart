import 'package:event_bus/event_bus.dart';

EventBus eventBus = new EventBus();

class EventActions {
  String action;
  dynamic args;

  EventActions(this.action, {this.args});

  static final String EVENT_ACTION_NEW_FILE_ARRIVED =
      'event_action_new_file_arrived';
}
