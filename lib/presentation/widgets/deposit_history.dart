import 'package:dairy_management/presentation/bloc/deposit/deposit_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/entities/deposit.dart';

class DepositHistory extends StatelessWidget {
  const DepositHistory({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DepositBloc, DepositState>(
      builder: (context, state) {
        if (state is DepositLoading) {
          return const Center(child: CircularProgressIndicator());
        }

        if (state is DepositError) {
          return Center(child: Text('Error: ${state.message}'));
        }

        if (state is DepositLoaded) {
          return ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: state.deposits.length,
            itemBuilder: (context, index) {
              final deposit = state.deposits[index];
              return DepositCard(deposit: deposit);
            },
          );
        }

        return const SizedBox();
      },
    );
  }
}

class DepositCard extends StatelessWidget {
  final Deposit deposit;

  const DepositCard({super.key, required this.deposit});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      margin: const EdgeInsets.only(bottom: 8),
      child: ListTile(
        leading: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.blue.withOpacity(0.1),
            borderRadius: BorderRadius.circular(8),
          ),
          child: const Icon(Icons.account_balance, color: Colors.blue),
        ),
        title: Text(
          'Deposit #${deposit.id}',
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text('${deposit.amount.toInt()},000 Birr'),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            _buildStatusChip(deposit.status),
            const SizedBox(width: 8),
            TextButton(
              onPressed: () {
                // View deposit details
              },
              child: const Text('View Details'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatusChip(DepositStatus status) {
    Color color;
    String text;

    switch (status) {
      case DepositStatus.pending:
        color = Colors.orange;
        text = 'Pending';
        break;
      case DepositStatus.accepted:
        color = Colors.green;
        text = 'Accepted';
        break;
      case DepositStatus.rejected:
        color = Colors.red;
        text = 'Rejected';
        break;
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        text,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 12,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
