import 'package:hive/hive.dart';
part 'todo_model.g.dart';

@HiveType(typeId: 1)
class TodoModel {
  @HiveField(1)
  final String id;
  @HiveField(2)
  final String description;
  @HiveField(3)
  final bool completed;
  @HiveField(4)
  final DateTime dateTime;
  @HiveField(5)
  final String timeOfDay;

  TodoModel(
      {this.id,
      this.description,
      this.completed = false,
      this.dateTime,
      this.timeOfDay});
}
