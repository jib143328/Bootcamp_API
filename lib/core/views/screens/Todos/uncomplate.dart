import 'package:flutter/material.dart';

import '../../../view_models/todos_vm.dart';

class UnComplateTodo extends StatefulWidget {
  const UnComplateTodo({super.key});

  @override
  State<UnComplateTodo> createState() => _UnComplateTodoState();
}

class _UnComplateTodoState extends State<UnComplateTodo> {
  TodosVm Todovm = TodosVm();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: Todovm.getUnComplateTodos(),
        builder: (ctx, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return  ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (ctx, index) {
                  return Card(
                    child:
                    ListTile(
                      title: Text("${snapshot.data![index].todo}"),
                      trailing: Text("${snapshot.data?[index].id}"),
                      subtitle: Text("${snapshot.data![index].userId}"),
                      leading: Icon(snapshot.data![index].completed != false ? Icons
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
