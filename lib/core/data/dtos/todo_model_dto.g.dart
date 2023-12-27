// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todo_model_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TodoModelDto _$TodoModelDtoFromJson(Map<String, dynamic> json) => TodoModelDto(
      title: json['title'] as String,
      description: json['description'] as String,
      state: json['state'] as bool,
      date: DateTime.parse(json['date'] as String),
      createdByUserId: TodoModelDto._fromJsonDocumentReference(
          json['createdByUserId'] as DocumentReference<Object?>?),
    );

Map<String, dynamic> _$TodoModelDtoToJson(TodoModelDto instance) =>
    <String, dynamic>{
      'title': instance.title,
      'description': instance.description,
      'state': instance.state,
      'date': instance.date.toIso8601String(),
      'createdByUserId':
          TodoModelDto._toJsonDocumentReference(instance.createdByUserId),
    };
