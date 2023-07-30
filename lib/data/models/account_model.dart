import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:uuid/uuid.dart';

class Account {
  final String? uid;
  final String? userId;
  final String? name;
  final String? accountName;
  final String? accountType;
  final double? initialBalance;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  Account({
    String? id,
    this.accountName,
    this.name,
    this.initialBalance,
    this.accountType,
    this.userId,
    this.createdAt,
    this.updatedAt,
  }) : uid = id ?? const Uuid().v4();
  factory Account.fromFirestore(Map<String, dynamic> data) {
    return Account(
      id: data['uid'],
      userId: data['userId'] ?? '',
      accountName: data['accountName'] ?? '',
      name: data['name'] ?? '',
      initialBalance: data['initialBalance'] ?? '',
      accountType: data['accountType'] ?? '',
      createdAt: (data['createdAt'] as Timestamp).toDate(),
      updatedAt: (data['updatedAt'] as Timestamp).toDate(),
    );
  }
  Map<String, dynamic> toFirestore(String userUid) {
    return {
      'uid': uid,
      'userId': userUid,
      'accountName': accountName,
      'initialBalance': initialBalance,
      'name': name,
      'createdAt': Timestamp.fromDate(createdAt!),
      'updatedAt': Timestamp.fromDate(updatedAt!),
    };
  }
}
