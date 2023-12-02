import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';

class EventsRecord extends FirestoreRecord {
  EventsRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "Name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "DateAndTime" field.
  DateTime? _dateAndTime;
  DateTime? get dateAndTime => _dateAndTime;
  bool hasDateAndTime() => _dateAndTime != null;

  // "City" field.
  String? _city;
  String get city => _city ?? '';
  bool hasCity() => _city != null;

  // "Type" field.
  String? _type;
  String get type => _type ?? '';
  bool hasType() => _type != null;

  // "Photo" field.
  String? _photo;
  String get photo => _photo ?? '';
  bool hasPhoto() => _photo != null;

  // "Location" field.
  LatLng? _location;
  LatLng? get location => _location;
  bool hasLocation() => _location != null;

  // "Price" field.
  int? _price;
  int get price => _price ?? 0;
  bool hasPrice() => _price != null;

  void _initializeFields() {
    _name = snapshotData['Name'] as String?;
    _dateAndTime = snapshotData['DateAndTime'] as DateTime?;
    _city = snapshotData['City'] as String?;
    _type = snapshotData['Type'] as String?;
    _photo = snapshotData['Photo'] as String?;
    _location = snapshotData['Location'] as LatLng?;
    _price = castToType<int>(snapshotData['Price']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('events');

  static Stream<EventsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => EventsRecord.fromSnapshot(s));

  static Future<EventsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => EventsRecord.fromSnapshot(s));

  static EventsRecord fromSnapshot(DocumentSnapshot snapshot) => EventsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static EventsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      EventsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'EventsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is EventsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createEventsRecordData({
  String? name,
  DateTime? dateAndTime,
  String? city,
  String? type,
  String? photo,
  LatLng? location,
  int? price,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'Name': name,
      'DateAndTime': dateAndTime,
      'City': city,
      'Type': type,
      'Photo': photo,
      'Location': location,
      'Price': price,
    }.withoutNulls,
  );

  return firestoreData;
}

class EventsRecordDocumentEquality implements Equality<EventsRecord> {
  const EventsRecordDocumentEquality();

  @override
  bool equals(EventsRecord? e1, EventsRecord? e2) {
    return e1?.name == e2?.name &&
        e1?.dateAndTime == e2?.dateAndTime &&
        e1?.city == e2?.city &&
        e1?.type == e2?.type &&
        e1?.photo == e2?.photo &&
        e1?.location == e2?.location &&
        e1?.price == e2?.price;
  }

  @override
  int hash(EventsRecord? e) => const ListEquality().hash([
        e?.name,
        e?.dateAndTime,
        e?.city,
        e?.type,
        e?.photo,
        e?.location,
        e?.price
      ]);

  @override
  bool isValidKey(Object? o) => o is EventsRecord;
}
