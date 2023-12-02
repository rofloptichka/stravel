import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';

class FoodaroundRecord extends FirestoreRecord {
  FoodaroundRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "sightRef" field.
  DocumentReference? _sightRef;
  DocumentReference? get sightRef => _sightRef;
  bool hasSightRef() => _sightRef != null;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "location" field.
  LatLng? _location;
  LatLng? get location => _location;
  bool hasLocation() => _location != null;

  // "rating" field.
  double? _rating;
  double get rating => _rating ?? 0.0;
  bool hasRating() => _rating != null;

  // "adr" field.
  String? _adr;
  String get adr => _adr ?? '';
  bool hasAdr() => _adr != null;

  // "cost" field.
  int? _cost;
  int get cost => _cost ?? 0;
  bool hasCost() => _cost != null;

  void _initializeFields() {
    _sightRef = snapshotData['sightRef'] as DocumentReference?;
    _name = snapshotData['name'] as String?;
    _location = snapshotData['location'] as LatLng?;
    _rating = castToType<double>(snapshotData['rating']);
    _adr = snapshotData['adr'] as String?;
    _cost = castToType<int>(snapshotData['cost']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('foodaround');

  static Stream<FoodaroundRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => FoodaroundRecord.fromSnapshot(s));

  static Future<FoodaroundRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => FoodaroundRecord.fromSnapshot(s));

  static FoodaroundRecord fromSnapshot(DocumentSnapshot snapshot) =>
      FoodaroundRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static FoodaroundRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      FoodaroundRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'FoodaroundRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is FoodaroundRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createFoodaroundRecordData({
  DocumentReference? sightRef,
  String? name,
  LatLng? location,
  double? rating,
  String? adr,
  int? cost,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'sightRef': sightRef,
      'name': name,
      'location': location,
      'rating': rating,
      'adr': adr,
      'cost': cost,
    }.withoutNulls,
  );

  return firestoreData;
}

class FoodaroundRecordDocumentEquality implements Equality<FoodaroundRecord> {
  const FoodaroundRecordDocumentEquality();

  @override
  bool equals(FoodaroundRecord? e1, FoodaroundRecord? e2) {
    return e1?.sightRef == e2?.sightRef &&
        e1?.name == e2?.name &&
        e1?.location == e2?.location &&
        e1?.rating == e2?.rating &&
        e1?.adr == e2?.adr &&
        e1?.cost == e2?.cost;
  }

  @override
  int hash(FoodaroundRecord? e) => const ListEquality()
      .hash([e?.sightRef, e?.name, e?.location, e?.rating, e?.adr, e?.cost]);

  @override
  bool isValidKey(Object? o) => o is FoodaroundRecord;
}
