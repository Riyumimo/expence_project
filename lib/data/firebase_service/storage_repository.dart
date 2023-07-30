import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:expence_project/data/models/account_model.dart';
import 'package:expence_project/data/models/transaction_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:uuid/uuid.dart';

import '../models/user_model.dart';

abstract class StorageRepository {
  Future<UserModel> getUser();
  Future<List<Account>>? getAccount();
  Future<List<TransactionModel>>? getAllTransaction();
  Future<String?> uploadImageToFirebase(File imageFile);
  Future<void> addUser(UserModel user, String uid);
  Future<void> addAccount(Account account);
  Future<void> addTransaction(TransactionModel transaction, String accountUid);
  Future<void> deleteUser();
  Future<void> deleteAccount();
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
    } catch (e) {
      rethrow;
    }
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
      String? uid = firebaseAuth.currentUser?.uid;
      if (uid == null) {
        throw Exception("User is not authenticated.");
      }

      final transactionRef = firestore
          .collection(userCollection)
          .doc(uid)
          .collection(accountCollection)
          .doc(accountUid)
          .collection(transactionCollection)
          .doc(transaction.id.toString());

      await transactionRef.set(transaction.toFirestore());
    } catch (e) {
      // Jangan gunakan 'rethrow' tanpa alasan khusus, cukup log pesan errornya.
      print("Error adding transaction: $e");
      // Handle error jika diperlukan.
      throw e;
    }
  }

  @override
  Future<UserModel> getUser() async {
    print('getUser....');
    String uid = firebaseAuth.currentUser!.uid;
    try {
      DocumentSnapshot<Map<String, dynamic>> documentSnapshot =
          await firestore.collection(userCollection).doc(uid).get();

      if (documentSnapshot.exists) {
        Map<String, dynamic> data = documentSnapshot.data()!;
        print(data);
        return UserModel.fromJson(data);
      } else {
        throw Exception('User data not found for uid: $uid');
      }
    } catch (e) {
      print('Error occurred while fetching user data: $e');
      rethrow; // Rethrow the error to propagate it to the calling code.
    }
  }

  @override
  Future<List<Account>>? getAccount() async {
    print('get account...');
    if (firebaseAuth.currentUser == null) {
      // Handle the case when the user is not authenticated.
      throw Exception('User is not authenticated.');
    }
    String uid = firebaseAuth.currentUser!.uid;
    try {
      CollectionReference accountRef = firestore
          .collection(userCollection)
          .doc(uid)
          .collection(accountCollection);

      QuerySnapshot<Object?> querySnapshot = await accountRef.get();
      List<Account> accountList = querySnapshot.docs.map((document) {
        Map<String, dynamic>? data = document.data() as Map<String, dynamic>;
        if (data.isEmpty) {
          throw Exception('Data not available for document: ${document.id}');
        }
        return Account.fromFirestore(data);
      }).toList();

      print('get Account list');
      return accountList;
    } catch (e) {
      print('Error occurred while fetching accounts: $e');
      return []; // Rethrow the error to propagate it to the calling code.
    }
  }

  @override
  Future<List<TransactionModel>>? getAllTransaction() async {
    print('get transaction...');

    if (firebaseAuth.currentUser == null) {
      // Handle the case when the user is not authenticated.
      throw Exception('User is not authenticated.');
    }

    try {
      String uid = firebaseAuth.currentUser!.uid;
      CollectionReference transactionCollection = firestore
          .collection(userCollection)
          .doc(uid)
          .collection(accountCollection)
          .doc()
          .collection(this.transactionCollection);

      QuerySnapshot<Object?> querySnapshot = await transactionCollection.get();
      List<TransactionModel> transactionList = querySnapshot.docs.map((e) {
        Map<String, dynamic> data = e.data() as Map<String, dynamic>;
        if (data.isEmpty) {
          throw Exception('Data not available for document: ${e.id}');
        }
        return TransactionModel.fromFireStore(data);
      }).toList();
      return transactionList;
    } on Exception catch (e) {
      print('Error occurred while fetching accounts: $e');
      return []; // R
    }
    // throw UnimplementedError();
  }

  @override
  Future<void> deleteUser() async {
    print('delete user...');
    if (firebaseAuth.currentUser == null) {
      // Handle the case when the user is not authenticated.
      throw Exception('User is not authenticated.');
    }
    try {
      CollectionReference collectionRef =
          FirebaseFirestore.instance.collection(userCollection);
      QuerySnapshot snapshot = await collectionRef.get();

      WriteBatch batch = FirebaseFirestore.instance.batch();

      for (var doc in snapshot.docs) {
        batch.delete(doc.reference);
      }

      // Commit the batched write to delete all documents.
      await batch.commit();
      print('Document deleted successfully');
    } catch (e) {
      print('Error deleting document: $e');
    }
  }

  @override
  Future<void> deleteAccount() async {
    print('delete account....');
    if (firebaseAuth.currentUser == null) {
// Handle the case when the user is not authenticated.
      throw Exception('User is not authenticated.');
    }
    String uid = firebaseAuth.currentUser!.uid;
    try {
      CollectionReference accountCollectionReference = firestore
          .collection(accountCollection)
          .doc(uid)
          .collection(accountCollection);
      await accountCollectionReference.doc().delete();
    } on FirebaseException catch (e) {
      print(e);
      rethrow;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<String?> uploadImageToFirebase(File imageFile) async {
    try {
      // Create a unique file name for the image
      String fileName = const Uuid().v4();

      // Reference the storage location and upload the file
      final Reference storageReference =
          FirebaseStorage.instance.ref().child('images/$fileName');
      final UploadTask uploadTask = storageReference.putFile(imageFile);

      // Wait for the upload to complete and get the image URL
      TaskSnapshot taskSnapshot = await uploadTask.whenComplete(() => {});
      String imageUrl = await taskSnapshot.ref.getDownloadURL();

      // Use the imageUrl for further processing or saving in the database
      print('Image uploaded. URL: $imageUrl');
      return imageUrl;
    } catch (e) {
      print('Error uploading image to Firebase: $e');
      return null;
    }
  }
}
