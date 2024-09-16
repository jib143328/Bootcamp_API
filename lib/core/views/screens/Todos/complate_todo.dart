import 'package:flutter/material.dart';

import '../../../view_models/todos_vm.dart';

class ComplateTodo extends StatefulWidget {
  const ComplateTodo({super.key});

  @override
  State<ComplateTodo> createState() => _ComplateTodoState();
}

class _ComplateTodoState extends State<ComplateTodo> {
  TodosVm Todovm = TodosVm();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: Todovm.getComplateTodos(),
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
