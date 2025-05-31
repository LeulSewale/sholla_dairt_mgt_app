import 'package:dartz/dartz.dart';
import '../../../core/error/failures.dart';
import '../../../core/usecases/usecase.dart';
import '../../entities/message.dart';
import '../../repositories/communication_repository.dart';

class GetMessagesUseCase implements UseCase<List<Message>, NoParams> {
  final CommunicationRepository repository;

  GetMessagesUseCase(this.repository);

  @override
  Future<Either<Failure, List<Message>>> call(NoParams params) async {
    return await repository.getMessages();
  }
}
