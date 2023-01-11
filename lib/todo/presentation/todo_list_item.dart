import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../domain/todo.dart';

class TodoListItem extends StatelessWidget {
  final Todo todo;
  final VoidCallback? onTap;
  const TodoListItem({
    Key? key,
    required this.todo,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 8.w,
          vertical: 4.w,
        ),
        child: Row(
          children: [
            CircleAvatar(
              child: Text(
                todo.title[0].toUpperCase(),
              ),
            ),
            SizedBox(width: 8.w),
            Text(
              todo.title,
              style: todo.isDone
                  ? const TextStyle(decoration: TextDecoration.lineThrough)
                  : null,
              maxLines: 1,
            ),
          ],
        ),
      ),
    );
  }
}
