# Expense Tracker App

A Flutter-based Expense Tracker application that helps users manage daily expenses efficiently. The application allows users to add, edit, delete, search, and filter expenses while providing visual insights through charts and analytics.

## Features

### Expense Management (CRUD)

* Add new expenses
  
* Edit existing expenses
  
* Delete expenses using swipe actions
  
* View all recorded expenses

### Local Database

* SQLite database for persistent local storage
  
* Data remains available even after app restart
  
* Efficient expense retrieval and management

### State Management

* Implemented using Provider
  
* Reactive UI updates
  
* Centralized state handling

### Search & Filtering

* Search expenses by title
  
* Filter expenses by category
  
* Dynamic updates based on user input

### Analytics Dashboard

* Total expense summary
  
* Average expense calculation
  
* Total transaction count
  
* Highest spending category identification

### Data Visualization

* Pie Chart for category-wise expense distribution
  
* Bar Chart for monthly expense analysis
  
* Interactive and user-friendly dashboard

### Categories Supported

* Food
  
* Travel
  
* Shopping
  
* Bills
  
* Health
  
* Entertainment

---

## Technology Stack

### Frontend

* Flutter
  
* Dart

### State Management

* Provider

### Database

* SQLite (sqflite)

### Charts

* fl_chart

### Development Environment

* Android Studio
  
* VS Code

### Containerization

* Docker

---

## Project Structure

```text
lib/
│
├── models/
│   └── expense.dart
│
├── database/
│   └── database_helper.dart
│
├── providers/
│   └── expense_provider.dart
│
├── screens/
│   ├── home_screen.dart
│   ├── add_expense_screen.dart
│   └── edit_expense_screen.dart
│
├── widgets/
│   ├── expense_chart.dart
│   ├── monthly_chart.dart
│   └── summary_card.dart
│
└── main.dart
```

---

## How to Run

### Clone Repository

```bash
git clone <repository-url>
```

### Install Dependencies

```bash
flutter pub get
```

### Run Application

```bash
flutter run
```

---

## Docker Setup

Build Docker Image:

```bash
docker build -t expense-tracker .
```

Run Container:

```bash
docker run expense-tracker
```

---

## Learning Outcomes

This project demonstrates:

* Flutter UI Development
  
* Dart Programming
  
* SQLite Database Integration
  
* State Management using Provider
  
* CRUD Operations
  
* Data Visualization
  
* Local Data Persistence
  
* Docker Fundamentals

---

## Future Enhancements

### Split Expense Feature

A collaborative expense-sharing module can be introduced where multiple users contribute to a shared expense. The application will automatically calculate each participant's share and display how much each person needs to contribute or settle.

Example:

```text
Dinner Bill: ₹2000

Members:
- Alice
- Bob
- Charlie
- David

Contribution Per Person:
₹500 each
```

### Additional Enhancements

* User Authentication
  
* Cloud Synchronization
  
* Budget Planning
  
* Expense Export (PDF/CSV)
  
* Recurring Expenses
  
* Dark Mode
  
* Income Tracking
  
* Financial Reports
  
* AI-based Spending Insights
  
* Multi-user Expense Sharing

---


