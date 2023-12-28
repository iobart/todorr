// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todo_model_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TodoModelDto _$TodoModelDtoFromJson(Map<String, dynamic> json) => TodoModelDto(
      title: json['title'] as String,
      description: json['description'] as String,
      state: json['state'] as bool,
      date: TodoModelDto._fromJsonDateTime(json['date'] as Timestamp?),
      createdByUserId: TodoModelDto._fromJsonDocumentReference(
          json['createdByUserId'] as DocumentReference<Object?>?),
      translated: (json['translated'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, e as String),
      ),
    );

Map<String, dynamic> _$TodoModelDtoToJson(TodoModelDto instance) =>
    <String, dynamic>{
      'title': instance.title,
      'description': instance.description,
      'translated': instance.translated,
      'state': instance.state,
      'date': TodoModelDto._toJsonDateTime(instance.date),
      'createdByUserId':
          TodoModelDto._toJsonDocumentReference(instance.createdByUserId),
    };
