import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class NpsResponsesRecord extends FirestoreRecord {
  NpsResponsesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "user_id" field.
  String? _userId;
  String get userId => _userId ?? '';
  bool hasUserId() => _userId != null;

  // "timestamp" field.
  DateTime? _timestamp;
  DateTime? get timestamp => _timestamp;
  bool hasTimestamp() => _timestamp != null;

  // "score" field.
  String? _score;
  String get score => _score ?? '';
  bool hasScore() => _score != null;

  void _initializeFields() {
    _userId = snapshotData['user_id'] as String?;
    _timestamp = snapshotData['timestamp'] as DateTime?;
    _score = snapshotData['score'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('nps_responses');

  static Stream<NpsResponsesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => NpsResponsesRecord.fromSnapshot(s));

  static Future<NpsResponsesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => NpsResponsesRecord.fromSnapshot(s));

  static NpsResponsesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      NpsResponsesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static NpsResponsesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      NpsResponsesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'NpsResponsesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is NpsResponsesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createNpsResponsesRecordData({
  String? userId,
  DateTime? timestamp,
  String? score,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'user_id': userId,
      'timestamp': timestamp,
      'score': score,
    }.withoutNulls,
  );

  return firestoreData;
}

class NpsResponsesRecordDocumentEquality
    implements Equality<NpsResponsesRecord> {
  const NpsResponsesRecordDocumentEquality();

  @override
  bool equals(NpsResponsesRecord? e1, NpsResponsesRecord? e2) {
    return e1?.userId == e2?.userId &&
        e1?.timestamp == e2?.timestamp &&
        e1?.score == e2?.score;
  }

  @override
  int hash(NpsResponsesRecord? e) =>
      const ListEquality().hash([e?.userId, e?.timestamp, e?.score]);

  @override
  bool isValidKey(Object? o) => o is NpsResponsesRecord;
}
