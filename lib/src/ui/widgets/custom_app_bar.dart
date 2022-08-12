import 'package:flutter/material.dart';
import 'package:plan_it/src/models/todo_model.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      elevation: 0,
      pinned: true,
      floating: false,
      expandedHeight: 80,
      collapsedHeight: 80,
      actions: [
        Expanded(
          child: Icon(Icons.menu),
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width - 200,
        ),
        Expanded(child: Icon(Icons.search)),
        Expanded(child: Icon(Icons.notifications)),
      ],
    );
  }
}
