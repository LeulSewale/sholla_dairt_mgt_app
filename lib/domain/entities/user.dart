import 'package:equatable/equatable.dart';

class User extends Equatable {
  final String id;
  final String name;
  final String email;
  final String phone;
  final double balance;
  final int purchasingLimit;

  const User({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.balance,
    required this.purchasingLimit,
  });

  @override
  List<Object> get props => [id, name, email, phone, balance, purchasingLimit];
}
