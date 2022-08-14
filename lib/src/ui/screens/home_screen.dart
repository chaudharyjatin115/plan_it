import 'package:flutter/material.dart';
import 'package:plan_it/src/ui/screens/add_task_screen.dart';
import 'package:plan_it/src/ui/widgets/custom_app_bar.dart';

import 'package:plan_it/src/ui/widgets/task_category_widget.dart';
import 'package:plan_it/src/ui/widgets/task_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: ((context) => AddTaskScreen()),
              ),
            );
          },
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(40),
              color: Theme.of(context).primaryColor,
            ),
            child: IconButton(
              iconSize: 40,
              icon: Icon(
                Icons.add,
                color: Colors.white,
              ),
              onPressed: (() {}),
            ),
          ),
        ),
        body: CustomScrollView(
          slivers: [
            CustomAppBar(),
            TextHeaderWidget(),
            SliverToBoxAdapter(
                child: SizedBox(
              height: 30,
            )),
            ToDoCategoryWidget(),
            SliverToBoxAdapter(
              child: Container(height: 40),
            ),
            TaskWidget(),
          ],
        ));
  }
}

class TextHeaderWidget extends StatelessWidget {
  const TextHeaderWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.only(left: 39, right: 40),
        child: Container(
            height: 60,
            width: 100,
            child: Text(
              'Whats`up, Olivia',
              style: TextStyle(fontWeight: FontWeight.w900, fontSize: 30),
            )),
      ),
    );
  }
}
