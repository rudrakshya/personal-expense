import 'package:flutter/material.dart';

class NewTransaction extends StatefulWidget {
  final Function addTxn;

  const NewTransaction(this.addTxn, {Key? key}) : super(key: key);

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleController = TextEditingController();

  final amountController = TextEditingController();

  void submitData() {
    final enteredTitle = titleController.text;
    double enteredAmount = 0;

    if (amountController.text.isNotEmpty) {
      enteredAmount = double.parse(amountController.text);
    }

    if (enteredTitle.isEmpty || enteredAmount <= 0) {
      return;
    }

    widget.addTxn(
      enteredTitle,
      enteredAmount,
    );

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TextField(
              decoration: const InputDecoration(labelText: 'Title'),
              controller: titleController,
              onSubmitted: (_) => submitData(),
            ),
            TextField(
              decoration: const InputDecoration(labelText: 'Amount'),
              controller: amountController,
              keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
              onSubmitted: (_) => submitData(),
            ),
            ElevatedButton(
              onPressed: submitData,
              style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all(Theme.of(context).primaryColor),
              ),
              child: const Text('Add transaction'),
            )
          ],
        ),
      ),
    );
  }
}
