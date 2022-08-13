import 'package:flutter/material.dart';

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
