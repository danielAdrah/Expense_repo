import 'package:flutter/material.dart';
import 'package:my_flutter/data/hive_database.dart';
import '../dateTime/date_time.dart';
import '../model/expense_item.dart';

class ExpenseData extends ChangeNotifier {
  //list of all the epenses
  List<ExpenseItem> allExpenseList = [];
  //method to get the expensesList
  List<ExpenseItem> getAllExpense() {
    return allExpenseList;
  }

  //prepare the data to display
  // final db = HiveDataBase();
  // void prepareData() {
  //   //check if there is data to display

  //   if (db.readData().isNotEmpty) {
  //     // means if there was or is a data put it in the allExpenseList and it will display them
  //     allExpenseList = db.readData();
  //   }
  // }

  //method to add an expense to the list
  void addExpense(ExpenseItem newExpense) {
    allExpenseList.add(newExpense);
    notifyListeners();
    //db.saveData(allExpenseList);
  }

  //method to delete an expense
  void deleteExpense(ExpenseItem newExpense) {
    allExpenseList.remove(newExpense);
    notifyListeners();
    //db.saveData(allExpenseList);
  }
  

  //method to get the weekley amount
  String getDayName(DateTime dateTime) {
    switch (dateTime.weekday) {
      case 1:
        return 'Mon';
      case 2:
        return 'Tue';
      case 3:
        return 'Wed';
      case 4:
        return 'Thur';
      case 5:
        return 'Fri';
      case 6:
        return 'Sat';
      case 7:
        return 'Sun';

      default:
        return '';
    }
  }

  //get the date from the start of the wwek
  DateTime startOfWeekDate() {
    DateTime today = DateTime.now();
    // Calculate the difference between today and the start of the week
    int daysSinceStartOfWeek = today.weekday % 7;
    // Subtract the number of days since the start of the week from today
    DateTime startOfWeek = today.subtract(Duration(days: daysSinceStartOfWeek));
    return startOfWeek; //change
  }

  Map<String, double> calculateDailyExpenseSummary() {
    Map<String, double> dailyExpenseSummary = {};
    for (var expense in allExpenseList) {
      String date = convertDateTimeToString(expense.dateTime);
      double amount = double.parse(expense.amount);
      //here we check wheater the expense we want to add it is exist
      //dont need to create a new date for it , just add the amount to that existing date
      if (dailyExpenseSummary.containsKey(date)) {
        double currentAmount = dailyExpenseSummary[date]!;
        currentAmount += amount;
        dailyExpenseSummary[date] = currentAmount;
      } else {
        //if its the first tiem we add it just create a new date for it
        dailyExpenseSummary.addAll({date: amount});
      }
    }
    return dailyExpenseSummary;
  }
}
