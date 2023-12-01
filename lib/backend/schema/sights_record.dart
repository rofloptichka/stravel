import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';

class SightsRecord extends FirestoreRecord {
  SightsRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "Name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "Description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  // "Photo" field.
  List<String>? _photo;
  List<String> get photo => _photo ?? const [];
  bool hasPhoto() => _photo != null;

  // "Location" field.
  LatLng? _location;
  LatLng? get location => _location;
  bool hasLocation() => _location != null;

  void _initializeFields() {
    _name = snapshotData['Name'] as String?;
    _description = snapshotData['Description'] as String?;
    _photo = getDataList(snapshotData['Photo']);
    _location = snapshotData['Location'] as LatLng?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('sights');

  static Stream<SightsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => SightsRecord.fromSnapshot(s));

  static Future<SightsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => SightsRecord.fromSnapshot(s));

  static SightsRecord fromSnapshot(DocumentSnapshot snapshot) => SightsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static SightsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      SightsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'SightsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is SightsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createSightsRecordData({
  String? name,
  String? description,
  LatLng? location,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'Name': name,
      'Description': description,
      'Location': location,
    }.withoutNulls,
  );

  return firestoreData;
}

class SightsRecordDocumentEquality implements Equality<SightsRecord> {
  const SightsRecordDocumentEquality();

  @override
  bool equals(SightsRecord? e1, SightsRecord? e2) {
    const listEquality = ListEquality();
    return e1?.name == e2?.name &&
        e1?.description == e2?.description &&
        listEquality.equals(e1?.photo, e2?.photo) &&
        e1?.location == e2?.location;
  }

  @override
  int hash(SightsRecord? e) => const ListEquality()
      .hash([e?.name, e?.description, e?.photo, e?.location]);

  @override
  bool isValidKey(Object? o) => o is SightsRecord;
}
