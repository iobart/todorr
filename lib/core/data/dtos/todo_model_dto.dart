import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';
part 'todo_model_dto.g.dart';

@JsonSerializable()
class TodoModelDto {
  final String title;
  final String description;
  final bool state;
  @JsonKey(
    fromJson: _fromJsonDateTime,
    toJson: _toJsonDateTime,
  )
  final DateTime? date;
  @JsonKey(
    fromJson: _fromJsonDocumentReference,
    toJson: _toJsonDocumentReference,
  )
  final DocumentReference ? createdByUserId;

  TodoModelDto({
    required this.title,
    required this.description,
    required this.state,
    required this.date,
    required this.createdByUserId
  });

    static DocumentReference? _fromJsonDocumentReference(
      DocumentReference? documentReference) {
    return documentReference;
  }

  static DocumentReference? _toJsonDocumentReference(
      DocumentReference? documentReference) {
    return documentReference;
  }

 static DateTime? _fromJsonDateTime(Timestamp? value) => value?.toDate();

  static DateTime? _toJsonDateTime(DateTime? value) => value;

  factory TodoModelDto.fromJson(Map<String,dynamic> json)=>
  _$TodoModelDtoFromJson(json);

  Map<String, dynamic> toJson() =>_$TodoModelDtoToJson(this);
}
