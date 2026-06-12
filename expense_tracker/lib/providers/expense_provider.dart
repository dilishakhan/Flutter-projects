import 'package:flutter/material.dart';

import '../database/database_helper.dart';
import '../models/expense.dart';

class ExpenseProvider extends ChangeNotifier {
  List<Expense> _expenses = [];

  String _searchQuery = '';
  String _selectedCategory = 'All';

  List<Expense> get expenses => _expenses;

  String get searchQuery => _searchQuery;
  String get selectedCategory => _selectedCategory;

  List<Expense> get filteredExpenses {
    List<Expense> filtered = _expenses;

    if (_searchQuery.isNotEmpty) {
      filtered = filtered.where((expense) {
        return expense.title.toLowerCase().contains(_searchQuery) ||
            expense.category.toLowerCase().contains(_searchQuery);
      }).toList();
    }

    if (_selectedCategory != 'All') {
      filtered = filtered.where((expense) {
        return expense.category == _selectedCategory;
      }).toList();
    }

    return filtered;
  }

  double get totalExpense {
    return _expenses.fold(0, (sum, expense) => sum + expense.amount);
  }

  Map<String, double> get categoryTotals {
    final Map<String, double> totals = {};

    for (var expense in _expenses) {
      totals[expense.category] =
          (totals[expense.category] ?? 0) + expense.amount;
    }

    return totals;
  }

  Map<String, double> get monthlyTotals {
    final Map<String, double> totals = {};

    for (var expense in _expenses) {
      String month = expense.date.substring(0, 7);

      totals[month] = (totals[month] ?? 0) + expense.amount;
    }

    return totals;
  }

  String get highestCategory {
    final totals = categoryTotals;

    if (totals.isEmpty) {
      return "No Data";
    }

    return totals.entries.reduce((a, b) => a.value > b.value ? a : b).key;
  }

  double get averageExpense {
    if (_expenses.isEmpty) {
      return 0;
    }

    return totalExpense / _expenses.length;
  }

  int get totalTransactions {
    return _expenses.length;
  }

  // Load all expenses
  Future<void> loadExpenses() async {
    _expenses = await DatabaseHelper.instance.getExpenses();
    debugPrint("Expenses loaded: ${_expenses.length}");
    notifyListeners();
  }

  // Add expense
  Future<void> addExpense(Expense expense) async {
    debugPrint("Adding expense to DB");
    await DatabaseHelper.instance.insertExpense(expense);

    await loadExpenses();
  }

  // Update expense
  Future<void> updateExpense(Expense expense) async {
    await DatabaseHelper.instance.updateExpense(expense);

    await loadExpenses();
  }

  // Delete expense
  Future<void> deleteExpense(int id) async {
    await DatabaseHelper.instance.deleteExpense(id);

    await loadExpenses();
  }

  void updateSearch(String query) {
    _searchQuery = query.toLowerCase();
    notifyListeners();
  }

  void updateCategoryFilter(String category) {
    _selectedCategory = category;

    notifyListeners();
  }
}
