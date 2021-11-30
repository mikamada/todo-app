import 'package:flutter/material.dart';

class TodoItem extends StatefulWidget {
  final String title;

  const TodoItem({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  State<TodoItem> createState() => _TodoItemState();
}

class _TodoItemState extends State<TodoItem> {
  bool isDone = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isDone = !isDone;
        });
      },
      child: Container(
        margin: const EdgeInsets.only(
          top: 20,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
        ),
        child: ListTile(
          title: Text(
            widget.title,
            style: TextStyle(
                decoration: isDone ? TextDecoration.lineThrough : null),
          ),
          trailing: isDone
              ? const Icon(
                  Icons.check,
                )
              : const SizedBox(),
        ),
      ),
    );
  }
}
