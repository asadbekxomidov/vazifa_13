abstract class UserEvent {}


class LoadUsersEvent extends UserEvent {
  @override
  List<Object> get props => [];
}


// part of 'user_bloc.dart';

// abstract class UserEvent extends Equatable {
//   const UserEvent();

//   @override
//   List<Object> get props => [];
// }

// class LoadUsersEvent extends UserEvent {}

// class LoadUserByIdEvent extends UserEvent {
//   final String userId;

//   LoadUserByIdEvent(this.userId);

//   @override
//   List<Object> get props => [userId];
// }
