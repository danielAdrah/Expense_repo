import 'package:flutter/material.dart';
import 'package:my_flutter/components/expense_summary.dart';
import 'package:my_flutter/data/expense_data.dart';
import 'package:my_flutter/model/expense_item.dart';
import 'package:provider/provider.dart';

import 'components/expense_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final newExNameController = TextEditingController();
  final newExAmountController = TextEditingController();

  // @override
  // void initState() {
  //   super.initState();
  //   //prepare the data on startup
  //   Provider.of<ExpenseData>(context, listen: false).prepareData();
  // }

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
    return Consumer<ExpenseData>(builder: (context, value, child) {
      return Scaffold(
        backgroundColor: Colors.grey[300],
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.black,
          onPressed: () {
            addNewExpense();
          },
          child: const Icon(Icons.add),
        ),
        body: ListView(
          children: [
            const SizedBox(
              height: 20,
            ),
            ExpenseSummary(startOfWeek: value.startOfWeekDate()),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: value.getAllExpense().length,
              itemBuilder: (context, index) {
                return ExpenseTile(
                  name: value.getAllExpense()[index].name,
                  amount: value.getAllExpense()[index].amount,
                  dateTime: value.getAllExpense()[index].dateTime,
                  deleteTapped: (p0) =>
                      deleteExpense(value.getAllExpense()[index]),
                );
              },
            ),
          ],
        ),
      );
    });
  }
}
