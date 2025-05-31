import 'package:dartz/dartz.dart';
import '../../core/error/failures.dart';
import '../../domain/entities/message.dart';
import '../../domain/repositories/communication_repository.dart';
import '../datasources/local/local_data_source.dart';
import '../datasources/remote/remote_data_source.dart';

class CommunicationRepositoryImpl implements CommunicationRepository {
  final RemoteDataSource remoteDataSource;
  final LocalDataSource localDataSource;

  CommunicationRepositoryImpl(this.remoteDataSource, this.localDataSource);

  @override
  Future<Either<Failure, List<Message>>> getMessages() async {
    try {
      final messages = await remoteDataSource.getMessages();
      return Right(messages);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> sendMessage(String title, String content) async {
    try {
      // Implementation for sending message
      await Future.delayed(const Duration(seconds: 1));
      return const Right(null);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
