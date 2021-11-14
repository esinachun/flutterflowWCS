import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'master_record.g.dart';

abstract class MasterRecord
    implements Built<MasterRecord, MasterRecordBuilder> {
  static Serializer<MasterRecord> get serializer => _$masterRecordSerializer;

  @nullable
  DocumentReference get userRef;

  @nullable
  BuiltList<DocumentReference> get centerRef;

  @nullable
  BuiltList<String> get lessonType;

  @nullable
  BuiltList<DocumentReference> get lessonRefList;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(MasterRecordBuilder builder) => builder
    ..centerRef = ListBuilder()
    ..lessonType = ListBuilder()
    ..lessonRefList = ListBuilder();

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('master');

  static Stream<MasterRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  MasterRecord._();
  factory MasterRecord([void Function(MasterRecordBuilder) updates]) =
      _$MasterRecord;

  static MasterRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createMasterRecordData({
  DocumentReference userRef,
}) =>
    serializers.toFirestore(
        MasterRecord.serializer,
        MasterRecord((m) => m
          ..userRef = userRef
          ..centerRef = null
          ..lessonType = null
          ..lessonRefList = null));
