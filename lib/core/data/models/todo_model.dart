import 'package:cloud_firestore/cloud_firestore.dart';

class TodoModel {
  final String title;
  final String description;
  final bool state;
  final DateTime date;
  final DocumentReference? createdByUserId;

  TodoModel({
    required this.title,
    required this.description,
    required this.state,
    required this.date,
    this.createdByUserId
  });

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'description': description,
      'state': state,
      'date': date,
      'createdByUserId': createdByUserId,
    };
  }
  }