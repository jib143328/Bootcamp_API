import 'package:dio_api/core/view_models/todos_vm.dart';
import 'package:dio_api/core/views/screens/Todos/complate_todo.dart';
import 'package:dio_api/core/views/screens/Todos/single_todos.dart';
import 'package:dio_api/core/views/screens/Todos/uncomplate.dart';
import 'package:flutter/material.dart';

class TodosScreen extends StatefulWidget {
  const TodosScreen({super.key});

  @override
  State<TodosScreen> createState() => _TodosScreenState();
}

class _TodosScreenState extends State<TodosScreen> {
  TodosVm Todovm = TodosVm();
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
          appBar: AppBar(
            bottom: TabBar(
              tabs: [
                Tab(
                  icon: Icon(Icons.event_note_outlined),

                ),
                Tab(
                  icon: Icon(Icons.event_available),
                ),
                Tab(
                  icon: Icon(Icons.event_busy_sharp),

                ),
                Tab(
                  icon: Icon(Icons.looks_one),

                )
              ],
            ),
          ),
          body:
    // FutureBuilder(
    // future: Todovm.getAllTodos(),
    // builder: (ctx,snapshot){
    // if(snapshot.connectionState==ConnectionState.done)
    // {
    // return ListView.builder(
    // itemCount:snapshot.data!.length ,
    // itemBuilder: (ctx,index){
    // return Container(child: Column(children: [
    // // Image.network(snapshot.data![index].image!),
    // ListTile(title: Text(snapshot.data![index].todo!),
    // leading: CircleAvatar(child: Center(child: Text("${snapshot.data![index].id}"),),),
    // ),
    // ],
    // ),
    // );
    // },
    // );
    // }
    // else
    // return Center(child: CircularProgressIndicator(),);
    //
    // }
    // ),
          FutureBuilder(
              future: Todovm.getAllTodos(),
              builder: (ctx, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  return TabBarView(
                    children: [
                      ListView.builder(
                          itemCount: snapshot.data!.length,
                          itemBuilder: (ctx, index) {
                         return Card(
                             child:
                              ListTile(
                                title: Text("${snapshot.data![index].todo}"),
                                trailing:Text("${snapshot.data?[index].id}") ,
                                subtitle:Text("${snapshot.data![index].userId}") ,
                                leading: Icon(snapshot.data![index].completed!=false?Icons.done_outline:Icons.not_interested),
                              //   leading: Icon(
                              //       (if(snapshot.data![index].completed)
                              //     Icons.Icons.abc
                              //       else
                              //         Icons.Icons.Icons.face
                              //         )
                              // ),
                              ),
                            );
                          }),
                      // ListView.builder(
                      //     itemCount:Todovm.completedTodo.length ,
                      //     itemBuilder: (ctx, index) {
                      //       return Card(
                      //         child:
                      //         ListTile(
                      //           title: Text("${Todovm.completedTodo[index].todo}"),
                      //           trailing:Text("${Todovm.completedTodo[index].id}") ,
                      //           subtitle:Text("${Todovm.completedTodo[index].userId}") ,
                      //           leading: Icon(Todovm.completedTodo[index].completed!=false?Icons.done_outline:Icons.not_interested),
                      //                                        ),
                      //       );
                      //     }),
                      ComplateTodo(),
                      // ListView.builder(
                      //     itemCount:Todovm.notCompletedTodo.length ,
                      //     itemBuilder: (ctx, index) {
                      //       return Card(
                      //         child:
                      //         ListTile(
                      //           title: Text("${Todovm.notCompletedTodo[index].todo}"),
                      //           trailing:Text("${Todovm.notCompletedTodo[index].id}") ,
                      //           subtitle:Text("${Todovm.notCompletedTodo[index].userId}") ,
                      //           leading: Icon(Todovm.notCompletedTodo[index].completed!=false?Icons.done_outline:Icons.not_interested),
                      //         ),
                      //       );
                      //     }),
                      UnComplateTodo(),
                      SingleTodos(),
                    ],
                  );
                }
                else
                  print("SNAPSHOT DATA ${snapshot.data}");

                return Center(
                    child: CircularProgressIndicator(
                      strokeAlign: 3,
                      backgroundColor: Colors.deepOrangeAccent,
                    ));
              }
          )
    ),
    );
    }
  }

// FutureBuilder(
    //     future: Todovm.getAllTodos(),
    //     builder: (ctx, snapshot) {
    //       if (snapshot.connectionState == ConnectionState.done) {
    //         return TabBarView(
    //           children: [
    //                 ListView.builder(
    //                 itemCount: snapshot.data!.length,
    //                 itemBuilder: (ctx, index) {
    //                   Card(
    //                     child: ListTile(
    //                       title: Text("${snapshot.data![index].todo}"),
    //                     ),
    //                   );
    //                 }),
    //             Text("data"),
    //             Text("333"),
    //               ],
    //         );
    //       }
    //       else
    //         print("SNAPSHOT DATA ${snapshot.data}");
    //
    //       return Center(
    //           child: CircularProgressIndicator(
    //         strokeAlign: 3,
    //         backgroundColor: Colors.deepOrangeAccent,
    //       ));
    //     }
    //     )
//     }
//     )
//
//
//
//     ),
//     );
//   }
// }

