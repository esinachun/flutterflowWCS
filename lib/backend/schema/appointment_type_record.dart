import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'appointment_type_record.g.dart';

abstract class AppointmentTypeRecord
    implements Built<AppointmentTypeRecord, AppointmentTypeRecordBuilder> {
  static Serializer<AppointmentTypeRecord> get serializer =>
      _$appointmentTypeRecordSerializer;

  @nullable
  String get uid;

  @nullable
  String get aptTypeName;

  @nullable
  int get durationTime;

  @nullable
  String get description;

  @nullable
  DocumentReference get mater;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(AppointmentTypeRecordBuilder builder) =>
      builder
        ..uid = ''
        ..aptTypeName = ''
        ..durationTime = 0
        ..description = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('appointmentType');

  static Stream<AppointmentTypeRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  AppointmentTypeRecord._();
  factory AppointmentTypeRecord(
          [void Function(AppointmentTypeRecordBuilder) updates]) =
      _$AppointmentTypeRecord;

  static AppointmentTypeRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createAppointmentTypeRecordData({
  String uid,
  String aptTypeName,
  int durationTime,
  String description,
  DocumentReference mater,
}) =>
    serializers.toFirestore(
        AppointmentTypeRecord.serializer,
        AppointmentTypeRecord((a) => a
          ..uid = uid
          ..aptTypeName = aptTypeName
          ..durationTime = durationTime
          ..description = description
          ..mater = mater));
