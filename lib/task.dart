final String tableTasks = 'tasks';

class TaskFields {
  static final List<String> values = [id, title, description];

  static final String id = '_id';
  static final String title = 'title';
  static final String description = 'description';
}

class Task {
  int? id;
  final String title;
  final String description;

  Task({this.id, required this.title, required this.description});

  Task copy({
    int? id,
    String? title,
    String? description,
  }) =>
      Task(
        id: id ?? this.id,
        title: title ?? this.title,
        description: description ?? this.description,
      );
  static Task fromJson(Map<String, Object?> json) => Task(
      id: json[TaskFields.id] as int?,
      title: json[TaskFields.title] as String,
      description: json[TaskFields.description] as String);

  Map<String, Object?> toJson() => {
        TaskFields.id: id,
        TaskFields.title: title,
        TaskFields.description: description,
      };
}
