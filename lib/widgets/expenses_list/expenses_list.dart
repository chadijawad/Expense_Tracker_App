import 'package:expense_tracker_app/models/expense.dart';
import 'package:expense_tracker_app/widgets/expenses_list/expenses_item.dart';
import 'package:flutter/material.dart';

class ExpensesList extends StatelessWidget {
  const ExpensesList(
      {required this.expenses, super.key, required this.onRemoveExpense});
  final void Function(Expense expenses) onRemoveExpense;
  final List<Expense> expenses;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: expenses.length,
      itemBuilder: (ctx, index) => Dismissible(
        background: Container(
          color: Theme.of(context).colorScheme.secondaryContainer,
          margin: EdgeInsets.symmetric(
              horizontal: Theme.of(context).cardTheme.margin!.horizontal),
          padding: const EdgeInsets.all(8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Icon(
                Icons.delete,
                color: Theme.of(ctx).colorScheme.onBackground,
              ),
              Text(
                ' <- swipe to delete',
                style: TextStyle(
                    color: Theme.of(context).colorScheme.onPrimaryContainer),
              )
            ],
          ),
        ),
        onDismissed: (direction) {
          onRemoveExpense(expenses[index]);
        },
        key: ValueKey(
          expenses[index],
        ),
        child: ExpensesItem(
          expenses[index],
        ),
      ) //=> immediatly return a value instead of oppening and closing curly braces

      ,
    ); //create elements only when they are needed to be visible opposite of column
  }
}
