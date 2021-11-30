import 'package:flutter/material.dart';
import 'package:to_do_app/models/todo_model.dart';
import 'package:to_do_app/widgets/todo_item.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<TodoModel> todos = [];
  TextEditingController todoController = TextEditingController(text: '');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blueGrey,
        body: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
          ),
          child: Column(
            children: [
              const SizedBox(
                height: 50,
              ),
              // NOTE: TITLE
              const Text(
                'Todo App',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.w500,
                ),
              ),

              Expanded(
                child: Column(
                  children: todos.map((item) {
                    return TodoItem(title: item.title);
                  }).toList(),
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                ),
                margin: const EdgeInsets.only(
                  bottom: 50,
                ),
                height: 50,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          controller: todoController,
                          // onChanged: (value) {
                          //   // ignore: avoid_print
                          //   print(value);
                          // },
                          decoration: const InputDecoration.collapsed(
                              hintText: 'Add todo...'),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          // ignore: avoid_print
                          print(todoController.text);
                          setState(() {
                            todos.add(
                              TodoModel(
                                title: todoController.text,
                                isDone: false,
                              ),
                            );
                            todoController.text = '';
                          });
                        },
                        child: const Icon(Icons.add),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
