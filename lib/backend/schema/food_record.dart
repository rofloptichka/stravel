import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';

class FoodRecord extends FirestoreRecord {
  FoodRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "location" field.
  LatLng? _location;
  LatLng? get location => _location;
  bool hasLocation() => _location != null;

  // "photos" field.
  List<String>? _photos;
  List<String> get photos => _photos ?? const [];
  bool hasPhotos() => _photos != null;

  // "address" field.
  String? _address;
  String get address => _address ?? '';
  bool hasAddress() => _address != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
    _location = snapshotData['location'] as LatLng?;
    _photos = getDataList(snapshotData['photos']);
    _address = snapshotData['address'] as String?;
    _description = snapshotData['description'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('food');

  static Stream<FoodRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => FoodRecord.fromSnapshot(s));

  static Future<FoodRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => FoodRecord.fromSnapshot(s));

  static FoodRecord fromSnapshot(DocumentSnapshot snapshot) => FoodRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static FoodRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      FoodRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'FoodRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is FoodRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createFoodRecordData({
  String? name,
  LatLng? location,
  String? address,
  String? description,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
      'location': location,
      'address': address,
      'description': description,
    }.withoutNulls,
  );

  return firestoreData;
}

class FoodRecordDocumentEquality implements Equality<FoodRecord> {
  const FoodRecordDocumentEquality();

  @override
  bool equals(FoodRecord? e1, FoodRecord? e2) {
    const listEquality = ListEquality();
    return e1?.name == e2?.name &&
        e1?.location == e2?.location &&
        listEquality.equals(e1?.photos, e2?.photos) &&
        e1?.address == e2?.address &&
        e1?.description == e2?.description;
  }

  @override
  int hash(FoodRecord? e) => const ListEquality()
      .hash([e?.name, e?.location, e?.photos, e?.address, e?.description]);

  @override
  bool isValidKey(Object? o) => o is FoodRecord;
}
