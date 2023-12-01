import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';

class TripsRecord extends FirestoreRecord {
  TripsRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "propertyRef" field.
  DocumentReference? _propertyRef;
  DocumentReference? get propertyRef => _propertyRef;
  bool hasPropertyRef() => _propertyRef != null;

  // "userRef" field.
  DocumentReference? _userRef;
  DocumentReference? get userRef => _userRef;
  bool hasUserRef() => _userRef != null;

  // "tripBeginDate" field.
  DateTime? _tripBeginDate;
  DateTime? get tripBeginDate => _tripBeginDate;
  bool hasTripBeginDate() => _tripBeginDate != null;

  // "tripEndDate" field.
  DateTime? _tripEndDate;
  DateTime? get tripEndDate => _tripEndDate;
  bool hasTripEndDate() => _tripEndDate != null;

  // "guests" field.
  int? _guests;
  int get guests => _guests ?? 0;
  bool hasGuests() => _guests != null;

  // "paymentMethod" field.
  String? _paymentMethod;
  String get paymentMethod => _paymentMethod ?? '';
  bool hasPaymentMethod() => _paymentMethod != null;

  // "tripCreated" field.
  DateTime? _tripCreated;
  DateTime? get tripCreated => _tripCreated;
  bool hasTripCreated() => _tripCreated != null;

  // "host" field.
  DocumentReference? _host;
  DocumentReference? get host => _host;
  bool hasHost() => _host != null;

  // "cancelTrip" field.
  bool? _cancelTrip;
  bool get cancelTrip => _cancelTrip ?? false;
  bool hasCancelTrip() => _cancelTrip != null;

  // "cancelReason" field.
  String? _cancelReason;
  String get cancelReason => _cancelReason ?? '';
  bool hasCancelReason() => _cancelReason != null;

  // "tripTotal" field.
  int? _tripTotal;
  int get tripTotal => _tripTotal ?? 0;
  bool hasTripTotal() => _tripTotal != null;

  // "upcoming" field.
  bool? _upcoming;
  bool get upcoming => _upcoming ?? false;
  bool hasUpcoming() => _upcoming != null;

  // "complete" field.
  bool? _complete;
  bool get complete => _complete ?? false;
  bool hasComplete() => _complete != null;

  // "rated" field.
  bool? _rated;
  bool get rated => _rated ?? false;
  bool hasRated() => _rated != null;

  // "favorite" field.
  bool? _favorite;
  bool get favorite => _favorite ?? false;
  bool hasFavorite() => _favorite != null;

  void _initializeFields() {
    _propertyRef = snapshotData['propertyRef'] as DocumentReference?;
    _userRef = snapshotData['userRef'] as DocumentReference?;
    _tripBeginDate = snapshotData['tripBeginDate'] as DateTime?;
    _tripEndDate = snapshotData['tripEndDate'] as DateTime?;
    _guests = castToType<int>(snapshotData['guests']);
    _paymentMethod = snapshotData['paymentMethod'] as String?;
    _tripCreated = snapshotData['tripCreated'] as DateTime?;
    _host = snapshotData['host'] as DocumentReference?;
    _cancelTrip = snapshotData['cancelTrip'] as bool?;
    _cancelReason = snapshotData['cancelReason'] as String?;
    _tripTotal = castToType<int>(snapshotData['tripTotal']);
    _upcoming = snapshotData['upcoming'] as bool?;
    _complete = snapshotData['complete'] as bool?;
    _rated = snapshotData['rated'] as bool?;
    _favorite = snapshotData['favorite'] as bool?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('trips');

  static Stream<TripsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => TripsRecord.fromSnapshot(s));

  static Future<TripsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => TripsRecord.fromSnapshot(s));

  static TripsRecord fromSnapshot(DocumentSnapshot snapshot) => TripsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static TripsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      TripsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'TripsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is TripsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createTripsRecordData({
  DocumentReference? propertyRef,
  DocumentReference? userRef,
  DateTime? tripBeginDate,
  DateTime? tripEndDate,
  int? guests,
  String? paymentMethod,
  DateTime? tripCreated,
  DocumentReference? host,
  bool? cancelTrip,
  String? cancelReason,
  int? tripTotal,
  bool? upcoming,
  bool? complete,
  bool? rated,
  bool? favorite,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'propertyRef': propertyRef,
      'userRef': userRef,
      'tripBeginDate': tripBeginDate,
      'tripEndDate': tripEndDate,
      'guests': guests,
      'paymentMethod': paymentMethod,
      'tripCreated': tripCreated,
      'host': host,
      'cancelTrip': cancelTrip,
      'cancelReason': cancelReason,
      'tripTotal': tripTotal,
      'upcoming': upcoming,
      'complete': complete,
      'rated': rated,
      'favorite': favorite,
    }.withoutNulls,
  );

  return firestoreData;
}

class TripsRecordDocumentEquality implements Equality<TripsRecord> {
  const TripsRecordDocumentEquality();

  @override
  bool equals(TripsRecord? e1, TripsRecord? e2) {
    return e1?.propertyRef == e2?.propertyRef &&
        e1?.userRef == e2?.userRef &&
        e1?.tripBeginDate == e2?.tripBeginDate &&
        e1?.tripEndDate == e2?.tripEndDate &&
        e1?.guests == e2?.guests &&
        e1?.paymentMethod == e2?.paymentMethod &&
        e1?.tripCreated == e2?.tripCreated &&
        e1?.host == e2?.host &&
        e1?.cancelTrip == e2?.cancelTrip &&
        e1?.cancelReason == e2?.cancelReason &&
        e1?.tripTotal == e2?.tripTotal &&
        e1?.upcoming == e2?.upcoming &&
        e1?.complete == e2?.complete &&
        e1?.rated == e2?.rated &&
        e1?.favorite == e2?.favorite;
  }

  @override
  int hash(TripsRecord? e) => const ListEquality().hash([
        e?.propertyRef,
        e?.userRef,
        e?.tripBeginDate,
        e?.tripEndDate,
        e?.guests,
        e?.paymentMethod,
        e?.tripCreated,
        e?.host,
        e?.cancelTrip,
        e?.cancelReason,
        e?.tripTotal,
        e?.upcoming,
        e?.complete,
        e?.rated,
        e?.favorite
      ]);

  @override
  bool isValidKey(Object? o) => o is TripsRecord;
}
