import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String uid;
  final String username;
  final String fullName;
  final String email;
  final String phoneNumber;
  final bool isOnline;
  final Timestamp lastseen;
  final Timestamp createdAt;
  final String? fcmTocken;
  final List<String> blockedUsers;

  UserModel({
    required this.uid,
    required this.username,
    required this.fullName,
    required this.email,
    required this.phoneNumber,
    this.isOnline = false,
    Timestamp? lastseen,
    Timestamp? createdAt,
    this.fcmTocken,
    this.blockedUsers = const [],
  }) : lastseen = lastseen ?? Timestamp.now(),
       createdAt = createdAt ?? Timestamp.now();

  UserModel copyWith({
    String? uid,
    String? username,
    String? fullName,
    String? email,
    String? phoneNumber,
    bool? isOnline,
    Timestamp? lastseen,
    Timestamp? createdAt,
    String? cmTocken,
    List<String>? blockedUsers,
  }) {
    return UserModel(
      uid: uid ?? this.uid,
      username: username ?? this.username,
      fullName: fullName ?? this.fullName,
      email: email ?? this.email,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      isOnline: isOnline ?? this.isOnline,
      lastseen: lastseen ?? this.lastseen,
      createdAt: createdAt ?? this.createdAt,
      fcmTocken: cmTocken ?? this.fcmTocken,
      blockedUsers: blockedUsers ?? this.blockedUsers,
    );
  }

  factory UserModel.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return UserModel(
      uid: doc.id,
      username: data['username'] ?? '',
      fullName: data['fullName'] ?? '',
      email: data['email'] ?? '',
      phoneNumber: data['phoneNumber'] ?? '',
      isOnline: data['isOnline'] ?? false,
      lastseen: data['lastseen'] ?? Timestamp.now(),
      createdAt: data['createdAt'] ?? Timestamp.now(),
      fcmTocken: data['cmTocken'] ?? '',
      blockedUsers: List<String>.from(data['blockedUsers'] ?? []),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'username': username,
      'fullName': fullName,
      'email': email,
      'phoneNumber': phoneNumber,
      'isOnline': isOnline,
      'lastseen': lastseen,
      'createdAt': createdAt,
      'cmTocken': fcmTocken,
      'blockedUsers': blockedUsers,
    };
  }
}
