import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';

class PropertiesRecord extends FirestoreRecord {
  PropertiesRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "propertyName" field.
  String? _propertyName;
  String get propertyName => _propertyName ?? '';
  bool hasPropertyName() => _propertyName != null;

  // "propertyDescription" field.
  String? _propertyDescription;
  String get propertyDescription => _propertyDescription ?? '';
  bool hasPropertyDescription() => _propertyDescription != null;

  // "propertyLocation" field.
  LatLng? _propertyLocation;
  LatLng? get propertyLocation => _propertyLocation;
  bool hasPropertyLocation() => _propertyLocation != null;

  // "propertyAddress" field.
  String? _propertyAddress;
  String get propertyAddress => _propertyAddress ?? '';
  bool hasPropertyAddress() => _propertyAddress != null;

  // "price" field.
  int? _price;
  int get price => _price ?? 0;
  bool hasPrice() => _price != null;

  // "discount" field.
  int? _discount;
  int get discount => _discount ?? 0;
  bool hasDiscount() => _discount != null;

  // "image" field.
  List<String>? _image;
  List<String> get image => _image ?? const [];
  bool hasImage() => _image != null;

  // "owner" field.
  DocumentReference? _owner;
  DocumentReference? get owner => _owner;
  bool hasOwner() => _owner != null;

  // "Pool" field.
  bool? _pool;
  bool get pool => _pool ?? false;
  bool hasPool() => _pool != null;

  // "AC" field.
  bool? _ac;
  bool get ac => _ac ?? false;
  bool hasAc() => _ac != null;

  // "Laundry" field.
  bool? _laundry;
  bool get laundry => _laundry ?? false;
  bool hasLaundry() => _laundry != null;

  // "GYM" field.
  bool? _gym;
  bool get gym => _gym ?? false;
  bool hasGym() => _gym != null;

  // "Bar" field.
  bool? _bar;
  bool get bar => _bar ?? false;
  bool hasBar() => _bar != null;

  // "Events" field.
  bool? _events;
  bool get events => _events ?? false;
  bool hasEvents() => _events != null;

  // "lastUpdated" field.
  DateTime? _lastUpdated;
  DateTime? get lastUpdated => _lastUpdated;
  bool hasLastUpdated() => _lastUpdated != null;

  // "Type" field.
  String? _type;
  String get type => _type ?? '';
  bool hasType() => _type != null;

  void _initializeFields() {
    _propertyName = snapshotData['propertyName'] as String?;
    _propertyDescription = snapshotData['propertyDescription'] as String?;
    _propertyLocation = snapshotData['propertyLocation'] as LatLng?;
    _propertyAddress = snapshotData['propertyAddress'] as String?;
    _price = castToType<int>(snapshotData['price']);
    _discount = castToType<int>(snapshotData['discount']);
    _image = getDataList(snapshotData['image']);
    _owner = snapshotData['owner'] as DocumentReference?;
    _pool = snapshotData['Pool'] as bool?;
    _ac = snapshotData['AC'] as bool?;
    _laundry = snapshotData['Laundry'] as bool?;
    _gym = snapshotData['GYM'] as bool?;
    _bar = snapshotData['Bar'] as bool?;
    _events = snapshotData['Events'] as bool?;
    _lastUpdated = snapshotData['lastUpdated'] as DateTime?;
    _type = snapshotData['Type'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('properties');

  static Stream<PropertiesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => PropertiesRecord.fromSnapshot(s));

  static Future<PropertiesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => PropertiesRecord.fromSnapshot(s));

  static PropertiesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      PropertiesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static PropertiesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      PropertiesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'PropertiesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is PropertiesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createPropertiesRecordData({
  String? propertyName,
  String? propertyDescription,
  LatLng? propertyLocation,
  String? propertyAddress,
  int? price,
  int? discount,
  DocumentReference? owner,
  bool? pool,
  bool? ac,
  bool? laundry,
  bool? gym,
  bool? bar,
  bool? events,
  DateTime? lastUpdated,
  String? type,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'propertyName': propertyName,
      'propertyDescription': propertyDescription,
      'propertyLocation': propertyLocation,
      'propertyAddress': propertyAddress,
      'price': price,
      'discount': discount,
      'owner': owner,
      'Pool': pool,
      'AC': ac,
      'Laundry': laundry,
      'GYM': gym,
      'Bar': bar,
      'Events': events,
      'lastUpdated': lastUpdated,
      'Type': type,
    }.withoutNulls,
  );

  return firestoreData;
}

class PropertiesRecordDocumentEquality implements Equality<PropertiesRecord> {
  const PropertiesRecordDocumentEquality();

  @override
  bool equals(PropertiesRecord? e1, PropertiesRecord? e2) {
    const listEquality = ListEquality();
    return e1?.propertyName == e2?.propertyName &&
        e1?.propertyDescription == e2?.propertyDescription &&
        e1?.propertyLocation == e2?.propertyLocation &&
        e1?.propertyAddress == e2?.propertyAddress &&
        e1?.price == e2?.price &&
        e1?.discount == e2?.discount &&
        listEquality.equals(e1?.image, e2?.image) &&
        e1?.owner == e2?.owner &&
        e1?.pool == e2?.pool &&
        e1?.ac == e2?.ac &&
        e1?.laundry == e2?.laundry &&
        e1?.gym == e2?.gym &&
        e1?.bar == e2?.bar &&
        e1?.events == e2?.events &&
        e1?.lastUpdated == e2?.lastUpdated &&
        e1?.type == e2?.type;
  }

  @override
  int hash(PropertiesRecord? e) => const ListEquality().hash([
        e?.propertyName,
        e?.propertyDescription,
        e?.propertyLocation,
        e?.propertyAddress,
        e?.price,
        e?.discount,
        e?.image,
        e?.owner,
        e?.pool,
        e?.ac,
        e?.laundry,
        e?.gym,
        e?.bar,
        e?.events,
        e?.lastUpdated,
        e?.type
      ]);

  @override
  bool isValidKey(Object? o) => o is PropertiesRecord;
}
