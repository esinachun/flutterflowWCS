import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'users_record.g.dart';

abstract class UsersRecord implements Built<UsersRecord, UsersRecordBuilder> {
  static Serializer<UsersRecord> get serializer => _$usersRecordSerializer;

  @nullable
  @BuiltValueField(wireName: 'display_name')
  String get displayName;

  @nullable
  String get email;

  @nullable
  String get password;

  @nullable
  String get uid;

  @nullable
  int get age;

  @nullable
  @BuiltValueField(wireName: 'phone_number')
  String get phoneNumber;

  @nullable
  @BuiltValueField(wireName: 'photo_url')
  String get photoUrl;

  @nullable
  @BuiltValueField(wireName: 'created_time')
  DateTime get createdTime;

  @nullable
  String get userType;

  @nullable
  String get userCenter;

  @nullable
  DocumentReference get userCenterR;

  @nullable
  String get userCar;

  @nullable
  String get userBirthday;

  @nullable
  String get userHeight;

  @nullable
  String get userWeight;

  @nullable
  String get userBicycle;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(UsersRecordBuilder builder) => builder
    ..displayName = ''
    ..email = ''
    ..password = ''
    ..uid = ''
    ..age = 0
    ..phoneNumber = ''
    ..photoUrl = ''
    ..userType = ''
    ..userCenter = ''
    ..userCar = ''
    ..userBirthday = ''
    ..userHeight = ''
    ..userWeight = ''
    ..userBicycle = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('users');

  static Stream<UsersRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  UsersRecord._();
  factory UsersRecord([void Function(UsersRecordBuilder) updates]) =
      _$UsersRecord;

  static UsersRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createUsersRecordData({
  String displayName,
  String email,
  String password,
  String uid,
  int age,
  String phoneNumber,
  String photoUrl,
  DateTime createdTime,
  String userType,
  String userCenter,
  DocumentReference userCenterR,
  String userCar,
  String userBirthday,
  String userHeight,
  String userWeight,
  String userBicycle,
}) =>
    serializers.toFirestore(
        UsersRecord.serializer,
        UsersRecord((u) => u
          ..displayName = displayName
          ..email = email
          ..password = password
          ..uid = uid
          ..age = age
          ..phoneNumber = phoneNumber
          ..photoUrl = photoUrl
          ..createdTime = createdTime
          ..userType = userType
          ..userCenter = userCenter
          ..userCenterR = userCenterR
          ..userCar = userCar
          ..userBirthday = userBirthday
          ..userHeight = userHeight
          ..userWeight = userWeight
          ..userBicycle = userBicycle));
