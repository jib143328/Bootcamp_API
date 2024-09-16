import 'package:dio/dio.dart';
import 'package:dio_api/core/models/todos.dart';


// class TodosVm{
//    Future<List<Todo>?> getAllTodos() async {
//      Dio dio =Dio();
//      try {
//        // Response<Map<String,dynamic>> res = await dio.get('https://dummyjson.com/todos') as Response<Map<String,dynamic>>;
//        Response res = await dio.get('https://dummyjson.com/todos');
//        //List<Map<String,dynamic>> allTodos=res.data!["todos"].map((e)=><)
//        List<Todo>? allTodos = res.data["todos"].map<Todo>((e) =>
//            ApiResponse.fromJson(e)).toList();
//        print("The Output is =$allTodos");
//        return allTodos;
//      }catch(ex) {
//        print("The ERROR is =$ex");
//
//      }
//      }
//     }


//==================Ahmed Bajandouh
class TodosVm{
  List<Todo> allTodos=[];
  List<Todo> completedTodo=[];
  List<Todo> notCompletedTodo=[];

  Future<List<Todo>?> getAllTodos() async{
    final dio = Dio();
    try {
      Response res = await dio.get("https://dummyjson.com/todos");
      // Map<String,List<Map<String,dynamic>>> alltodo=res.data.map
      ApiResponse? apiResponse = ApiResponse.fromJson(res.data);
      allTodos = apiResponse.todos!;
      completedTodo=allTodos.where((e)=>e.completed!).toList();
      notCompletedTodo=allTodos.where((e)=>!e.completed!).toList();
      return allTodos;
    }catch(ex) {
      print("the exciption is $ex");
      print("the output ${allTodos!.first.todo}");

    }
    }
  Future<List<Todo>?> getComplateTodos() async{
    final dio = Dio();
    try {
      Response res = await dio.get("https://dummyjson.com/todos");
      // Map<String,List<Map<String,dynamic>>> alltodo=res.data.map
      ApiResponse? apiResponse = ApiResponse.fromJson(res.data);
      //allTodos = apiResponse.todos!;
      completedTodo=apiResponse.todos!.where((e)=>e.completed!).toList();
     // notCompletedTodo=allTodos.where((e)=>!e.completed!).toList();
      return completedTodo;
    }catch(ex) {
      print("the exciption is $ex");
    //  print("the output ${completedTodo!.first.todo}");

    }
  }
  Future<List<Todo>?> getUnComplateTodos() async{
    final dio = Dio();
    try {
      Response res = await dio.get("https://dummyjson.com/todos");
      // Map<String,List<Map<String,dynamic>>> alltodo=res.data.map
      ApiResponse? apiResponse = ApiResponse.fromJson(res.data);
      //allTodos = apiResponse.todos!;
      notCompletedTodo=apiResponse.todos!.where((e)=>!e.completed!).toList();
      // notCompletedTodo=allTodos.where((e)=>!e.completed!).toList();
      return notCompletedTodo;
    }catch(ex) {
      print("the exciption is $ex");
      //  print("the output ${completedTodo!.first.todo}");

    }
  }

  Future<List<Todo>?> getSinglTodos(int id) async{
    final dio = Dio();
    try {
      Response res = await dio.get("https://dummyjson.com/todos/$id");
      // Map<String,List<Map<String,dynamic>>> alltodo=res.data.map
      ApiResponse? apiResponse = ApiResponse.fromJson(res.data);
      allTodos = apiResponse.todos!;
     // notCompletedTodo=apiResponse.todos!.where((e)=>!e.completed!).toList();
      // notCompletedTodo=allTodos.where((e)=>!e.completed!).toList();
      return allTodos;
    }catch(ex) {
      print("the exciption is $ex");
      //  print("the output ${completedTodo!.first.todo}");

    }
  }
  }
//=========================================
// Future<List<Todo>?> getdata() async{
//   Dio dio = Dio();
//   try {
//     Response res = await dio.get("https://dummyjson.com/todos");
//     // Map<String,List<Map<String,dynamic>>> alltodo=res.data.map
//     allTodos = res.data['todos'].map<Todo>((e) => Todo.fromJson(e))
//         .toList();
//     print("the output ${allTodos!.first.todo}");
//     return allTodos;
//   }catch(ex) {
//     print("the exciption is $ex");
//     print("the output ${allTodos!.first.todo}");
//
//   }


