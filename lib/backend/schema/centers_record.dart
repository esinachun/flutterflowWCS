import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'centers_record.g.dart';

abstract class CentersRecord
    implements Built<CentersRecord, CentersRecordBuilder> {
  static Serializer<CentersRecord> get serializer => _$centersRecordSerializer;

  @nullable
  @BuiltValueField(wireName: 'display_name')
  String get displayName;

  @nullable
  String get uid;

  @nullable
  LatLng get location;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(CentersRecordBuilder builder) => builder
    ..displayName = ''
    ..uid = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('centers');

  static Stream<CentersRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  CentersRecord._();
  factory CentersRecord([void Function(CentersRecordBuilder) updates]) =
      _$CentersRecord;

  static CentersRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createCentersRecordData({
  String displayName,
  String uid,
  LatLng location,
}) =>
    serializers.toFirestore(
        CentersRecord.serializer,
        CentersRecord((c) => c
          ..displayName = displayName
          ..uid = uid
          ..location = location));
