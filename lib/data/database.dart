import 'package:hive_flutter/hive_flutter.dart';

class TodoDatabase {
  List todolist = [];
  final _mybox = Hive.box('mybox');

  void createIntialData() {
     todolist = [["Make Tutorial",false],["Prepare Sambar",false]];
  }

  void loadData(){
    todolist = _mybox.get("TODOLIST");
  }
  

  void updateData(){
    _mybox.put("TODOLIST", todolist);
  }
}
