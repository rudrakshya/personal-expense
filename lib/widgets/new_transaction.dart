import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewTransaction extends StatefulWidget {
  final Function addTxn;

  const NewTransaction(this.addTxn, {Key? key}) : super(key: key);

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  late DateTime _selectedDate = DateTime.now();

  void submitData() {
    final enteredTitle = _titleController.text;
    double enteredAmount = 0;

    if (_amountController.text.isNotEmpty) {
      enteredAmount = double.parse(_amountController.text);
    }

    if (enteredTitle.isEmpty || enteredAmount <= 0) {
      return;
    }

    widget.addTxn(
      enteredTitle,
      enteredAmount,
      _selectedDate,
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
              controller: _titleController,
              onSubmitted: (_) => submitData(),
            ),
            TextField(
              decoration: const InputDecoration(labelText: 'Amount'),
              controller: _amountController,
              keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
              onSubmitted: (_) => submitData(),
            ),
            SizedBox(
              height: 80,
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      DateFormat.yMMMd().format(_selectedDate),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () => showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(2019),
                      lastDate: DateTime.now(),
                    ).then((pickedDate) {
                      if (pickedDate == null) {
                        return;
                      }
                      setState(() {
                        _selectedDate = pickedDate;
                      });
                    }),
                    child: const Text('Choose date'),
                  )
                ],
              ),
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
