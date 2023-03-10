import 'package:flutter/material.dart';
import 'package:todoapp/constants/colors.dart';

import '../model/todo.dart';

class ToDoItem extends StatelessWidget {
  final ToDo toDo;
  final onToDoChanged;
  final onDeleteItem;
  const ToDoItem({
    Key? key,
    required this.toDo,
    required this.onToDoChanged,
    required this.onDeleteItem,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(bottom: 20),
        child: ListTile(
          onTap: () {
            onToDoChanged(toDo);
          },
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
          tileColor: Colors.white,
          leading: Icon(
              //this means dynamic it is done and it will be the do it is like selecting and deleting
              toDo.isDone ? Icons.check_box : Icons.check_box_outline_blank,
              color: tdBlue),
          title: Text(
            toDo.todoText!,
            style: TextStyle(
              fontSize: 10,
              color: tdBlack,
              decoration: toDo.isDone ? TextDecoration.lineThrough : null,
            ),
          ),
          trailing: Container(
            padding: EdgeInsets.all(0),
            margin: EdgeInsets.symmetric(vertical: 12),
            height: 35,
            width: 35,
            decoration: BoxDecoration(
              color: tdRed,
              borderRadius: BorderRadius.circular(5),
            ),
            child: IconButton(
              color: Colors.white,
              iconSize: 18,
              onPressed: () {
                onDeleteItem(toDo.id);
              },
              icon: Icon(Icons.delete),
            ),
          ),
        ));
  }
}
