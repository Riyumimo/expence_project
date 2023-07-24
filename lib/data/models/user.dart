import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserModel {
  final int id;
  final String name;
  final String email;
  final DateTime createdAt;
  final DateTime updatedAt;

  UserModel(this.id, this.name, this.email, this.createdAt, this.updatedAt);
  factory UserModel.fromJson(Map<String, dynamic> data) {
    return UserModel(
      data['id'],
      data['name'],
      data['email'],
      (data['createdAt'] as Timestamp).toDate(),
      (data['updatedAt'] as Timestamp).toDate(),
    );
  }

  Map<String, dynamic> toFireStore() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'createdAt': createdAt,
      'updatedAt': updatedAt
    };
  }
}
