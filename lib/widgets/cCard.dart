import 'package:flutter/material.dart';

class TaskCard extends StatefulWidget {
  bool? done;
  String? Textc;
  TaskCard({@required this.done, @required this.Textc});

  @override
  _TaskCardState createState() => _TaskCardState();
}

class _TaskCardState extends State<TaskCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15.0),
      child: Container(
        child: Row(
          children: [
            Text(
              '${widget.Textc}',
              style: TextStyle(fontSize: 20.0),
            ),
            Spacer(flex: 1),
            Container(
              height: 60.0,
              child: Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: Checkbox(
                  checkColor: Color(0xff50e3a4),
                  value: widget.done,
                  shape: CircleBorder(),
                  onChanged: (bool? newValue) {
                    widget.done = newValue;
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
