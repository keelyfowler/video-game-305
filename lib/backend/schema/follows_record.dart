import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class FollowsRecord extends FirestoreRecord {
  FollowsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "follower_ref" field.
  DocumentReference? _followerRef;
  DocumentReference? get followerRef => _followerRef;
  bool hasFollowerRef() => _followerRef != null;

  // "following_ref" field.
  String? _followingRef;
  String get followingRef => _followingRef ?? '';
  bool hasFollowingRef() => _followingRef != null;

  void _initializeFields() {
    _followerRef = snapshotData['follower_ref'] as DocumentReference?;
    _followingRef = snapshotData['following_ref'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('follows');

  static Stream<FollowsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => FollowsRecord.fromSnapshot(s));

  static Future<FollowsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => FollowsRecord.fromSnapshot(s));

  static FollowsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      FollowsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static FollowsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      FollowsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'FollowsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is FollowsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createFollowsRecordData({
  DocumentReference? followerRef,
  String? followingRef,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'follower_ref': followerRef,
      'following_ref': followingRef,
    }.withoutNulls,
  );

  return firestoreData;
}

class FollowsRecordDocumentEquality implements Equality<FollowsRecord> {
  const FollowsRecordDocumentEquality();

  @override
  bool equals(FollowsRecord? e1, FollowsRecord? e2) {
    return e1?.followerRef == e2?.followerRef &&
        e1?.followingRef == e2?.followingRef;
  }

  @override
  int hash(FollowsRecord? e) =>
      const ListEquality().hash([e?.followerRef, e?.followingRef]);

  @override
  bool isValidKey(Object? o) => o is FollowsRecord;
}
