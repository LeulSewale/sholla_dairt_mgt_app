part of 'communication_bloc.dart';

abstract class CommunicationEvent extends Equatable {
  const CommunicationEvent();

  @override
  List<Object> get props => [];
}

class LoadMessages extends CommunicationEvent {}
