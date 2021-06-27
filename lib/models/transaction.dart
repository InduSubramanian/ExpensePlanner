import 'package:flutter/foundation.dart';

//Not a widget, just a class or model for input?
class Transaction {
  final String title;

  final double amount;

  final DateTime date;

  final String id;

  Transaction(
      {@required this.id,
      @required this.title,
      @required this.amount,
      @required this.date});
}
