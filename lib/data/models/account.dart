import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:uuid/uuid.dart';

class Account {
  final String? uid;
  final String? userId;
  final String name;
  final String accountName;
  final String accountType;
  final double initialBalance;
  final DateTime createdAt;
  final DateTime updatedAt;

  Account(this.accountName, this.initialBalance, this.name, this.createdAt,
      this.updatedAt, this.accountType, this.userId)
      : uid = const Uuid().v4();

  Map<String, dynamic> toFirestore(String userUid) {
    return {
      'uid': uid,
      'userId': userUid,
      'accountName': accountName,
      'initialBalance': initialBalance,
      'name': name,
      'createdAt': Timestamp.fromDate(createdAt),
      'updatedAt': Timestamp.fromDate(updatedAt),
    };
  }
}
