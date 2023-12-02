import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';

class GuidesRecord extends FirestoreRecord {
  GuidesRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

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

  // "tours" field.
  List<DocumentReference>? _tours;
  List<DocumentReference> get tours => _tours ?? const [];
  bool hasTours() => _tours != null;

  // "userRef" field.
  DocumentReference? _userRef;
  DocumentReference? get userRef => _userRef;
  bool hasUserRef() => _userRef != null;

  void _initializeFields() {
    _displayName = snapshotData['display_name'] as String?;
    _photoUrl = snapshotData['photo_url'] as String?;
    _uid = snapshotData['uid'] as String?;
    _tours = getDataList(snapshotData['tours']);
    _userRef = snapshotData['userRef'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('guides');

  static Stream<GuidesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => GuidesRecord.fromSnapshot(s));

  static Future<GuidesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => GuidesRecord.fromSnapshot(s));

  static GuidesRecord fromSnapshot(DocumentSnapshot snapshot) => GuidesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static GuidesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      GuidesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'GuidesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is GuidesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createGuidesRecordData({
  String? displayName,
  String? photoUrl,
  String? uid,
  DocumentReference? userRef,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'display_name': displayName,
      'photo_url': photoUrl,
      'uid': uid,
      'userRef': userRef,
    }.withoutNulls,
  );

  return firestoreData;
}

class GuidesRecordDocumentEquality implements Equality<GuidesRecord> {
  const GuidesRecordDocumentEquality();

  @override
  bool equals(GuidesRecord? e1, GuidesRecord? e2) {
    const listEquality = ListEquality();
    return e1?.displayName == e2?.displayName &&
        e1?.photoUrl == e2?.photoUrl &&
        e1?.uid == e2?.uid &&
        listEquality.equals(e1?.tours, e2?.tours) &&
        e1?.userRef == e2?.userRef;
  }

  @override
  int hash(GuidesRecord? e) => const ListEquality()
      .hash([e?.displayName, e?.photoUrl, e?.uid, e?.tours, e?.userRef]);

  @override
  bool isValidKey(Object? o) => o is GuidesRecord;
}
