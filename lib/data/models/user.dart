import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  // final int id;
  final String name;
  final String email;
  final DateTime createdAt;
  final DateTime updatedAt;

  UserModel(
    this.name,
    this.email,
    this.createdAt,
    this.updatedAt,
  );
  factory UserModel.fromJson(Map<String, dynamic> data) {
    return UserModel(
        data['name'],
        data['email'],
        (data['createdAt'] as Timestamp).toDate(),
        (data['updatedAt'] as Timestamp).toDate());
  }

  Map<String, dynamic> toFireStore() {
    return {
      'name': name,
      'email': email,
      'createdAt': Timestamp.fromDate(createdAt),
      'updatedAt': Timestamp.fromDate(updatedAt)
    };
  }
}
