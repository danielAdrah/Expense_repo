import 'package:flutter/material.dart';
import 'package:my_flutter/components/expense_summary.dart';
import 'package:my_flutter/components/welcome.dart';
import 'package:my_flutter/data/expense_data.dart';
import 'package:my_flutter/model/expense_item.dart';
import 'package:provider/provider.dart';

import 'components/expense_tile.dart';
import 'components/expense_tile_graph.dart';

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

  void deleteExpense(ExpenseItem expense) {
    Provider.of<ExpenseData>(context, listen: false).deleteExpense(expense);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ExpenseData>(builder: (context, value, child) {
      return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            "Bar Chart Analysis",
            style: TextStyle(color: Colors.black),
          ),
          backgroundColor: Colors.grey[300],
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
        body: Container(
          color: Colors.grey[300],
          child: ListView(
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
                  return ExpenseTileGraph(
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
        ),
      );
    });
  }
}
