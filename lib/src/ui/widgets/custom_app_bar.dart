import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
          child: Icon(
            Icons.menu,
            color: Theme.of(context).iconTheme.color,
          ),
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width - 200,
        ),
        const Expanded(child: Icon(CupertinoIcons.search)),
        const Expanded(child: Icon(Icons.notifications)),
      ],
    );
  }
}
