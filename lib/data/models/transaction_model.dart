import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:uuid/uuid.dart';

class TransactionModel {
  final String? id;
  final String? accountUid; // Income or Expense
  final String? type;
  final String? url;
  final double? amount;
  final String? description;
  final String? category;
  final DateTime createdAt;
  final DateTime updatedAt;

  TransactionModel({
    String? uid,
    required this.accountUid,
    required this.type,
    required this.url,
    required this.amount,
    required this.description,
    required this.category,
    required this.createdAt,
    required this.updatedAt,
  }) : id = uid ?? const Uuid().v4();

  factory TransactionModel.fromFireStore(Map<String?, dynamic> data) {
    return TransactionModel(
      uid: data['id'] ?? '',
      accountUid: data['accountUid'] ?? '',
      type: data['type'] ?? '',
      url: data['url'] ?? '',
      amount: data['amount'] ?? '',
      description: data['description'] ?? '',
      category: data['category'] ?? '',
      createdAt: (data['createdAt' as Timestamp]).toDate(),
      updatedAt: data['updatedAt' as Timestamp].toDate(),
    );
  }
  // Konversi objek TransactionModel menjadi Map untuk menyimpan di Firestore
  Map<String, dynamic> toFirestore() {
    return {
      'id': id,
      'accountUid': accountUid,
      'type': type,
      'url': url,
      'amount': amount,
      'description': description,
      'category': category,
      'createdAt': Timestamp.fromDate(createdAt),
      'updatedAt': Timestamp.fromDate(updatedAt),
    };
  }
}
