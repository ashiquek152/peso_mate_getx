import 'package:hive_flutter/hive_flutter.dart';
part 'transactions_model.g.dart';


@HiveType(typeId: 1)

class TransactionModel {
  @HiveField(1)
  final int amount;

  @HiveField(2)
  final String category;

  @HiveField(3)
  final DateTime dateTime;

  @HiveField(4)
  final String type;

  @HiveField(5)
  int? id;

  TransactionModel({required this.amount,required this.category,required this.dateTime,required this.type,this.id});
}
