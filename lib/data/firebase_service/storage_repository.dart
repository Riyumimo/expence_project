import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:expence_project/data/models/account.dart';
import 'package:expence_project/data/models/transaction.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../models/user.dart';

abstract class StorageRepository {
  Future<void> getUser();

  Future<void> addUser(UserModel user, String uid);
  Future<void> addAccount(Account account);
  Future<void> addTransaction(TransactionModel transaction, String accountUid);
}

class FirebaseStorageRepository extends StorageRepository {
  final FirebaseFirestore firestore;
  final FirebaseAuth firebaseAuth;

  FirebaseStorageRepository(this.firestore, this.firebaseAuth);

  final userCollection = 'user';
  final accountCollection = 'account';
  final transactionCollection = 'transaction';
  @override
  Future<void> addUser(UserModel user, String uid) async {
    try {
      var uid = firebaseAuth.currentUser?.uid;
      firestore.collection(userCollection).doc(uid).set(user.toFireStore());
    } catch (e) {}
  }

  @override
  Future<void> addAccount(Account account) async {
    try {
      String uid = firebaseAuth.currentUser!.uid;

      // Validasi data akun sebelum menyimpan ke Firestore
      if (account.uid == null) {
        throw Exception('Account UID cannot be empty');
      }
      if (account.accountName.isEmpty) {
        throw Exception('Account name cannot be empty');
      }
      if (account.initialBalance <= 0) {
        throw Exception('Initial balance must be a positive number');
      }
      if (account.accountType.isEmpty) {
        throw Exception('Please select an account type');
      }

      await firestore
          .collection(userCollection)
          .doc(uid)
          .collection(accountCollection)
          .doc(account.uid)
          .set(account.toFirestore(uid));

      throw ('Succsess');
    } catch (e) {
      // Tangani pengecualian atau kesalahan yang terjadi
      print('Error while adding account: $e');
      // Anda bisa mengirimkan event atau memberikan feedback ke pengguna di sini
      throw e;
    }
  }

  @override
  Future<void> addTransaction(
      TransactionModel transaction, String accountUid) async {
    try {
      String uid = firebaseAuth.currentUser!.uid;
      firestore
          .collection(userCollection)
          .doc(uid)
          .collection(accountCollection)
          .doc(accountUid)
          .collection(transactionCollection)
          .doc(transaction.id.toString())
          .set(transaction.toFirestore());
    } catch (e) {}
  }

  @override
  Future<void> getUser() async {
    String uid = firebaseAuth.currentUser!.uid;

    try {
      CollectionReference userRef = firestore.collection(userCollection);
      DocumentSnapshot<Object?> dokumentSnapshot = await userRef.doc(uid).get();
      Map<String, dynamic> data =
          dokumentSnapshot.data() as Map<String, dynamic>;

      print(data);

      // UserModel.fromJson(data);
    } catch (e) {}
  }
}
