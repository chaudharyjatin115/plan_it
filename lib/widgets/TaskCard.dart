import 'package:flutter/material.dart';

class CardCustom extends StatefulWidget {
  Widget? child;
  Color? cardColor;
  CardCustom({@required this.child, @required this.cardColor});

  @override
  _CardCustomState createState() => _CardCustomState();
}

class _CardCustomState extends State<CardCustom> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
          decoration: BoxDecoration(
              color: widget.cardColor,
              borderRadius: BorderRadius.circular(7.0)),
          height: 80.0,
          child: widget.child),
    );
  }
}

class CheckTile extends StatefulWidget {
  bool? done;
  String? taskName;
  CheckTile({@required this.done, @required this.taskName});

  @override
  _CheckTileState createState() => _CheckTileState();
}

class _CheckTileState extends State<CheckTile> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Container(
          padding: EdgeInsets.only(top: 25.0, bottom: 25.0, left: 8.0),
          child: Expanded(
            child: Text(
              '${widget.taskName}',
              style: TextStyle(fontSize: 16.0),
            ),
          ),
        ),
        Spacer(
          flex: 3,
        ),
        Checkbox(
          value: widget.done,
          onChanged: (bool? newValue) {
            setState(() {});
          },
        ),
      ],
    );
  }
}
