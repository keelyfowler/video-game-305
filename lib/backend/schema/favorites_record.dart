import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class FavoritesRecord extends FirestoreRecord {
  FavoritesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "game_name" field.
  String? _gameName;
  String get gameName => _gameName ?? '';
  bool hasGameName() => _gameName != null;

  // "game_desc" field.
  String? _gameDesc;
  String get gameDesc => _gameDesc ?? '';
  bool hasGameDesc() => _gameDesc != null;

  // "user_ref" field.
  DocumentReference? _userRef;
  DocumentReference? get userRef => _userRef;
  bool hasUserRef() => _userRef != null;

  // "user_id" field.
  int? _userId;
  int get userId => _userId ?? 0;
  bool hasUserId() => _userId != null;

  // "game_pic" field.
  String? _gamePic;
  String get gamePic => _gamePic ?? '';
  bool hasGamePic() => _gamePic != null;

  void _initializeFields() {
    _gameName = snapshotData['game_name'] as String?;
    _gameDesc = snapshotData['game_desc'] as String?;
    _userRef = snapshotData['user_ref'] as DocumentReference?;
    _userId = castToType<int>(snapshotData['user_id']);
    _gamePic = snapshotData['game_pic'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('favorites');

  static Stream<FavoritesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => FavoritesRecord.fromSnapshot(s));

  static Future<FavoritesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => FavoritesRecord.fromSnapshot(s));

  static FavoritesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      FavoritesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static FavoritesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      FavoritesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'FavoritesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is FavoritesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createFavoritesRecordData({
  String? gameName,
  String? gameDesc,
  DocumentReference? userRef,
  int? userId,
  String? gamePic,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'game_name': gameName,
      'game_desc': gameDesc,
      'user_ref': userRef,
      'user_id': userId,
      'game_pic': gamePic,
    }.withoutNulls,
  );

  return firestoreData;
}

class FavoritesRecordDocumentEquality implements Equality<FavoritesRecord> {
  const FavoritesRecordDocumentEquality();

  @override
  bool equals(FavoritesRecord? e1, FavoritesRecord? e2) {
    return e1?.gameName == e2?.gameName &&
        e1?.gameDesc == e2?.gameDesc &&
        e1?.userRef == e2?.userRef &&
        e1?.userId == e2?.userId &&
        e1?.gamePic == e2?.gamePic;
  }

  @override
  int hash(FavoritesRecord? e) => const ListEquality()
      .hash([e?.gameName, e?.gameDesc, e?.userRef, e?.userId, e?.gamePic]);

  @override
  bool isValidKey(Object? o) => o is FavoritesRecord;
}
