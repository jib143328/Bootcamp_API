class ApiResponse {
  List<Todo>? todos;
  int? total;
  int? skip;
  int? limit;

  ApiResponse({this.todos, this.total, this.skip, this.limit});

  ApiResponse.fromJson(Map<String, dynamic> json) {
    if (json['todos'] != null) {
      todos = <Todo>[];
      json['todos'].forEach((v) {
        todos!.add(new Todo.fromJson(v));
      });
    }
    total = json['total'];
    skip = json['skip'];
    limit = json['limit'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.todos != null) {
      data['todos'] = this.todos!.map((v) => v.toJson()).toList();
    }
    data['total'] = this.total;
    data['skip'] = this.skip;
    data['limit'] = this.limit;
    return data;
  }
}

class Todo {
  int? id;
  String? todo;
  bool? completed;
  int? userId;

  Todo({this.id, this.todo, this.completed, this.userId});

  Todo.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    todo = json['todo'];
    completed = json['completed'];
    userId = json['userId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['todo'] = this.todo;
    data['completed'] = this.completed;
    data['userId'] = this.userId;
    return data;
  }
}

//===============================================
// class Todos {
//   List<Todos2>? todos;
//
//   Todos({this.todos});
//
//   Todos.fromJson(Map<String, dynamic> json) {
//     if (json['todos'] != null) {
//       todos = <Todos2>[];
//       json['todos'].forEach((v) {
//         todos!.add(new Todos2.fromJson(v));
//       });
//     }
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     if (this.todos != null) {
//       data['todos'] = this.todos!.map((v) => v.toJson()).toList();
//     }
//     return data;
//   }
// }
//
// class Todos2 {
//   int? id;
//   String? todo;
//   bool? completed;
//   int? userId;
//
//   Todos2({this.id, this.todo, this.completed, this.userId});
//
//   Todos2.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     todo = json['todo'];
//     completed = json['completed'];
//     userId = json['userId'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['todo'] = this.todo;
//     data['completed'] = this.completed;
//     data['userId'] = this.userId;
//     return data;
//   }
// }
