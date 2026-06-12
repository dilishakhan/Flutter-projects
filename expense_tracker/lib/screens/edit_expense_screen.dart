import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/expense.dart';
import '../providers/expense_provider.dart';

class EditExpenseScreen extends StatefulWidget {
  final Expense expense;

  const EditExpenseScreen({super.key, required this.expense});

  @override
  State<EditExpenseScreen> createState() => _EditExpenseScreenState();
}

class _EditExpenseScreenState extends State<EditExpenseScreen> {
  late TextEditingController titleController;
  late TextEditingController amountController;

  late String category;
  late DateTime selectedDate;

  @override
  void initState() {
    super.initState();

    titleController = TextEditingController(text: widget.expense.title);

    amountController = TextEditingController(
      text: widget.expense.amount.toString(),
    );

    category = widget.expense.category;

    selectedDate = DateTime.parse(widget.expense.date);
  }

  Future<void> updateExpense() async {
    final updatedExpense = Expense(
      id: widget.expense.id,
      title: titleController.text,
      amount: double.parse(amountController.text),
      category: category,
      date: selectedDate.toString().split(' ')[0],
    );

    await Provider.of<ExpenseProvider>(
      context,
      listen: false,
    ).updateExpense(updatedExpense);

    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Edit Expense")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: titleController,
              decoration: const InputDecoration(labelText: "Title"),
            ),

            const SizedBox(height: 15),

            TextField(
              controller: amountController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: "Amount"),
            ),

            const SizedBox(height: 15),

            ElevatedButton(
              onPressed: updateExpense,
              child: const Text("Update Expense"),
            ),
          ],
        ),
      ),
    );
  }
}
