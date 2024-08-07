import 'package:vazifa_13/data/model/message_model.dart';

abstract class MessageEvent {}

class LoadMessagesEvent extends MessageEvent {
  final String contactId;

  LoadMessagesEvent(this.contactId);
}

class AddMessageEvent extends MessageEvent {
  final MessageModel message;

  AddMessageEvent(this.message);
}
