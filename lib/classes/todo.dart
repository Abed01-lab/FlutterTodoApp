class Todo {
  String description;
  String priority;

  String get getDescription => description;
  String get getPriority => priority;

  void setDescription(String description) => this.description = description;
  void setPriority(String priority) => this.priority = priority;

  Todo({required this.description, required this.priority});
}
