import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';

class ToursRecord extends FirestoreRecord {
  ToursRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "display_name" field.
  String? _displayName;
  String get displayName => _displayName ?? '';
  bool hasDisplayName() => _displayName != null;

  // "display_photo" field.
  List<String>? _displayPhoto;
  List<String> get displayPhoto => _displayPhoto ?? const [];
  bool hasDisplayPhoto() => _displayPhoto != null;

  // "uid" field.
  List<String>? _uid;
  List<String> get uid => _uid ?? const [];
  bool hasUid() => _uid != null;

  // "isOrg" field.
  bool? _isOrg;
  bool get isOrg => _isOrg ?? false;
  bool hasIsOrg() => _isOrg != null;

  // "guideRef" field.
  DocumentReference? _guideRef;
  DocumentReference? get guideRef => _guideRef;
  bool hasGuideRef() => _guideRef != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  // "rating" field.
  bool? _rating;
  bool get rating => _rating ?? false;
  bool hasRating() => _rating != null;

  // "userRef" field.
  DocumentReference? _userRef;
  DocumentReference? get userRef => _userRef;
  bool hasUserRef() => _userRef != null;

  // "sightREF" field.
  DocumentReference? _sightREF;
  DocumentReference? get sightREF => _sightREF;
  bool hasSightREF() => _sightREF != null;

  void _initializeFields() {
    _displayName = snapshotData['display_name'] as String?;
    _displayPhoto = getDataList(snapshotData['display_photo']);
    _uid = getDataList(snapshotData['uid']);
    _isOrg = snapshotData['isOrg'] as bool?;
    _guideRef = snapshotData['guideRef'] as DocumentReference?;
    _description = snapshotData['description'] as String?;
    _rating = snapshotData['rating'] as bool?;
    _userRef = snapshotData['userRef'] as DocumentReference?;
    _sightREF = snapshotData['sightREF'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('tours');

  static Stream<ToursRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ToursRecord.fromSnapshot(s));

  static Future<ToursRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ToursRecord.fromSnapshot(s));

  static ToursRecord fromSnapshot(DocumentSnapshot snapshot) => ToursRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ToursRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ToursRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ToursRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ToursRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createToursRecordData({
  String? displayName,
  bool? isOrg,
  DocumentReference? guideRef,
  String? description,
  bool? rating,
  DocumentReference? userRef,
  DocumentReference? sightREF,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'display_name': displayName,
      'isOrg': isOrg,
      'guideRef': guideRef,
      'description': description,
      'rating': rating,
      'userRef': userRef,
      'sightREF': sightREF,
    }.withoutNulls,
  );

  return firestoreData;
}

class ToursRecordDocumentEquality implements Equality<ToursRecord> {
  const ToursRecordDocumentEquality();

  @override
  bool equals(ToursRecord? e1, ToursRecord? e2) {
    const listEquality = ListEquality();
    return e1?.displayName == e2?.displayName &&
        listEquality.equals(e1?.displayPhoto, e2?.displayPhoto) &&
        listEquality.equals(e1?.uid, e2?.uid) &&
        e1?.isOrg == e2?.isOrg &&
        e1?.guideRef == e2?.guideRef &&
        e1?.description == e2?.description &&
        e1?.rating == e2?.rating &&
        e1?.userRef == e2?.userRef &&
        e1?.sightREF == e2?.sightREF;
  }

  @override
  int hash(ToursRecord? e) => const ListEquality().hash([
        e?.displayName,
        e?.displayPhoto,
        e?.uid,
        e?.isOrg,
        e?.guideRef,
        e?.description,
        e?.rating,
        e?.userRef,
        e?.sightREF
      ]);

  @override
  bool isValidKey(Object? o) => o is ToursRecord;
}
