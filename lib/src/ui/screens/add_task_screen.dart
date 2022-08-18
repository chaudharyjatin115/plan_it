import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddTaskScreen extends StatelessWidget {
  const AddTaskScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
    

    
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            actions: [
              IconButton(
            onPressed: () {},
                icon: Icon(
                  CupertinoIcons.xmark_circle,
                  size: 50,
                ),
              )
            ],
          ),
          SliverToBoxAdapter(
            child: Center(child: Column(children: [])),
          )
        ],
      ),
    );
  }
}
