import 'package:todoapp/domain/entity/task_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'task_model.g.dart';

@JsonSerializable()
class TaskModel extends TaskEntity {
  TaskModel({
    required super.id,
    required super.title,
    required super.description,
    required super.isCompleted,
    required super.createdOn,
  });

  factory TaskModel.fromJson(Map<String, dynamic> json) =>
      _$TaskModelFromJson(json);
  Map<String, dynamic> toJson() => _$TaskModelToJson(this);
}
