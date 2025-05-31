part of 'communication_bloc.dart';

abstract class CommunicationState extends Equatable {
  const CommunicationState();

  @override
  List<Object> get props => [];
}

class CommunicationInitial extends CommunicationState {}

class CommunicationLoading extends CommunicationState {}

class CommunicationLoaded extends CommunicationState {
  final List<Message> messages;

  const CommunicationLoaded(this.messages);

  @override
  List<Object> get props => [messages];
}

class CommunicationError extends CommunicationState {
  final String message;

  const CommunicationError(this.message);

  @override
  List<Object> get props => [message];
}
