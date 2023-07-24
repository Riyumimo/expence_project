import 'package:cloud_firestore/cloud_firestore.dart';

class Account {
  final String uid;
  final String userId;
  final String accountName;
  final double initialBalance;
  final String description;
  final DateTime createdAt;
  final DateTime updatedAt;

  Account(this.accountName, this.initialBalance, this.description,
      this.createdAt, this.updatedAt, this.uid, this.userId);

  Map<String, dynamic> toFirestore() {
    return {
      'uid': uid,
      'userId': userId,
      'accountName': accountName,
      'initialBalance': initialBalance,
      'description': description,
      'createdAt': Timestamp.fromDate(createdAt),
      'updatedAt': Timestamp.fromDate(updatedAt),
    };
  }
}
