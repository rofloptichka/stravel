import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';

class RouteRecord extends FirestoreRecord {
  RouteRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "usersRef" field.
  List<DocumentReference>? _usersRef;
  List<DocumentReference> get usersRef => _usersRef ?? const [];
  bool hasUsersRef() => _usersRef != null;

  // "properties" field.
  DocumentReference? _properties;
  DocumentReference? get properties => _properties;
  bool hasProperties() => _properties != null;

  // "events" field.
  List<DocumentReference>? _events;
  List<DocumentReference> get events => _events ?? const [];
  bool hasEvents() => _events != null;

  // "finished" field.
  bool? _finished;
  bool get finished => _finished ?? false;
  bool hasFinished() => _finished != null;

  // "Date" field.
  DateTime? _date;
  DateTime? get date => _date;
  bool hasDate() => _date != null;

  // "HasOwnHouse" field.
  bool? _hasOwnHouse;
  bool get hasOwnHouse => _hasOwnHouse ?? false;
  bool hasHasOwnHouse() => _hasOwnHouse != null;

  // "Name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "Price" field.
  int? _price;
  int get price => _price ?? 0;
  bool hasPrice() => _price != null;

  void _initializeFields() {
    _usersRef = getDataList(snapshotData['usersRef']);
    _properties = snapshotData['properties'] as DocumentReference?;
    _events = getDataList(snapshotData['events']);
    _finished = snapshotData['finished'] as bool?;
    _date = snapshotData['Date'] as DateTime?;
    _hasOwnHouse = snapshotData['HasOwnHouse'] as bool?;
    _name = snapshotData['Name'] as String?;
    _price = castToType<int>(snapshotData['Price']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Route');

  static Stream<RouteRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => RouteRecord.fromSnapshot(s));

  static Future<RouteRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => RouteRecord.fromSnapshot(s));

  static RouteRecord fromSnapshot(DocumentSnapshot snapshot) => RouteRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static RouteRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      RouteRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'RouteRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is RouteRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createRouteRecordData({
  DocumentReference? properties,
  bool? finished,
  DateTime? date,
  bool? hasOwnHouse,
  String? name,
  int? price,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'properties': properties,
      'finished': finished,
      'Date': date,
      'HasOwnHouse': hasOwnHouse,
      'Name': name,
      'Price': price,
    }.withoutNulls,
  );

  return firestoreData;
}

class RouteRecordDocumentEquality implements Equality<RouteRecord> {
  const RouteRecordDocumentEquality();

  @override
  bool equals(RouteRecord? e1, RouteRecord? e2) {
    const listEquality = ListEquality();
    return listEquality.equals(e1?.usersRef, e2?.usersRef) &&
        e1?.properties == e2?.properties &&
        listEquality.equals(e1?.events, e2?.events) &&
        e1?.finished == e2?.finished &&
        e1?.date == e2?.date &&
        e1?.hasOwnHouse == e2?.hasOwnHouse &&
        e1?.name == e2?.name &&
        e1?.price == e2?.price;
  }

  @override
  int hash(RouteRecord? e) => const ListEquality().hash([
        e?.usersRef,
        e?.properties,
        e?.events,
        e?.finished,
        e?.date,
        e?.hasOwnHouse,
        e?.name,
        e?.price
      ]);

  @override
  bool isValidKey(Object? o) => o is RouteRecord;
}
