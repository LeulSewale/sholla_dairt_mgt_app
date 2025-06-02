import 'package:dairy_management/core/constants/app_constants.dart';
import 'package:dairy_management/presentation/pages/notification/notification.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import '../../bloc/deposit/deposit_bloc.dart';
import '../../widgets/deposit_history.dart';

class DepositPage extends StatefulWidget {
  const DepositPage({super.key});

  @override
  State<DepositPage> createState() => _DepositPageState();
}

class _DepositPageState extends State<DepositPage> {
  final _formKey = GlobalKey<FormState>();
  final _bankNameController = TextEditingController();
  final _accountNumberController = TextEditingController();
  final _accountNameController = TextEditingController();
  final _amountController = TextEditingController();
  final _remarkController = TextEditingController();
  File? _selectedImage;

  @override
  void initState() {
    super.initState();
    context.read<DepositBloc>().add(LoadDepositHistory());

    // Pre-fill with sample data
    _bankNameController.text = 'Commercial Bank of Ethiopia';
    _accountNumberController.text = '1001239810293B';
    _accountNameController.text = 'Lame Diary P.L.C';
    _amountController.text = '200,000';
    _remarkController.text = 'Deposit For credit';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Credite Management'),        
        actions: [
          CircleAvatar(
                      radius: 24,
                      backgroundColor: Colors.white,
                    
                  
            child: IconButton(
              icon: const Icon(Icons.notifications, color: AppColors.primery),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => NotificationPage()),
                );
              },
            ),
              )
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Deposit',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),

            // Deposit Form
            Card(
              elevation: 0,
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Bank Name',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold)),
                                SizedBox(height: 8),
                                Text(
                                  'Commerial Bank Of Ethiopia',
                                ),
                              ],
                            ),
                          ),
                          SizedBox(width: 16),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Bank Account Number',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold)),
                                SizedBox(height: 8),
                                Text(
                                  '10000023344555',
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      const Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Account Name',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold)),
                                SizedBox(height: 8),
                                Text(
                                  'Lame Diary PLC',
                                ),
                              ],
                            ),
                          ),
                          SizedBox(width: 16),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Amount',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold)),
                                SizedBox(height: 8),
                                Text(
                                  '2000,000 Bir',
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      const Text('Remark',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      const SizedBox(height: 8),
                      const Text(
                        'Deposite fire credit',
                      ),
                      const SizedBox(height: 16),
                      const Text('Upload Image',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      const SizedBox(height: 8),
                      GestureDetector(
                        onTap: _pickImage,
                        child: Container(
                          width: double.infinity,
                          height: 120,
                          decoration: BoxDecoration(
                            border: Border.all(
                                color: AppColors.primery,
                                style: BorderStyle.solid),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: _selectedImage != null
                              ? ClipRRect(
                                  borderRadius: BorderRadius.circular(8),
                                  child: Image.file(_selectedImage!,
                                      fit: BoxFit.cover),
                                )
                              : const Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(Icons.upload,
                                        color: AppColors.primery, size: 32),
                                    SizedBox(height: 8),
                                    Text('Upload Image',
                                        style: TextStyle(
                                            color: AppColors.primery)),
                                  ],
                                ),
                        ),
                      ),
                      const SizedBox(height: 24),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: _submitDeposit,
                          style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(vertical: 16),
                          ),
                          child: const Text('Send Deposit'),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            const SizedBox(height: 24),

            // History Section
            const Text(
              'History',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),

            // Search and Filter Row
            Row(
              children: [
                const Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      fillColor: Colors.white,
                      hintText: 'Search for Credit Deposit',
                      prefixIcon: Icon(Icons.search),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Container(
                  decoration: BoxDecoration(
                    color: AppColors.primery,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: IconButton(
                    icon: const Icon(Icons.filter_list, color: Colors.white),
                    onPressed: () {
                      // Show filter options
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),

            // Deposit History
            Card(
                elevation: 0,
              child: const DepositHistory()),
          ],
        ),
      ),
    );
  }

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _selectedImage = File(pickedFile.path);
      });
    }
  }

  void _submitDeposit() {
    if (_formKey.currentState!.validate()) {
      context.read<DepositBloc>().add(
            CreateDeposit(
              bankName: _bankNameController.text,
              accountNumber: _accountNumberController.text,
              accountName: _accountNameController.text,
              amount:
                  double.tryParse(_amountController.text.replaceAll(',', '')) ??
                      0,
              remark: _remarkController.text,
              imagePath: _selectedImage?.path,
            ),
          );
    }
  }

  @override
  void dispose() {
    _bankNameController.dispose();
    _accountNumberController.dispose();
    _accountNameController.dispose();
    _amountController.dispose();
    _remarkController.dispose();
    super.dispose();
  }
}
