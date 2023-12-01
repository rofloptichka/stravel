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

  // "Name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "HasVegeterianFood" field.
  bool? _hasVegeterianFood;
  bool get hasVegeterianFood => _hasVegeterianFood ?? false;
  bool hasHasVegeterianFood() => _hasVegeterianFood != null;

  // "Address" field.
  String? _address;
  String get address => _address ?? '';
  bool hasAddress() => _address != null;

  // "Location" field.
  LatLng? _location;
  LatLng? get location => _location;
  bool hasLocation() => _location != null;

  // "Description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  // "Rating" field.
  double? _rating;
  double get rating => _rating ?? 0.0;
  bool hasRating() => _rating != null;

  void _initializeFields() {
    _name = snapshotData['Name'] as String?;
    _hasVegeterianFood = snapshotData['HasVegeterianFood'] as bool?;
    _address = snapshotData['Address'] as String?;
    _location = snapshotData['Location'] as LatLng?;
    _description = snapshotData['Description'] as String?;
    _rating = castToType<double>(snapshotData['Rating']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Food');

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
  bool? hasVegeterianFood,
  String? address,
  LatLng? location,
  String? description,
  double? rating,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'Name': name,
      'HasVegeterianFood': hasVegeterianFood,
      'Address': address,
      'Location': location,
      'Description': description,
      'Rating': rating,
    }.withoutNulls,
  );

  return firestoreData;
}

class FoodRecordDocumentEquality implements Equality<FoodRecord> {
  const FoodRecordDocumentEquality();

  @override
  bool equals(FoodRecord? e1, FoodRecord? e2) {
    return e1?.name == e2?.name &&
        e1?.hasVegeterianFood == e2?.hasVegeterianFood &&
        e1?.address == e2?.address &&
        e1?.location == e2?.location &&
        e1?.description == e2?.description &&
        e1?.rating == e2?.rating;
  }

  @override
  int hash(FoodRecord? e) => const ListEquality().hash([
        e?.name,
        e?.hasVegeterianFood,
        e?.address,
        e?.location,
        e?.description,
        e?.rating
      ]);

  @override
  bool isValidKey(Object? o) => o is FoodRecord;
}
