import 'package:cloud_firestore/cloud_firestore.dart';

class TransactionModel {
  final int id;
  final String type; // Income or Expense
  final String name;
  final double amount;
  final DateTime date;
  final String description;
  final int categoryId;
  final DateTime createdAt;
  final DateTime updatedAt;

  TransactionModel(
    this.id,
    this.type,
    this.name,
    this.amount,
    this.date,
    this.description,
    this.categoryId,
    this.createdAt,
    this.updatedAt,
  );
  // Konversi objek TransactionModel menjadi Map untuk menyimpan di Firestore
  Map<String, dynamic> toFirestore() {
    return {
      'id': id,
      'type': type,
      'name': name,
      'amount': amount,
      'date': Timestamp.fromDate(date),
      'description': description,
      'categoryId': categoryId,
      'createdAt': Timestamp.fromDate(createdAt),
      'updatedAt': Timestamp.fromDate(updatedAt),
    };
  }
}
