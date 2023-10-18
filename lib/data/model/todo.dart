
class Todo {
  final String id;
  final String text;
  bool completed;

  Todo({
    required this.id,
    required this.text,
    this.completed = false,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Todo &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          text == other.text &&
          completed == other.completed;

  @override
  int get hashCode => id.hashCode ^ text.hashCode ^ completed.hashCode;
}
