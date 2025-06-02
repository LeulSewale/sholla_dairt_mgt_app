import 'package:dairy_management/domain/entities/deposit.dart';
import 'package:dairy_management/domain/entities/message.dart';
import 'package:http/http.dart' as http;
import '../../models/user_model.dart';
import '../../models/product_model.dart';
import '../../models/message_model.dart';
import '../../models/deposit_model.dart';

abstract class RemoteDataSource {
  Future<UserModel> login(String email, String password);
  Future<List<ProductModel>> getProducts();
  Future<List<MessageModel>> getMessages();
  Future<void> createDeposit(DepositModel deposit);
  Future<List<DepositModel>> getDepositHistory();
}

class RemoteDataSourceImpl implements RemoteDataSource {
  final http.Client client;

  RemoteDataSourceImpl(this.client);

  @override
  Future<UserModel> login(String email, String password) async {
    // Mock implementation - replace with actual API call
    await Future.delayed(const Duration(seconds: 1));

    return const UserModel(
      id: '1',
      name: 'John Doe',
      email: 'john@example.com',
      phone: '+251911234567',
      balance: 155000,
      purchasingLimit: 25000,
    );
  }

  @override
  Future<List<ProductModel>> getProducts() async {
    // Mock implementation - replace with actual API call
    await Future.delayed(const Duration(seconds: 1));

    return [
      const ProductModel(
        id: '1',
        name: 'Raw Milk',
        description:
            'Sholla Raw Milk offers fresh, unprocessed milk sourced directly from local farms—pure, nutritious, and packed with natural flavor for a healthier lifestyle.',
        price: 100,
        imageUrl: 'assets/images/shola1.webp',
        category: 'Milk',
        isAvailable: true,
      ),
      const ProductModel(
        id: '2',
        name: 'Sholla 1 Liter Milk',
        description:
            'Gain insights into inventory trends, turnover rates, and sales performance with detailed reports.',
        price: 100,
        imageUrl: 'assets/images/shola2.webp',
        category: 'Milk',
        isAvailable: true,
      ),
      const ProductModel(
        id: '3',
        name: 'Sholla 500 Mg Milk',
        description:
            'Gain insights into inventory trends, turnover rates, and sales performance with detailed reports.',
        price: 100,
        imageUrl: 'assets/images/shola3.webp',
        category: 'Milk',
        isAvailable: true,
      ),
      const ProductModel(
        id: '4',
        name: 'Sholla Ice Cream Mini',
        description:
            'Gain insights into inventory trends, turnover rates, and sales performance with detailed reports.',
        price: 100,
        imageUrl: 'assets/images/shola4.webp',
        category: 'Ice Cream',
        isAvailable: true,
      ),
    ];
  }

  @override
  Future<List<MessageModel>> getMessages() async {
    // Mock implementation - replace with actual API call
    await Future.delayed(const Duration(seconds: 1));

    return [
      MessageModel(
        id: '1',
        title: 'Spilling Milk',
        content: 'Issue with milk spilling during transport',
        sender: 'Sholla Sales Team',
        date: DateTime(2025, 1, 28),
        status: MessageStatus.pending,
      ),
      MessageModel(
        id: '2',
        title: 'Lagging Distribution',
        content: 'Distribution delays in certain areas',
        sender: 'Sholla Sales Team',
        date: DateTime(2025, 1, 25),
        status: MessageStatus.answered,
      ),
      MessageModel(
        id: '3',
        title: 'Bad Customer Service',
        content: 'Customer service quality issues reported',
        sender: 'Sholla Sales Team',
        date: DateTime(2025, 1, 21),
        status: MessageStatus.answered,
      ),
    ];
  }

  @override
  Future<void> createDeposit(DepositModel deposit) async {
    // Mock implementation - replace with actual API call
    await Future.delayed(const Duration(seconds: 1));
  }

  @override
  Future<List<DepositModel>> getDepositHistory() async {
    // Mock implementation - replace with actual API call
    await Future.delayed(const Duration(seconds: 1));

    return [
      DepositModel(
        id: '12310',
        bankName: 'Commercial Bank of Ethiopia',
        accountNumber: '1001239810293B',
        accountName: 'Lame Diary P.L.C',
        amount: 260000,
        remark: 'Deposit for credit',
        status: DepositStatus.pending,
        createdAt: DateTime.now().subtract(const Duration(days: 1)),
      ),
      DepositModel(
        id: '12309',
        bankName: 'Commercial Bank of Ethiopia',
        accountNumber: '1001239810293B',
        accountName: 'Lame Diary P.L.C',
        amount: 210000,
        remark: 'Deposit for credit',
        status: DepositStatus.accepted,
        createdAt: DateTime.now().subtract(const Duration(days: 3)),
      ),
      DepositModel(
        id: '12308',
        bankName: 'Commercial Bank of Ethiopia',
        accountNumber: '1001239810293B',
        accountName: 'Lame Diary P.L.C',
        amount: 310000,
        remark: 'Deposit for credit',
        status: DepositStatus.accepted,
        createdAt: DateTime.now().subtract(const Duration(days: 5)),
      ),
    ];
  }
}
