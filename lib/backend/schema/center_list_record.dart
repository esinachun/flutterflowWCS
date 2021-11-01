import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'center_list_record.g.dart';

abstract class CenterListRecord
    implements Built<CenterListRecord, CenterListRecordBuilder> {
  static Serializer<CenterListRecord> get serializer =>
      _$centerListRecordSerializer;

  @nullable
  BuiltList<DocumentReference> get centerArray;

  @nullable
  BuiltList<String> get centerStringArray;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(CenterListRecordBuilder builder) => builder
    ..centerArray = ListBuilder()
    ..centerStringArray = ListBuilder();

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('centerList');

  static Stream<CenterListRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  CenterListRecord._();
  factory CenterListRecord([void Function(CenterListRecordBuilder) updates]) =
      _$CenterListRecord;

  static CenterListRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createCenterListRecordData() => serializers.toFirestore(
    CenterListRecord.serializer,
    CenterListRecord((c) => c
      ..centerArray = null
      ..centerStringArray = null));
