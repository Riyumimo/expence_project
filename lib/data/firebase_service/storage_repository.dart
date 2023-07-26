import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:expence_project/data/models/account.dart';
import 'package:expence_project/data/models/transaction.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../models/user.dart';

abstract class StorageRepository {
  Future<void> getUser();
  Future<void> addUser(UserModel user, String uid);
  Future<void> addAccount(Account account);
  Future<List<Account>> getAccount();

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
      if (account.accountName == null) {
        throw Exception('Account name cannot be empty');
      }
      if (account.initialBalance == null) {
        throw Exception('Initial balance must be a positive number');
      }
      if (account.accountType == null) {
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
      rethrow;
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

  @override
  Future<List<Account>> getAccount() async {
    print('get account...');
    String uid = firebaseAuth.currentUser!.uid;
    try {
      CollectionReference accountRef = firestore
          .collection(userCollection)
          .doc(uid)
          .collection(accountCollection);

      QuerySnapshot<Object?> querySnapshot = await accountRef.get();
      List<Account> accountList = querySnapshot.docs.map((document) {
        Map<String, dynamic>? data = document.data() as Map<String, dynamic>;
        if (data == null) {
          throw Exception('Data not available for document: ${document.id}');
        }
        return Account.fromFirestore(data);
      }).toList();

      print('complete');
      return accountList;
    } catch (e) {
      print('Error occurred while fetching accounts: $e');
      rethrow; // Rethrow the error to propagate it to the calling code.
    }
  }
}
