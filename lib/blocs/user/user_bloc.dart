// user_bloc.dart
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'user_event.dart';
import 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc() : super(UserInitial()) {
    on<LoadUserEvent>(_onLoadUserEvent);
  }

  Future<void> _onLoadUserEvent(LoadUserEvent event, Emitter<UserState> emit) async {
    emit(UserLoading());
    try {
      final uid = FirebaseAuth.instance.currentUser!.uid;
      final userSnapshot = await FirebaseFirestore.instance
          .collection('users')
          .doc(uid)
          .get();
      if (userSnapshot.exists) {
        emit(UserLoaded(userSnapshot.data() as Map<String, dynamic>));
      } else {
        emit(UserError("User not found"));
      }
    } catch (e) {
      emit(UserError(e.toString()));
    }
  }
}





