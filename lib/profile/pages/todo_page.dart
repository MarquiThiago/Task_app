import 'package:flutter/material.dart';
import 'add_page.dart';
import '../../global/itens/todo_item.dart';
import '../../global/utilities/my_floating_button.dart';

class TodoPage extends StatefulWidget {
  const TodoPage({Key? key}) : super(key: key);

  @override
  State<TodoPage> createState() => _TodoPageState();
}

class _TodoPageState extends State<TodoPage> {
  final _controller = TextEditingController();
  final _controler = TextEditingController();
  //list of todos
  List todos = [
    ['thiago gostosinhuuuu', '', true],
    ['Lindu', '', false]
  ];

//checkBox was tapped
  void checkBoxChanged(bool? value, int index) {
    setState(() {
      todos[index][2] = !todos[index][2];
    });
  }

  //save new task
  void saveNewTask() {
    setState(() {
      todos.add([_controller.text, _controler.text, false]);
    });

    Navigator.of(context).pop();
    _controller.clear();
    _controler.clear();
  }

//add a new task to the tddo list
  void createNewTask() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) {
          return AddPage(
            secondController: _controler,
            firstController: _controller,
            onSave: saveNewTask,
            onCancel: () => Navigator.of(context).pop(),
          );
        },
      ),
    );
  }

  //delete task
  void onDelete(int index) {
    setState(() {
      todos.removeAt(index);
    });
  }

  void onEdit(int index) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) {
          return AddPage(
            firstController: _controller,
            secondController: _controler,
            onSave: saveNewTask,
            onCancel: () => Navigator.of(context).pop(),
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: todos.length,
        itemBuilder: (context, index) {
          return TodoItem(
            editFunction: (todos) => setState(() {
              onEdit(index);
            }),
            deleteFunction: (context) => setState(() {
              onDelete(index);
            }),
            todoName: todos[index][0],
            todoContent: todos[index][1],
            todoDone: todos[index][2],
            onChanged: (value) => checkBoxChanged(value, index),
          );
        },
      ),
      floatingActionButton: MyFloatingButton(
        icon: Icons.add,
        onPressed: createNewTask,
      ),
    );
  }
}
