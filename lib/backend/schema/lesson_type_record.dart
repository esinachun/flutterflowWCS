import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'lesson_type_record.g.dart';

abstract class LessonTypeRecord
    implements Built<LessonTypeRecord, LessonTypeRecordBuilder> {
  static Serializer<LessonTypeRecord> get serializer =>
      _$lessonTypeRecordSerializer;

  @nullable
  DocumentReference get master;

  @nullable
  DocumentReference get center;

  @nullable
  String get lessonName;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(LessonTypeRecordBuilder builder) =>
      builder..lessonName = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('lessonType');

  static Stream<LessonTypeRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  LessonTypeRecord._();
  factory LessonTypeRecord([void Function(LessonTypeRecordBuilder) updates]) =
      _$LessonTypeRecord;

  static LessonTypeRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createLessonTypeRecordData({
  DocumentReference master,
  DocumentReference center,
  String lessonName,
}) =>
    serializers.toFirestore(
        LessonTypeRecord.serializer,
        LessonTypeRecord((l) => l
          ..master = master
          ..center = center
          ..lessonName = lessonName));
