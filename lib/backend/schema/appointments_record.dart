import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'appointments_record.g.dart';

abstract class AppointmentsRecord
    implements Built<AppointmentsRecord, AppointmentsRecordBuilder> {
  static Serializer<AppointmentsRecord> get serializer =>
      _$appointmentsRecordSerializer;

  @nullable
  String get appointmentName;

  @nullable
  String get appointmentDescription;

  @nullable
  DocumentReference get appointmentPerson;

  @nullable
  DateTime get appointmentTime;

  @nullable
  String get appointmentType;

  @nullable
  String get appointmentEmail;

  @nullable
  String get email;

  @nullable
  @BuiltValueField(wireName: 'display_name')
  String get displayName;

  @nullable
  @BuiltValueField(wireName: 'photo_url')
  String get photoUrl;

  @nullable
  String get uid;

  @nullable
  @BuiltValueField(wireName: 'created_time')
  DateTime get createdTime;

  @nullable
  @BuiltValueField(wireName: 'phone_number')
  String get phoneNumber;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(AppointmentsRecordBuilder builder) => builder
    ..appointmentName = ''
    ..appointmentDescription = ''
    ..appointmentType = ''
    ..appointmentEmail = ''
    ..email = ''
    ..displayName = ''
    ..photoUrl = ''
    ..uid = ''
    ..phoneNumber = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('appointments');

  static Stream<AppointmentsRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  AppointmentsRecord._();
  factory AppointmentsRecord(
          [void Function(AppointmentsRecordBuilder) updates]) =
      _$AppointmentsRecord;

  static AppointmentsRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createAppointmentsRecordData({
  String appointmentName,
  String appointmentDescription,
  DocumentReference appointmentPerson,
  DateTime appointmentTime,
  String appointmentType,
  String appointmentEmail,
  String email,
  String displayName,
  String photoUrl,
  String uid,
  DateTime createdTime,
  String phoneNumber,
}) =>
    serializers.toFirestore(
        AppointmentsRecord.serializer,
        AppointmentsRecord((a) => a
          ..appointmentName = appointmentName
          ..appointmentDescription = appointmentDescription
          ..appointmentPerson = appointmentPerson
          ..appointmentTime = appointmentTime
          ..appointmentType = appointmentType
          ..appointmentEmail = appointmentEmail
          ..email = email
          ..displayName = displayName
          ..photoUrl = photoUrl
          ..uid = uid
          ..createdTime = createdTime
          ..phoneNumber = phoneNumber));
