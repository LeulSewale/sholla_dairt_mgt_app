import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import '../../../domain/entities/message.dart';
import '../../../domain/usecases/communication/get_messages_usecase.dart';
import '../../../core/usecases/usecase.dart';

part 'communication_event.dart';
part 'communication_state.dart';

class CommunicationBloc extends Bloc<CommunicationEvent, CommunicationState> {
  final GetMessagesUseCase getMessagesUseCase;

  CommunicationBloc(this.getMessagesUseCase) : super(CommunicationInitial()) {
    on<LoadMessages>(_onLoadMessages);
  }

  void _onLoadMessages(LoadMessages event, Emitter<CommunicationState> emit) async {
    emit(CommunicationLoading());
    
    final result = await getMessagesUseCase(NoParams());
    
    result.fold(
      (failure) => emit(CommunicationError(failure.message)),
      (messages) => emit(CommunicationLoaded(messages)),
    );
  }
}
