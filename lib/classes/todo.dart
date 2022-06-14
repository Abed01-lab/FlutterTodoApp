class Todo {
  String description;
  int priority;
  String title;
  String docId;

  String get getdocId => docId;
  String get getDescription => description;
  int get getPriority => priority;
  String get getTitle => title;

  void setDescription(String description) => this.description = description;
  void setPriority(int priority) => this.priority = priority;

  Todo(
      {required this.description,
      required this.priority,
      required this.title,
      required this.docId});

  Map<String, dynamic> toFirestore() {
    return {
      'todoTitle': title,
      'todoDescription': description,
      'todoPriority': priority
    };
  }
}
