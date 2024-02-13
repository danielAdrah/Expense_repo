import 'package:flutter/material.dart';
import 'package:my_flutter/components/expense_tile.dart';
import 'package:provider/provider.dart';

import '../data/expense_data.dart';
import '../model/expense_item.dart';
import 'welcome.dart';

class ExpDisplay extends StatefulWidget {
  const ExpDisplay({super.key});

  @override
  State<ExpDisplay> createState() => _ExpDisplayState();
}

class _ExpDisplayState extends State<ExpDisplay> {
  final newExNameController = TextEditingController();
  final newExAmountController = TextEditingController();

  void addNewExpense() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Add a new expense "),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: newExNameController,
              decoration: const InputDecoration(hintText: "Enter Expense"),
            ),
            TextField(
              controller: newExAmountController,
              decoration: const InputDecoration(hintText: "Enter The Cost"),
              keyboardType: TextInputType.number,
            ),
          ],
        ),
        actions: [
          MaterialButton(
            onPressed: () {
              save();
            },
            child: const Text("Save"),
          ),
          MaterialButton(
            onPressed: () {
              cancel();
            },
            child: const Text("Cancel"),
          ),
        ],
      ),
    );
  }

  void deleteExpense(ExpenseItem expense) {
    Provider.of<ExpenseData>(context, listen: false).deleteExpense(expense);
  }

  void save() {
    //first we make sure the all the field are filled so we save the data

    if (newExNameController.text.isNotEmpty &&
        newExAmountController.text.isNotEmpty) {
      //create an expense
      ExpenseItem newExpense = ExpenseItem(
          name: newExNameController.text,
          amount: newExAmountController.text,
          dateTime: DateTime.now());
      //here we add the expense we create to the list
      Provider.of<ExpenseData>(context, listen: false).addExpense(newExpense);
      Navigator.pop(context);
      clear();
    }
  }

  void cancel() {
    Navigator.pop(context);
    clear();
  }

  void clear() {
    newExNameController.clear();
    newExAmountController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Expense && Spending",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.grey[350],
        leading: IconButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const Welcome()));
            },
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.black,
            )),
      ),
      backgroundColor: Colors.grey[300],
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black,
        onPressed: () {
          addNewExpense();
        },
        child: const Icon(Icons.add),
      ),
      body: Consumer<ExpenseData>(builder: (context, value, child) {
        if (value.getAllExpense().isEmpty) {
          return const Center(
            child: Text(
              "No expenses added yet.\nTap the + button to add a new expense.",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16, color: Colors.black38),
            ),
          );
        } else {
          return ListView.builder(
              itemCount: value.getAllExpense().length,
              itemBuilder: (context, index) {
                return ExpenseTile(
                  name: value.getAllExpense()[index].name,
                  amount: value.getAllExpense()[index].amount,
                  dateTime: value.getAllExpense()[index].dateTime,
                  deleteTapped: (p0) =>
                      deleteExpense(value.getAllExpense()[index]),
                );
              });
        }
      }),
    );
  }
}
