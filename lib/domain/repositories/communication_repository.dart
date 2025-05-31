import 'package:dartz/dartz.dart';
import '../../core/error/failures.dart';
import '../entities/message.dart';

abstract class CommunicationRepository {
  Future<Either<Failure, List<Message>>> getMessages();
  Future<Either<Failure, void>> sendMessage(String title, String content);
}
