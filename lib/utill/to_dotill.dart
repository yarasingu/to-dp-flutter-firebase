

import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';



class ToDoTile extends StatelessWidget {
  final String taskName;
  final bool taskCompleted;
  Function(bool?)? onChanged;
  Function(BuildContext)? delete;

   ToDoTile({super.key, required this.taskName, required this.taskCompleted,required this.onChanged, required this.delete});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  const EdgeInsets.only(left:25,right: 25,top:25),
      child: Slidable(
        endActionPane: ActionPane(
        motion: const StretchMotion(),
        children: [
          SlidableAction(onPressed: delete,
          icon: Icons.delete,
          backgroundColor: Colors.red,
          borderRadius: BorderRadius.circular(12),
          ),
          
        ],),
        child: Container(
          padding: const EdgeInsets.all(24.0),
          decoration: BoxDecoration(
            color: Colors.yellow,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            children: [
              Checkbox(value: taskCompleted, onChanged: onChanged,activeColor: Colors.black,),
              Text(
                taskName,style: TextStyle(decoration: taskCompleted ? TextDecoration.lineThrough : TextDecoration.none),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
