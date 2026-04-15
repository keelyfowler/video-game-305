import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UsersRecord extends FirestoreRecord {
  UsersRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  // "display_name" field.
  String? _displayName;
  String get displayName => _displayName ?? '';
  bool hasDisplayName() => _displayName != null;

  // "photo_url" field.
  String? _photoUrl;
  String get photoUrl => _photoUrl ?? '';
  bool hasPhotoUrl() => _photoUrl != null;

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  bool hasUid() => _uid != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "phone_number" field.
  String? _phoneNumber;
  String get phoneNumber => _phoneNumber ?? '';
  bool hasPhoneNumber() => _phoneNumber != null;

  // "username" field.
  String? _username;
  String get username => _username ?? '';
  bool hasUsername() => _username != null;

  // "bio" field.
  String? _bio;
  String get bio => _bio ?? '';
  bool hasBio() => _bio != null;

  // "favorite_genre" field.
  String? _favoriteGenre;
  String get favoriteGenre => _favoriteGenre ?? '';
  bool hasFavoriteGenre() => _favoriteGenre != null;

  // "favorite_game" field.
  String? _favoriteGame;
  String get favoriteGame => _favoriteGame ?? '';
  bool hasFavoriteGame() => _favoriteGame != null;

  // "discord_name" field.
  String? _discordName;
  String get discordName => _discordName ?? '';
  bool hasDiscordName() => _discordName != null;

  // "twitch_name" field.
  String? _twitchName;
  String get twitchName => _twitchName ?? '';
  bool hasTwitchName() => _twitchName != null;

  // "has_answered_nps" field.
  bool? _hasAnsweredNps;
  bool get hasAnsweredNps => _hasAnsweredNps ?? false;
  bool hasHasAnsweredNps() => _hasAnsweredNps != null;

  void _initializeFields() {
    _email = snapshotData['email'] as String?;
    _displayName = snapshotData['display_name'] as String?;
    _photoUrl = snapshotData['photo_url'] as String?;
    _uid = snapshotData['uid'] as String?;
    _createdTime = snapshotData['created_time'] as DateTime?;
    _phoneNumber = snapshotData['phone_number'] as String?;
    _username = snapshotData['username'] as String?;
    _bio = snapshotData['bio'] as String?;
    _favoriteGenre = snapshotData['favorite_genre'] as String?;
    _favoriteGame = snapshotData['favorite_game'] as String?;
    _discordName = snapshotData['discord_name'] as String?;
    _twitchName = snapshotData['twitch_name'] as String?;
    _hasAnsweredNps = snapshotData['has_answered_nps'] as bool?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('users');

  static Stream<UsersRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => UsersRecord.fromSnapshot(s));

  static Future<UsersRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => UsersRecord.fromSnapshot(s));

  static UsersRecord fromSnapshot(DocumentSnapshot snapshot) => UsersRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static UsersRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      UsersRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'UsersRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is UsersRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createUsersRecordData({
  String? email,
  String? displayName,
  String? photoUrl,
  String? uid,
  DateTime? createdTime,
  String? phoneNumber,
  String? username,
  String? bio,
  String? favoriteGenre,
  String? favoriteGame,
  String? discordName,
  String? twitchName,
  bool? hasAnsweredNps,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'email': email,
      'display_name': displayName,
      'photo_url': photoUrl,
      'uid': uid,
      'created_time': createdTime,
      'phone_number': phoneNumber,
      'username': username,
      'bio': bio,
      'favorite_genre': favoriteGenre,
      'favorite_game': favoriteGame,
      'discord_name': discordName,
      'twitch_name': twitchName,
      'has_answered_nps': hasAnsweredNps,
    }.withoutNulls,
  );

  return firestoreData;
}

class UsersRecordDocumentEquality implements Equality<UsersRecord> {
  const UsersRecordDocumentEquality();

  @override
  bool equals(UsersRecord? e1, UsersRecord? e2) {
    return e1?.email == e2?.email &&
        e1?.displayName == e2?.displayName &&
        e1?.photoUrl == e2?.photoUrl &&
        e1?.uid == e2?.uid &&
        e1?.createdTime == e2?.createdTime &&
        e1?.phoneNumber == e2?.phoneNumber &&
        e1?.username == e2?.username &&
        e1?.bio == e2?.bio &&
        e1?.favoriteGenre == e2?.favoriteGenre &&
        e1?.favoriteGame == e2?.favoriteGame &&
        e1?.discordName == e2?.discordName &&
        e1?.twitchName == e2?.twitchName &&
        e1?.hasAnsweredNps == e2?.hasAnsweredNps;
  }

  @override
  int hash(UsersRecord? e) => const ListEquality().hash([
        e?.email,
        e?.displayName,
        e?.photoUrl,
        e?.uid,
        e?.createdTime,
        e?.phoneNumber,
        e?.username,
        e?.bio,
        e?.favoriteGenre,
        e?.favoriteGame,
        e?.discordName,
        e?.twitchName,
        e?.hasAnsweredNps
      ]);

  @override
  bool isValidKey(Object? o) => o is UsersRecord;
}
