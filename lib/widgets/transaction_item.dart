import "dart:math";

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';

class TransactionItem extends StatefulWidget {
  const TransactionItem({
    Key key,
    @required this.transaction,
    @required this.deleteTx,
  }) : super(key: key);

  final Transaction transaction;
  final Function deleteTx;

  @override
  _TransactionItemState createState() => _TransactionItemState();
}

class _TransactionItemState extends State<TransactionItem> {
  Color _bgColor;

  @override
  void initState() {
    const availableColors = [
      Colors.blue,
      Colors.purple,
      Colors.green,
      Colors.red
    ];

    _bgColor = availableColors[Random().nextInt(4)];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 5, vertical: 8),
      elevation: 6,
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: _bgColor,
          radius: 30,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: FittedBox(
              child: Text('${widget.transaction.amount.toStringAsFixed(2)}/-'),
            ),
          ),
        ),
        title: Text(
          widget.transaction.title,
          style: Theme.of(context).textTheme.headline5,
        ),
        subtitle: Text(
          DateFormat.yMMMd().format(widget.transaction.date),
          style: TextStyle(color: Colors.grey),
        ),
        trailing: MediaQuery.of(context).size.width > 460
            ? FlatButton.icon(
                icon: Icon(Icons.delete),
                label: Text('Delete'),
                textColor: Theme.of(context).errorColor,
                onPressed: () => {
                  widget.deleteTx(widget.transaction.id),
                },
              )
            : IconButton(
                icon: Icon(Icons.delete),
                color: Theme.of(context).errorColor,
                onPressed: () => {
                  widget.deleteTx(widget.transaction.id),
                },
              ),
      ),
    );
  }
}
