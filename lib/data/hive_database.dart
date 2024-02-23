import 'package:hive_flutter/hive_flutter.dart';

import '../model/expense_item.dart';

class HiveDataBase {
  //reference the box from the main
  final _myBox = Hive.box("expense_database");

  //write data in
  void saveData(List<ExpenseItem> allExpenseItem) {
    // in hive it is only stores the basic types
    // so we need to convert ExpenseItem objects intp types we can store it in hive
    List<List<dynamic>> allExpenseItemFormated = [];
    for (var exp in allExpenseItem) {
      List<dynamic> expenseFormated = [
        exp.name,
        exp.amount,
        exp.dateTime,
        // here instead we store 'allExpenseItem' immedetly in 'allExpenseItemFormated'
        // we reach for the attributes of the ExpenseItem object and store it in allExpenseItemFormated
        // we can't do this 'allExpenseItemFormated = allExpenseItem' because hive don't sotre objects of ExpenseItem
      ];
      allExpenseItemFormated.add(expenseFormated);
    }

    // store this info in the database
    _myBox.put("All_Expenses", allExpenseItemFormated);
  }

  //read data from

  List<ExpenseItem> readData() {
    //the data that we want to read are stored as 'string , string , dateTime'
    //we should convert them back to be in ExpenseItem type

    List savedExpenses = _myBox.get(
        "All_Expense"); //this to reach the data that we stored in the box(db)
    List<ExpenseItem> allExpense = [];
    for (int i = 0; i < savedExpenses.length; i++) {
      //collect each data at a time 'once the name once the amount ...'
      String name = savedExpenses[i][0];
      String amount = savedExpenses[i][1];
      DateTime dateTime = savedExpenses[i][2];
      ExpenseItem
          expense = //here we create an object of ExpenseItem and give it the att
          ExpenseItem(name: name, amount: amount, dateTime: dateTime);
      allExpense.add(expense);
    }
    return allExpense;
  }
}
