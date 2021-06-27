import 'package:flutter/material.dart';

import '../models/transaction.dart';

import './transaction_item.dart';

//This holds the transactions already made.

class TransactionList extends StatelessWidget {
  final List<Transaction> transactionlist;
  final Function deleteTx;

  TransactionList(this.transactionlist, this.deleteTx);

  @override
  Widget build(BuildContext context) {
    return transactionlist.isEmpty
        ? LayoutBuilder(builder: (ctx, constraints) {
            return Column(
              children: <Widget>[
                Text('No transactions yet!',
                    style: Theme.of(context).textTheme.headline6),
                SizedBox(
                  height: 40,
                ),
                Container(
                    height: constraints.maxHeight * 0.6,
                    child: Image.asset(
                      'assets/images/waiting.png',
                      fit: BoxFit.cover,
                    )),
              ],
            );
          })
        : ListView(
            children: transactionlist
                .map(
                  (tx) => TransactionItem(
                      key: ValueKey(tx.id),
                      transaction: tx,
                      deleteTx: deleteTx),
                )
                .toList(),
          );
    //Mapping list of transactions into a list of cards that show the title of the transaction!
  }
}
