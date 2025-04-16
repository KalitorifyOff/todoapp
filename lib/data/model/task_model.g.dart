// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TaskModel _$TaskModelFromJson(Map<String, dynamic> json) => TaskModel(
  id: json['id'] as String?,
  title: json['title'] as String?,
  description: json['description'] as String?,
  isCompleted: json['isCompleted'] as bool?,
  createdOn: json['createdOn'] as String?,
);

Map<String, dynamic> _$TaskModelToJson(TaskModel instance) => <String, dynamic>{
  'id': instance.id,
  'title': instance.title,
  'description': instance.description,
  'isCompleted': instance.isCompleted,
  'createdOn': instance.createdOn,
};
