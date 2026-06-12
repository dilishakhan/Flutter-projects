import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/expense_provider.dart';
import 'add_expense_screen.dart';
import 'edit_expense_screen.dart';
import '../widgets/expense_chart.dart';
import '../widgets/monthly_chart.dart';
import '../widgets/summary_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();

    Future.microtask(() {
      Provider.of<ExpenseProvider>(context, listen: false).loadExpenses();
    });
  }

  IconData getCategoryIcon(String category) {
    switch (category) {
      case "Food":
        return Icons.restaurant;

      case "Travel":
        return Icons.flight;

      case "Shopping":
        return Icons.shopping_bag;

      case "Bills":
        return Icons.receipt;

      case "Health":
        return Icons.health_and_safety;

      default:
        return Icons.movie;
    }
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ExpenseProvider>(context);

    return Scaffold(
      appBar: AppBar(title: const Text('Expense Tracker'), centerTitle: true),

      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: "Search expenses...",
                        prefixIcon: const Icon(Icons.search),

                        filled: true,
                        fillColor: Colors.white,

                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                          borderSide: BorderSide.none,
                        ),
                      ),
                      onChanged: (value) {
                        provider.updateSearch(value);
                      },
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: DropdownButtonFormField<String>(
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,

                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                          borderSide: BorderSide.none,
                        ),
                      ),

                      items: const [
                        DropdownMenuItem(value: "All", child: Text("All")),

                        DropdownMenuItem(value: "Food", child: Text("Food")),

                        DropdownMenuItem(
                          value: "Travel",
                          child: Text("Travel"),
                        ),

                        DropdownMenuItem(
                          value: "Shopping",
                          child: Text("Shopping"),
                        ),

                        DropdownMenuItem(value: "Bills", child: Text("Bills")),

                        DropdownMenuItem(
                          value: "Health",
                          child: Text("Health"),
                        ),

                        DropdownMenuItem(
                          value: "Entertainment",
                          child: Text("Entertainment"),
                        ),
                      ],

                      onChanged: (value) {
                        provider.updateCategoryFilter(value!);
                      },
                    ),
                  ),
                  // Total Expense Card
                  Container(
                    width: double.infinity,
                    margin: const EdgeInsets.all(16),
                    padding: const EdgeInsets.all(24),

                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: [Color(0xFF4F46E5), Color(0xFF7C3AED)],
                      ),
                      borderRadius: BorderRadius.circular(24),
                    ),

                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,

                      children: [
                        const Text(
                          "Total Balance",
                          style: TextStyle(color: Colors.white70, fontSize: 16),
                        ),

                        const SizedBox(height: 12),

                        Text(
                          "₹${provider.totalExpense.toStringAsFixed(2)}",
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 34,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),

                  // Analytics Cards
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: Row(
                      children: [
                        Expanded(
                          child: SummaryCard(
                            title: "Transactions",
                            value: provider.totalTransactions.toString(),
                          ),
                        ),
                        Expanded(
                          child: SummaryCard(
                            title: "Average",
                            value:
                                "₹${provider.averageExpense.toStringAsFixed(0)}",
                          ),
                        ),
                      ],
                    ),
                  ),

                  Card(
                    margin: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 8,
                    ),

                    child: Padding(
                      padding: const EdgeInsets.all(16),

                      child: Row(
                        children: [
                          const Icon(Icons.star),

                          const SizedBox(width: 10),

                          Expanded(child: Text("Highest Spending Category")),

                          Text(
                            provider.highestCategory,
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ),

                  // Pie Chart
                  ExpenseChart(categoryData: provider.categoryTotals),

                  const SizedBox(height: 25),

                  // Monthly Chart
                  MonthlyChart(monthlyData: provider.monthlyTotals),

                  const SizedBox(height: 25),

                  provider.expenses.isEmpty
                      ? const Center(
                          child: Padding(
                            padding: EdgeInsets.all(20),
                            child: Text(
                              'No Expenses Added',
                              style: TextStyle(fontSize: 18),
                            ),
                          ),
                        )
                      : ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: provider.filteredExpenses.length,
                          itemBuilder: (context, index) {
                            final expense = provider.filteredExpenses[index];

                            return Dismissible(
                              key: Key(expense.id.toString()),
                              background: Container(
                                color: Colors.red,
                                alignment: Alignment.centerRight,
                                padding: const EdgeInsets.only(right: 20),
                                child: const Icon(
                                  Icons.delete,
                                  color: Colors.white,
                                ),
                              ),
                              direction: DismissDirection.endToStart,
                              onDismissed: (_) {
                                provider.deleteExpense(expense.id!);
                              },
                              child: Card(
                                elevation: 3,

                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(16),
                                ),

                                margin: const EdgeInsets.symmetric(
                                  horizontal: 16,
                                  vertical: 6,
                                ),

                                child: ListTile(
                                  onTap: () async {
                                    await Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (_) =>
                                            EditExpenseScreen(expense: expense),
                                      ),
                                    );

                                    provider.loadExpenses();
                                  },
                                  leading: CircleAvatar(
                                    backgroundColor: Colors.indigo.shade100,

                                    child: Icon(
                                      getCategoryIcon(expense.category),
                                      color: Colors.indigo,
                                    ),
                                  ),
                                  title: Text(expense.title),
                                  subtitle: Text(
                                    '${expense.category}\n${expense.date}',
                                  ),
                                  trailing: Container(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 12,
                                      vertical: 6,
                                    ),

                                    decoration: BoxDecoration(
                                      color: Colors.green.shade100,

                                      borderRadius: BorderRadius.circular(12),
                                    ),

                                    child: Text(
                                      "₹${expense.amount}",
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                ],
              ),
            ),
          ),
        ],
      ),

      floatingActionButton: FloatingActionButton.extended(
        icon: const Icon(Icons.add),
        label: const Text("Add Expense"),

        onPressed: () async {
          await Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => const AddExpenseScreen()),
          );

          provider.loadExpenses();
        },
      ),
    );
  }
}
