import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;

  const TransactionList({Key? key, required this.transactions})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 450,
      child: transactions.isEmpty
          ? Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                Text(
                  "No transactions added yet!",
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                Image.asset(
                  'assets/images/undraw_No_data_re_kwbl.png',
                  fit: BoxFit.cover,
                ),
              ],
            )
          : ListView.builder(
              itemBuilder: (context, index) {
                return Card(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 3),
                  elevation: 5,
                  child: ListTile(
                    leading: CircleAvatar(
                      radius: 30,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: FittedBox(
                          child: Text(
                            transactions[index].amount.toString(),
                          ),
                        ),
                      ),
                    ),
                    title: Text(
                      transactions[index].title,
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    subtitle: Text(
                      DateFormat.yMMMd().format(transactions[index].date),
                    ),
                  ),
                );
                // return Card(
                //   child: Row(children: [
                //     Container(
                //       margin: const EdgeInsets.symmetric(
                //           vertical: 7, horizontal: 10),
                //       decoration: BoxDecoration(
                //         border: Border.all(
                //             color: Theme.of(context).primaryColor, width: 2),
                //         borderRadius: BorderRadius.circular(5),
                //       ),
                //       padding: const EdgeInsets.all((15)),
                //       width: 95,
                //       child: Center(
                //         child: Text(
                //           '\$${transactions[index].amount}',
                //           style: TextStyle(
                //             fontWeight: FontWeight.bold,
                //             color: Theme.of(context).primaryColor,
                //             fontSize: 18,
                //           ),
                //         ),
                //       ),
                //     ),
                //     Column(
                //       crossAxisAlignment: CrossAxisAlignment.start,
                //       children: [
                //         Text(
                //           transactions[index].title,
                //           style: Theme.of(context).textTheme.titleMedium,
                //         ),
                //         Text(
                //           DateFormat('dd/MM/yyyy')
                //               .format(transactions[index].date),
                //           style: const TextStyle(
                //             color: Colors.grey,
                //           ),
                //         )
                //       ],
                //     )
                //   ]),
                // );
              },
              itemCount: transactions.length,
            ),
    );
  }
}
