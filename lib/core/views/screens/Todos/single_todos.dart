import 'package:flutter/material.dart';

import '../../../view_models/todos_vm.dart';

class SingleTodos extends StatefulWidget {
  const SingleTodos({super.key});

  @override
  State<SingleTodos> createState() => _SingleTodosState();
}
// Todo
class _SingleTodosState extends State<SingleTodos> {
  TodosVm Todovm = TodosVm();

  @override
  Widget build(BuildContext context) {
    return  FutureBuilder(
        future: Todovm.getSinglTodos(5),
        builder: (ctx, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
                  return Card(
                    child:
                    ListTile(
                      title: Text("${snapshot.data?[0].todo}"),
                      trailing: Text("${snapshot.data?[0].id}"),
                      subtitle: Text("${snapshot.data![0].userId}"),
                      leading: Icon(snapshot.data![0].completed != false ? Icons
                          .done_outline : Icons.not_interested),
                      //   leading: Icon(
                      //       (if(snapshot.data![index].completed)
                      //     Icons.Icons.abc
                      //       else
                      //         Icons.Icons.Icons.face
                      //         )
                      // ),
                    ),
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
    );
  }
}
