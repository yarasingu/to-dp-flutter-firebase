import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:myapp/data/database.dart';
import 'package:myapp/utill/dialogbox.dart';
import 'package:myapp/utill/to_dotill.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _mybox = Hive.box('mybox');
  TodoDatabase db = TodoDatabase();

  @override
  void initState() {
    if (_mybox.get('TODOLIST') == null) {
      db.createIntialData();
    } else {
      db.loadData();
    }
    super.initState();
  }

  final _controller = TextEditingController();

  void checkBoxChanged(bool? value, int index) {
    setState(() {
      db.todolist[index][1] = !db.todolist[index][1];
    });
    db.updateData();
  }

  void deleteTask(int index) {
    setState(() {
      db.todolist.removeAt(index);
    });
    db.updateData();
  }

  void saveNewTask() {
    setState(() {
      db.todolist.add([_controller.text, false]);
      _controller.clear();
    });
    Navigator.of(context).pop();
    db.updateData();
  }

  void createNewTask() {
    showDialog(
        context: context,
        builder: (context) {
          return DialogBoxs(
            controller: _controller,
            onSave: saveNewTask,
            onCancel: () => Navigator.of(context).pop(),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow[200],
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "TO-DO",
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),
        elevation: 0,
      ),
      floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () {
            createNewTask();
          }),
      body: ListView.builder(
        itemCount: db.todolist.length,
        itemBuilder: (BuildContext context, int index) {
          return ToDoTile(
            taskName: db.todolist[index][0],
            taskCompleted: db.todolist[index][1],
            onChanged: (value) => checkBoxChanged(value, index),
            delete: (context) => deleteTask,
          );
        },
      ),
    );
  }
}
