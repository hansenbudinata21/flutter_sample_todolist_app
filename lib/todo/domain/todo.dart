class Todo {
  String id;
  String title;
  bool isDone;

  Todo({
    required this.id,
    required this.title,
    this.isDone = false,
  });

  @override
  bool operator ==(dynamic other) {
    if (identical(this, other)) {
      return true;
    }

    return (other is Todo && other.id == id);
  }

  @override
  int get hashCode => id.hashCode;
}
