import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vazifa_13/blocs/message/message_event.dart';
import 'package:vazifa_13/blocs/message/message_state.dart';
import 'package:vazifa_13/data/model/message_model.dart';

class MessageBloc extends Bloc<MessageEvent, MessageState> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  MessageBloc() : super(MessageLoading());

  @override
  Stream<MessageState> mapEventToState(MessageEvent event) async* {
    if (event is LoadMessagesEvent) {
      yield MessageLoading();
      try {
        final snapshot = await _firestore
            .collection('messages')
            .where('contactId', isEqualTo: event.contactId)
            .orderBy('timestamp', descending: true)
            .get();

        final messages = snapshot.docs
            .map((doc) => MessageModel.fromDocumentSnapshot(doc))
            .toList();
        yield MessageLoaded(messages);
      } catch (e) {
        yield MessageError(e.toString());
      }
    } else if (event is AddMessageEvent) {
      try {
        await _firestore.collection('messages').add({
          'contactId': event.message.contactId,
          'content': event.message.content,
          'isFile': event.message.isFile,
          'timestamp': event.message.timestamp,
        });
      } catch (e) {
        yield MessageError(e.toString());
      }
    }
  }
}
